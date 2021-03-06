/**
 * @file src/Kernel/poski_Kernel_matmult.c
 * @brief Handle the Sparse matrix-vector computations.
 *
 *  This module implements the sparse mtarix-vector computations.
 *
 * @attention These routines are for the library's internal use only
 *  and should not normally be called directly by users.
 * @attention Called by 
 * @ref poski_KernelHandler.c
 *
 * Also, refer 
 * @ref poski_Kernel_common.c
 */

#include <stdio.h>
#include <stdlib.h>

#include <poski/poski_config.h>
#if defined( HAVE_PTHREAD_H )
#	include <pthread.h>
#	define _USE_PTHREAD	1
#endif
#if defined( HAVE_OPENMP_H )
#	include <omp.h>
#	define _USE_OPENMP	1
#endif

#include <poski/poski_partition.h>
#include <poski/poski_partitioncommon.h>
#include <poski/poski_kernelcommon.h>
#include <poski/poski_threadcommon.h>
#include <poski/poski_matrixcommon.h>
#include <poski/poski_malloc.h>
#include <poski/poski_print.h>

/**
 * @internal
 * @brief [library's internal use] Set parameters for matrix-vector multiplication (SpMV, SpMTV).
 */
static poski_matmult_t *poski_SetMatMult (poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_int_t nthreads = A->threadargs.nthreads;
	poski_int_t npartitions = A->partitionargs.npartitions;
	int num_partitions = (int)(npartitions/nthreads);

	poski_matmult_t *kernel = poski_malloc(poski_matmult_t, nthreads, 0);

	int tid;
	for (tid=0; tid<nthreads; tid++)
	{
		int start = tid*num_partitions;
		kernel[tid].tid = tid;
		kernel[tid].num_partitions = num_partitions;
		kernel[tid].submat = &A->submatrix[start];
		kernel[tid].op = op;
		kernel[tid].alpha = alpha;
		kernel[tid].beta = beta;
		kernel[tid].x = &x->subvector[start];
		kernel[tid].y = &y->subvector[start];
	}

	return kernel;
}

/**
 * @internal
 * @brief [library's internal use] Operate a sparse matrix-vector computation in a single thread for Pthread model. 
 */
#if defined( _USE_PTHREAD )
static void *MatMult_Pthread(void *threads)
{
	poski_matmult_t *thread = (poski_matmult_t *)threads;

	// cpu set affinity
	poski_SetAffinity_np(thread->tid);
	
	int pid;
	int num_partitions = thread->num_partitions;
	poski_submat_t *A = thread->submat;
	poski_operation_t op = thread->op;
	poski_value_t alpha = thread->alpha;
	poski_value_t beta = thread->beta;
	poski_subvec_t *x = thread->x;
	poski_subvec_t *y = thread->y;

	#pragma unroll	
	for (pid=0; pid<num_partitions; pid++)
	{
		poski_SubMatMult(A[pid].submat, op, alpha, x[pid].subvec, beta, y[pid].subvec);
	}

	pthread_exit(NULL);
}

/** 
 * @brief [library's internal use] Perform a sparse matrix-vector computation using Pthread.
 * @internal
 * @return 0 if success, or an error message otherwise. 
 */
static int poski_MatMult_pthread(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_int_t nthreads = A->threadargs.nthreads;
	
	// [parallel] Local malloc, NUMA, assume (npartitions%nthreads = {1, 2, ...})
	poski_pthread_t *threads = poski_malloc(poski_pthread_t, nthreads, 0);
	poski_matmult_t *kernel = (poski_matmult_t *)A->kernel; 

	int tid;
	for (tid=0; tid<nthreads; tid++)
	{
		pthread_create(&threads[tid], NULL, MatMult_Pthread, (void *)&kernel[tid]);
	}

	for (tid=0; tid<nthreads; tid++)
	{
		pthread_join(threads[tid], NULL);
	}

	poski_free(threads);

	return 0;
}
#else
static int poski_MatMult_pthread(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_error("poski_MatMult_pthread", "The pOSKI library was not built with <pthread.h>");
	return -1;
}
#endif

/**
 * @internal
 * @brief [library's internal use] Operate a sparse matrix-vector computation in a single thread for OpenMP model. 
 */
#if defined ( _USE_OPENMP )
void MatMult_OpenMP(void *threads)
{
	poski_matmult_t *thread = (poski_matmult_t *)threads;

	// cpu set affinity
	poski_SetAffinity_np(thread->tid);

	int pid;
	int num_partitions = thread->num_partitions;
	poski_submat_t *A = thread->submat;
	poski_operation_t op = thread->op;
	poski_value_t alpha = thread->alpha;
	poski_value_t beta = thread->beta;
	poski_subvec_t *x = thread->x;
	poski_subvec_t *y = thread->y;

	for (pid=0; pid<num_partitions; pid++)
	{
		poski_SubMatMult(A[pid].submat, op, alpha, x[pid].subvec, beta, y[pid].subvec);
	}
}

/**
 * @brief [library's internal use] Perform an sparse matrix-vector computation using the OpenMP.
 * @internal
 * @return 0 if success, or an error message otherwise.
 */
static int poski_MatMult_openmp(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_int_t nthreads = A->threadargs.nthreads;

	int tid;
	
	// [parallel] Local malloc, NUMA, assume (npartitions%nthreads = {1, 2, ...})
	poski_matmult_t *kernel = (poski_matmult_t *)A->kernel; 

	#pragma omp parallel for num_threads(nthreads)
	for (tid=0; tid<nthreads; tid++)
	{
		MatMult_OpenMP((void *)&kernel[tid]);
	}

	return 0;
}
#else
static int poski_MatMult_openmp(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_error("poski_MatMult_openmp", "The pOSKI library was not built with <omp.h>");
	return -1;
}
#endif

/**
 * @brief [library's internal use] Perform an sparse matrix-vector computation using the threadpool.
 * @internal
 * @return 0 if success, or an error message otherwise.
 */
#if defined ( _USE_PTHREAD )
static int poski_MatMult_threadpool(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_int_t nthreads = A->threadargs.nthreads;
	poski_threadpool_t *threadpool = A->threadargs.thread;

	int tid;
	
	// [parallel] Local malloc, NUMA, assume (npartitions%nthreads = {1, 2, ...})
	poski_matmult_t *kernel = (poski_matmult_t *)A->kernel; 

	for (tid=0; tid<nthreads; tid++)
	{
		threadpool[tid].Job = KERNEL_MatMult;
		threadpool[tid].kernel = ((void *)&kernel[tid]);
	}
	poski_barrier_wait (threadpool->StartBarrier, (nthreads+1));
	poski_barrier_wait (threadpool->EndBarrier, (nthreads+1));


	return 0;
}
#else
static int poski_MatMult_threadpool(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_error("poski_MatMult_threadpool", "The pOSKI library was not built with <pthread.h>");
	return -1;
}
#endif

/** 
 * @brief [library's internal use] Perform an sparse matrix-vector computation using the selected threading model.
 * @internal
 * @param[in] A Sparse matrix object.
 * @param[in] op Specifies the transpose operations, \f$op(A)\f$ in {OP_NORMAL, OP_TRANS}.
 * @param[in] alpha Scalar multiplier.
 * @param[in] x Vector view object.
 * @param[in] beta Scalar multiplier.
 * @param[in] y Vector view object.
 *
 * @return 0 if success, or an error message otherwise.
 */
int poski_MatMult_run(poski_mat_t A, poski_operation_t op, poski_value_t alpha, poski_vec_t x, poski_value_t beta, poski_vec_t y)
{
	poski_value_t beta1 = beta;
	if (A->partitionargs.ptype == SemiOneD) beta1 = 0.0;
	if (A->partitionargs.ptype == OneD && op==OP_TRANS) beta1=0.0;

	A->kernel = (void *)poski_SetMatMult(A, op, alpha, x, beta1, y);

	if (A->threadargs.ttype == POSKI_PTHREAD)
		poski_MatMult_pthread(A, op, alpha, x, beta1, y);
	else if (A->threadargs.ttype == POSKI_OPENMP)
		poski_MatMult_openmp(A, op, alpha, x, beta1, y);
	else if (A->threadargs.ttype == POSKI_THREADPOOL)
		poski_MatMult_threadpool(A, op, alpha, x, beta1, y);
	return 0;	// success!

	poski_free(A->kernel);
}

/** 
 * @brief [library's internal use] Partition-check for an appropriate kernel operation \f$op(A)\f$.
 * @internal
 * @param[in] A tunable matrix object.
 * @param[in] op Specifies the transpose operations, \f$op(A)\f$ in {OP_NORMAL, OP_TRANS}.
 * @param[in] ktype Specifes the kernel type in {KERNEL_MatMult}.
 * @param[in,out] x Vector view object.
 * @param[in,out] y Vector view object.
 *
 * @return 0 if success, or an error message otherwise.
 */
int poski_Check_PartitionVecMatMult(poski_mat_t A, poski_operation_t op, poski_kernel_t ktype, poski_vec_t x, poski_vec_t y)
{
	if (poski_Check_partitionedVec(A, x, KERNEL_MatMult, op, INPUTVEC) != 0) 
	{	
		poski_printMessage(2, "Create input vector...\n");
		x->partitionvec = poski_PartitionVecHints(A, KERNEL_MatMult, op, INPUTVEC);
		x->subvector = (poski_subvec_t *)poski_PartitionVec(x->vec, x->length, x->inc, x->partitionvec);	
	}
	if (poski_Check_partitionedVec(A, y, KERNEL_MatMult, op, OUTPUTVEC) != 0) 
	{
		poski_printMessage(2, "Create output vector...\n");
		y->partitionvec = poski_PartitionVecHints(A, KERNEL_MatMult, op, OUTPUTVEC);	
		y->subvector = poski_PartitionVec(y->vec, y->length, y->inc, y->partitionvec);
	}

	return 0;
}


