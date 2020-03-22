/**
 *  \file src/MBCSR/MatMult/4x2.c
 *  \brief MBCSR 4x2 SpMV implementation, for all transpose options.
 *  \ingroup MATTYPE_MBCSR
 *
 *  Automatically generated by ./gen.sh on Wed Jun  8 15:52:21 PDT 2005.
 */

#include <assert.h>

#include <oski/config.h> /* for 'restrict' keyword */
#include <oski/common.h>
#include <oski/mangle.h>
#include <oski/vecview.h>
#include <oski/MBCSR/format.h>
#include <oski/MBCSR/module.h>

#if IS_VAL_COMPLEX
/** Complex-valued, so do not use explicit 'register' keyword */
#define REGISTER
#else
/** Real-valued, so use explicit 'register' keyword */
#define REGISTER register
#endif



#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMult_v1_aX_b1_xs1_ysX */
#define MBCSR_MatMult_v1_aX_b1_xs1_ysX MANGLE_MOD_(MBCSR_MatMult_v1_aX_b1_xs1_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot A\cdot x\f$.
 */
void
MBCSR_MatMult_v1_aX_b1_xs1_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy )
{
	oski_value_t* yp;
	oski_index_t I;

	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		oski_index_t K;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			const oski_value_t* xp = x + j0;

			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_MAC( _y0, bval[0], _x0 );
			VAL_MAC( _y1, bval[2], _x0 );
			VAL_MAC( _y2, bval[4], _x0 );
			VAL_MAC( _y3, bval[6], _x0 );
			VAL_MAC( _y0, bval[1], _x1 );
			VAL_MAC( _y1, bval[3], _x1 );
			VAL_MAC( _y2, bval[5], _x1 );
			VAL_MAC( _y3, bval[7], _x1 );
		}
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
	}
	/* Diagonal block multiply */
	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		const oski_value_t* xp = x + (d0 + I*4);
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_ASSIGN( _x0, xp[0] );
		VAL_ASSIGN( _x1, xp[1] );
		VAL_ASSIGN( _x2, xp[2] );
		VAL_ASSIGN( _x3, xp[3] );
		VAL_MAC( _y0, bdiag[0], _x0 );
		VAL_MAC( _y1, bdiag[4], _x0 );
		VAL_MAC( _y2, bdiag[8], _x0 );
		VAL_MAC( _y3, bdiag[12], _x0 );
		VAL_MAC( _y0, bdiag[1], _x1 );
		VAL_MAC( _y1, bdiag[5], _x1 );
		VAL_MAC( _y2, bdiag[9], _x1 );
		VAL_MAC( _y3, bdiag[13], _x1 );
		VAL_MAC( _y0, bdiag[2], _x2 );
		VAL_MAC( _y1, bdiag[6], _x2 );
		VAL_MAC( _y2, bdiag[10], _x2 );
		VAL_MAC( _y3, bdiag[14], _x2 );
		VAL_MAC( _y0, bdiag[3], _x3 );
		VAL_MAC( _y1, bdiag[7], _x3 );
		VAL_MAC( _y2, bdiag[11], _x3 );
		VAL_MAC( _y3, bdiag[15], _x3 );
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
		bdiag += 4*4;
	}
}


#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMult_v1_aX_b1_xsX_ysX */
#define MBCSR_MatMult_v1_aX_b1_xsX_ysX MANGLE_MOD_(MBCSR_MatMult_v1_aX_b1_xsX_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot A\cdot x\f$.
 */
void
MBCSR_MatMult_v1_aX_b1_xsX_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy )
{
	oski_value_t* yp;
	oski_index_t I;

	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		oski_index_t K;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			const oski_value_t* xp = x + j0*incx;

			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_MAC( _y0, bval[0], _x0 );
			VAL_MAC( _y1, bval[2], _x0 );
			VAL_MAC( _y2, bval[4], _x0 );
			VAL_MAC( _y3, bval[6], _x0 );
			VAL_MAC( _y0, bval[1], _x1 );
			VAL_MAC( _y1, bval[3], _x1 );
			VAL_MAC( _y2, bval[5], _x1 );
			VAL_MAC( _y3, bval[7], _x1 );
		}
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
	}
	/* Diagonal block multiply */
	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		const oski_value_t* xp = x + (d0 + I*4)*incx;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_ASSIGN( _x0, xp[0] );
		VAL_ASSIGN( _x1, xp[1*incx] );
		VAL_ASSIGN( _x2, xp[2*incx] );
		VAL_ASSIGN( _x3, xp[3*incx] );
		VAL_MAC( _y0, bdiag[0], _x0 );
		VAL_MAC( _y1, bdiag[4], _x0 );
		VAL_MAC( _y2, bdiag[8], _x0 );
		VAL_MAC( _y3, bdiag[12], _x0 );
		VAL_MAC( _y0, bdiag[1], _x1 );
		VAL_MAC( _y1, bdiag[5], _x1 );
		VAL_MAC( _y2, bdiag[9], _x1 );
		VAL_MAC( _y3, bdiag[13], _x1 );
		VAL_MAC( _y0, bdiag[2], _x2 );
		VAL_MAC( _y1, bdiag[6], _x2 );
		VAL_MAC( _y2, bdiag[10], _x2 );
		VAL_MAC( _y3, bdiag[14], _x2 );
		VAL_MAC( _y0, bdiag[3], _x3 );
		VAL_MAC( _y1, bdiag[7], _x3 );
		VAL_MAC( _y2, bdiag[11], _x3 );
		VAL_MAC( _y3, bdiag[15], _x3 );
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
		bdiag += 4*4;
	}
}


/**
 *  \brief Matrix times single-vector multiply in the normal case.
 */
static void
MatMult_v1( oski_index_t M, oski_index_t d0,
	const oski_index_t* bptr, const oski_index_t* bind,
	const oski_value_t* bval, const oski_value_t* bdiag,
	oski_value_t alpha, const oski_value_t* x, oski_index_t incx,
	oski_value_t* y, oski_index_t incy )
{
	if( incx == 1 )
		MBCSR_MatMult_v1_aX_b1_xs1_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, y, incy );
	else
		MBCSR_MatMult_v1_aX_b1_xsX_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y, incy );
}


/**
 *  \brief Computes
 *  \f$y \leftarrow y + \alpha\cdot\mathrm{op}(A)\cdot x\f$,
 *  where \f$\mathrm{op}(A) = A\f$, on the fully blocked
 *  portion of \f$A\f$.
 */
static int
MatMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x_view,
	oski_vecview_t y_view )
{
	oski_index_t j; /* column number */
	const oski_value_t* xpj; /* X(:, j) */
	oski_value_t* ypj; /* Y(:, j) */

	assert( A->r == 4 );
	assert( A->c == 2 );

	for( j = 0, xpj = x_view->val, ypj = y_view->val;
		j < x_view->num_cols;
		j++, xpj += x_view->colinc, ypj += y_view->colinc )
	{
		MatMult_v1( A->num_block_rows, A->offset,
			A->bptr, A->bind, A->bval, A->bdiag,
			alpha, xpj, x_view->rowinc, ypj, y_view->rowinc );
	}

	return 0;
}


#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatTransMult_v1_aX_b1_xsX_ys1 */
#define MBCSR_MatTransMult_v1_aX_b1_xsX_ys1 MANGLE_MOD_(MBCSR_MatTransMult_v1_aX_b1_xsX_ys1_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot A^T\cdot x\f$.
 */
void
MBCSR_MatTransMult_v1_aX_b1_xsX_ys1( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y )
{
	const oski_value_t* xp;
	oski_index_t I;

	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		oski_index_t K;

		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			oski_value_t* yp = y + j0;

			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_MAC( _y0, bval[0], _x0 );
			VAL_MAC( _y1, bval[1], _x0 );
			VAL_MAC( _y0, bval[2], _x1 );
			VAL_MAC( _y1, bval[3], _x1 );
			VAL_MAC( _y0, bval[4], _x2 );
			VAL_MAC( _y1, bval[5], _x2 );
			VAL_MAC( _y0, bval[6], _x3 );
			VAL_MAC( _y1, bval[7], _x3 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1], _y1 );
		}
	}
	/* Diagonal block multiply */
	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		oski_value_t* yp = y + (d0 + I*4);
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_MAC( _y0, bdiag[0], _x0 );
		VAL_MAC( _y1, bdiag[1], _x0 );
		VAL_MAC( _y2, bdiag[2], _x0 );
		VAL_MAC( _y3, bdiag[3], _x0 );
		VAL_MAC( _y0, bdiag[4], _x1 );
		VAL_MAC( _y1, bdiag[5], _x1 );
		VAL_MAC( _y2, bdiag[6], _x1 );
		VAL_MAC( _y3, bdiag[7], _x1 );
		VAL_MAC( _y0, bdiag[8], _x2 );
		VAL_MAC( _y1, bdiag[9], _x2 );
		VAL_MAC( _y2, bdiag[10], _x2 );
		VAL_MAC( _y3, bdiag[11], _x2 );
		VAL_MAC( _y0, bdiag[12], _x3 );
		VAL_MAC( _y1, bdiag[13], _x3 );
		VAL_MAC( _y2, bdiag[14], _x3 );
		VAL_MAC( _y3, bdiag[15], _x3 );
		VAL_INC( yp[0], _y0 );
		VAL_INC( yp[1], _y1 );
		VAL_INC( yp[2], _y2 );
		VAL_INC( yp[3], _y3 );
		bdiag += 4*4;
	}
}


#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatTransMult_v1_aX_b1_xsX_ysX */
#define MBCSR_MatTransMult_v1_aX_b1_xsX_ysX MANGLE_MOD_(MBCSR_MatTransMult_v1_aX_b1_xsX_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot A^T\cdot x\f$.
 */
void
MBCSR_MatTransMult_v1_aX_b1_xsX_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy )
{
	const oski_value_t* xp;
	oski_index_t I;

	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		oski_index_t K;

		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			oski_value_t* yp = y + j0*incy;

			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_MAC( _y0, bval[0], _x0 );
			VAL_MAC( _y1, bval[1], _x0 );
			VAL_MAC( _y0, bval[2], _x1 );
			VAL_MAC( _y1, bval[3], _x1 );
			VAL_MAC( _y0, bval[4], _x2 );
			VAL_MAC( _y1, bval[5], _x2 );
			VAL_MAC( _y0, bval[6], _x3 );
			VAL_MAC( _y1, bval[7], _x3 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1*incy], _y1 );
		}
	}
	/* Diagonal block multiply */
	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		oski_value_t* yp = y + (d0 + I*4)*incy;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_MAC( _y0, bdiag[0], _x0 );
		VAL_MAC( _y1, bdiag[1], _x0 );
		VAL_MAC( _y2, bdiag[2], _x0 );
		VAL_MAC( _y3, bdiag[3], _x0 );
		VAL_MAC( _y0, bdiag[4], _x1 );
		VAL_MAC( _y1, bdiag[5], _x1 );
		VAL_MAC( _y2, bdiag[6], _x1 );
		VAL_MAC( _y3, bdiag[7], _x1 );
		VAL_MAC( _y0, bdiag[8], _x2 );
		VAL_MAC( _y1, bdiag[9], _x2 );
		VAL_MAC( _y2, bdiag[10], _x2 );
		VAL_MAC( _y3, bdiag[11], _x2 );
		VAL_MAC( _y0, bdiag[12], _x3 );
		VAL_MAC( _y1, bdiag[13], _x3 );
		VAL_MAC( _y2, bdiag[14], _x3 );
		VAL_MAC( _y3, bdiag[15], _x3 );
		VAL_INC( yp[0], _y0 );
		VAL_INC( yp[1*incy], _y1 );
		VAL_INC( yp[2*incy], _y2 );
		VAL_INC( yp[3*incy], _y3 );
		bdiag += 4*4;
	}
}


/**
 *  \brief Matrix times single-vector multiply in the trans case.
 */
static void
MatTransMult_v1( oski_index_t M, oski_index_t d0,
	const oski_index_t* bptr, const oski_index_t* bind,
	const oski_value_t* bval, const oski_value_t* bdiag,
	oski_value_t alpha, const oski_value_t* x, oski_index_t incx,
	oski_value_t* y, oski_index_t incy )
{
	if( incy == 1 )
		MBCSR_MatTransMult_v1_aX_b1_xsX_ys1( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y );
	else
		MBCSR_MatTransMult_v1_aX_b1_xsX_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y, incy );
}


/**
 *  \brief Computes
 *  \f$y \leftarrow y + \alpha\cdot\mathrm{op}(A)\cdot x\f$,
 *  where \f$\mathrm{op}(A) = A^T\f$, on the fully blocked
 *  portion of \f$A\f$.
 */
static int
MatTransMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x_view,
	oski_vecview_t y_view )
{
	oski_index_t j; /* column number */
	const oski_value_t* xpj; /* X(:, j) */
	oski_value_t* ypj; /* Y(:, j) */

	assert( A->r == 4 );
	assert( A->c == 2 );

	for( j = 0, xpj = x_view->val, ypj = y_view->val;
		j < x_view->num_cols;
		j++, xpj += x_view->colinc, ypj += y_view->colinc )
	{
		MatTransMult_v1( A->num_block_rows, A->offset,
			A->bptr, A->bind, A->bval, A->bdiag,
			alpha, xpj, x_view->rowinc, ypj, y_view->rowinc );
	}

	return 0;
}


#if !IS_VAL_COMPLEX

#if defined(DO_NAME_MANGLING)
/** See MBCSR_MatMult_v1_aX_b1_xs1_ysX(). */
#define MBCSR_MatConjMult_v1_aX_b1_xs1_ysX MBCSR_MatMult_v1_aX_b1_xs1_ysX
#endif

#else /* IS_VAL_COMPLEX */



#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatConjMult_v1_aX_b1_xs1_ysX */
#define MBCSR_MatConjMult_v1_aX_b1_xs1_ysX MANGLE_MOD_(MBCSR_MatConjMult_v1_aX_b1_xs1_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot \bar{A}\cdot x\f$.
 */
void
MBCSR_MatConjMult_v1_aX_b1_xs1_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy )
{
	oski_value_t* yp;
	oski_index_t I;

	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		oski_index_t K;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			const oski_value_t* xp = x + j0;

			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_MAC_CONJ( _y0, bval[0], _x0 );
			VAL_MAC_CONJ( _y1, bval[2], _x0 );
			VAL_MAC_CONJ( _y2, bval[4], _x0 );
			VAL_MAC_CONJ( _y3, bval[6], _x0 );
			VAL_MAC_CONJ( _y0, bval[1], _x1 );
			VAL_MAC_CONJ( _y1, bval[3], _x1 );
			VAL_MAC_CONJ( _y2, bval[5], _x1 );
			VAL_MAC_CONJ( _y3, bval[7], _x1 );
		}
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
	}
	/* Diagonal block multiply */
	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		const oski_value_t* xp = x + (d0 + I*4);
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_ASSIGN( _x0, xp[0] );
		VAL_ASSIGN( _x1, xp[1] );
		VAL_ASSIGN( _x2, xp[2] );
		VAL_ASSIGN( _x3, xp[3] );
		VAL_MAC_CONJ( _y0, bdiag[0], _x0 );
		VAL_MAC_CONJ( _y1, bdiag[4], _x0 );
		VAL_MAC_CONJ( _y2, bdiag[8], _x0 );
		VAL_MAC_CONJ( _y3, bdiag[12], _x0 );
		VAL_MAC_CONJ( _y0, bdiag[1], _x1 );
		VAL_MAC_CONJ( _y1, bdiag[5], _x1 );
		VAL_MAC_CONJ( _y2, bdiag[9], _x1 );
		VAL_MAC_CONJ( _y3, bdiag[13], _x1 );
		VAL_MAC_CONJ( _y0, bdiag[2], _x2 );
		VAL_MAC_CONJ( _y1, bdiag[6], _x2 );
		VAL_MAC_CONJ( _y2, bdiag[10], _x2 );
		VAL_MAC_CONJ( _y3, bdiag[14], _x2 );
		VAL_MAC_CONJ( _y0, bdiag[3], _x3 );
		VAL_MAC_CONJ( _y1, bdiag[7], _x3 );
		VAL_MAC_CONJ( _y2, bdiag[11], _x3 );
		VAL_MAC_CONJ( _y3, bdiag[15], _x3 );
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
		bdiag += 4*4;
	}
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX

#if defined(DO_NAME_MANGLING)
/** See MBCSR_MatMult_v1_aX_b1_xsX_ysX(). */
#define MBCSR_MatConjMult_v1_aX_b1_xsX_ysX MBCSR_MatMult_v1_aX_b1_xsX_ysX
#endif

#else /* IS_VAL_COMPLEX */



#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatConjMult_v1_aX_b1_xsX_ysX */
#define MBCSR_MatConjMult_v1_aX_b1_xsX_ysX MANGLE_MOD_(MBCSR_MatConjMult_v1_aX_b1_xsX_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot \bar{A}\cdot x\f$.
 */
void
MBCSR_MatConjMult_v1_aX_b1_xsX_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy )
{
	oski_value_t* yp;
	oski_index_t I;

	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		oski_index_t K;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			const oski_value_t* xp = x + j0*incx;

			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_MAC_CONJ( _y0, bval[0], _x0 );
			VAL_MAC_CONJ( _y1, bval[2], _x0 );
			VAL_MAC_CONJ( _y2, bval[4], _x0 );
			VAL_MAC_CONJ( _y3, bval[6], _x0 );
			VAL_MAC_CONJ( _y0, bval[1], _x1 );
			VAL_MAC_CONJ( _y1, bval[3], _x1 );
			VAL_MAC_CONJ( _y2, bval[5], _x1 );
			VAL_MAC_CONJ( _y3, bval[7], _x1 );
		}
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
	}
	/* Diagonal block multiply */
	for( I = 0, yp = y + d0*incy; I < M; I++, yp += 4*incy )
	{
		const oski_value_t* xp = x + (d0 + I*4)*incx;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_ASSIGN( _x0, xp[0] );
		VAL_ASSIGN( _x1, xp[1*incx] );
		VAL_ASSIGN( _x2, xp[2*incx] );
		VAL_ASSIGN( _x3, xp[3*incx] );
		VAL_MAC_CONJ( _y0, bdiag[0], _x0 );
		VAL_MAC_CONJ( _y1, bdiag[4], _x0 );
		VAL_MAC_CONJ( _y2, bdiag[8], _x0 );
		VAL_MAC_CONJ( _y3, bdiag[12], _x0 );
		VAL_MAC_CONJ( _y0, bdiag[1], _x1 );
		VAL_MAC_CONJ( _y1, bdiag[5], _x1 );
		VAL_MAC_CONJ( _y2, bdiag[9], _x1 );
		VAL_MAC_CONJ( _y3, bdiag[13], _x1 );
		VAL_MAC_CONJ( _y0, bdiag[2], _x2 );
		VAL_MAC_CONJ( _y1, bdiag[6], _x2 );
		VAL_MAC_CONJ( _y2, bdiag[10], _x2 );
		VAL_MAC_CONJ( _y3, bdiag[14], _x2 );
		VAL_MAC_CONJ( _y0, bdiag[3], _x3 );
		VAL_MAC_CONJ( _y1, bdiag[7], _x3 );
		VAL_MAC_CONJ( _y2, bdiag[11], _x3 );
		VAL_MAC_CONJ( _y3, bdiag[15], _x3 );
		VAL_MAC( yp[0], alpha, _y0 );
		VAL_MAC( yp[1*incy], alpha, _y1 );
		VAL_MAC( yp[2*incy], alpha, _y2 );
		VAL_MAC( yp[3*incy], alpha, _y3 );
		bdiag += 4*4;
	}
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX
/**
 *  \brief Matrix times single-vector multiply in the conj case;
 *  see MatMult_v1().
 */
#define MatConjMult_v1 MatMult_v1

#else /* IS_VAL_COMPLEX */


/**
 *  \brief Matrix times single-vector multiply in the conj case.
 */
static void
MatConjMult_v1( oski_index_t M, oski_index_t d0,
	const oski_index_t* bptr, const oski_index_t* bind,
	const oski_value_t* bval, const oski_value_t* bdiag,
	oski_value_t alpha, const oski_value_t* x, oski_index_t incx,
	oski_value_t* y, oski_index_t incy )
{
	if( incx == 1 )
		MBCSR_MatConjMult_v1_aX_b1_xs1_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, y, incy );
	else
		MBCSR_MatConjMult_v1_aX_b1_xsX_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y, incy );
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX
/**
 *  \brief See MatMult().
 */
#define MatConjMult MatMult

#else /* IS_VAL_COMPLEX */



/**
 *  \brief Computes
 *  \f$y \leftarrow y + \alpha\cdot\mathrm{op}(A)\cdot x\f$,
 *  where \f$\mathrm{op}(A) = \bar{A}\f$, on the fully blocked
 *  portion of \f$A\f$.
 */
static int
MatConjMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x_view,
	oski_vecview_t y_view )
{
	oski_index_t j; /* column number */
	const oski_value_t* xpj; /* X(:, j) */
	oski_value_t* ypj; /* Y(:, j) */

	assert( A->r == 4 );
	assert( A->c == 2 );

	for( j = 0, xpj = x_view->val, ypj = y_view->val;
		j < x_view->num_cols;
		j++, xpj += x_view->colinc, ypj += y_view->colinc )
	{
		MatConjMult_v1( A->num_block_rows, A->offset,
			A->bptr, A->bind, A->bval, A->bdiag,
			alpha, xpj, x_view->rowinc, ypj, y_view->rowinc );
	}

	return 0;
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX

#if defined(DO_NAME_MANGLING)
/** See MBCSR_MatTransMult_v1_aX_b1_xsX_ys1(). */
#define MBCSR_MatHermMult_v1_aX_b1_xsX_ys1 MBCSR_MatTransMult_v1_aX_b1_xsX_ys1
#endif

#else /* IS_VAL_COMPLEX */



#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatHermMult_v1_aX_b1_xsX_ys1 */
#define MBCSR_MatHermMult_v1_aX_b1_xsX_ys1 MANGLE_MOD_(MBCSR_MatHermMult_v1_aX_b1_xsX_ys1_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot \bar{A}^T\cdot x\f$.
 */
void
MBCSR_MatHermMult_v1_aX_b1_xsX_ys1( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y )
{
	const oski_value_t* xp;
	oski_index_t I;

	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		oski_index_t K;

		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			oski_value_t* yp = y + j0;

			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_MAC_CONJ( _y0, bval[0], _x0 );
			VAL_MAC_CONJ( _y1, bval[1], _x0 );
			VAL_MAC_CONJ( _y0, bval[2], _x1 );
			VAL_MAC_CONJ( _y1, bval[3], _x1 );
			VAL_MAC_CONJ( _y0, bval[4], _x2 );
			VAL_MAC_CONJ( _y1, bval[5], _x2 );
			VAL_MAC_CONJ( _y0, bval[6], _x3 );
			VAL_MAC_CONJ( _y1, bval[7], _x3 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1], _y1 );
		}
	}
	/* Diagonal block multiply */
	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		oski_value_t* yp = y + (d0 + I*4);
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_MAC_CONJ( _y0, bdiag[0], _x0 );
		VAL_MAC_CONJ( _y1, bdiag[1], _x0 );
		VAL_MAC_CONJ( _y2, bdiag[2], _x0 );
		VAL_MAC_CONJ( _y3, bdiag[3], _x0 );
		VAL_MAC_CONJ( _y0, bdiag[4], _x1 );
		VAL_MAC_CONJ( _y1, bdiag[5], _x1 );
		VAL_MAC_CONJ( _y2, bdiag[6], _x1 );
		VAL_MAC_CONJ( _y3, bdiag[7], _x1 );
		VAL_MAC_CONJ( _y0, bdiag[8], _x2 );
		VAL_MAC_CONJ( _y1, bdiag[9], _x2 );
		VAL_MAC_CONJ( _y2, bdiag[10], _x2 );
		VAL_MAC_CONJ( _y3, bdiag[11], _x2 );
		VAL_MAC_CONJ( _y0, bdiag[12], _x3 );
		VAL_MAC_CONJ( _y1, bdiag[13], _x3 );
		VAL_MAC_CONJ( _y2, bdiag[14], _x3 );
		VAL_MAC_CONJ( _y3, bdiag[15], _x3 );
		VAL_INC( yp[0], _y0 );
		VAL_INC( yp[1], _y1 );
		VAL_INC( yp[2], _y2 );
		VAL_INC( yp[3], _y3 );
		bdiag += 4*4;
	}
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX

#if defined(DO_NAME_MANGLING)
/** See MBCSR_MatTransMult_v1_aX_b1_xsX_ysX(). */
#define MBCSR_MatHermMult_v1_aX_b1_xsX_ysX MBCSR_MatTransMult_v1_aX_b1_xsX_ysX
#endif

#else /* IS_VAL_COMPLEX */



#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatHermMult_v1_aX_b1_xsX_ysX */
#define MBCSR_MatHermMult_v1_aX_b1_xsX_ysX MANGLE_MOD_(MBCSR_MatHermMult_v1_aX_b1_xsX_ysX_4x2)
#endif

/**
 *  \brief MBCSR implementation of
 *  \f$y \leftarrow y + \alpha\cdot \bar{A}^T\cdot x\f$.
 */
void
MBCSR_MatHermMult_v1_aX_b1_xsX_ysX( oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict bptr, const oski_index_t* restrict bind,
	const oski_value_t* restrict bval, const oski_value_t* restrict bdiag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy )
{
	const oski_value_t* xp;
	oski_index_t I;

	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		oski_index_t K;

		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );

		for( K = bptr[I]; K < bptr[I+1]; K++, bind++, bval += 4*2 )
		{
			oski_index_t j0 = bind[0]; /* block's leftmost col index */
			oski_value_t* yp = y + j0*incy;

			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_MAC_CONJ( _y0, bval[0], _x0 );
			VAL_MAC_CONJ( _y1, bval[1], _x0 );
			VAL_MAC_CONJ( _y0, bval[2], _x1 );
			VAL_MAC_CONJ( _y1, bval[3], _x1 );
			VAL_MAC_CONJ( _y0, bval[4], _x2 );
			VAL_MAC_CONJ( _y1, bval[5], _x2 );
			VAL_MAC_CONJ( _y0, bval[6], _x3 );
			VAL_MAC_CONJ( _y1, bval[7], _x3 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1*incy], _y1 );
		}
	}
	/* Diagonal block multiply */
	for( I = 0, xp = x + d0*incx; I < M; I++, xp += 4*incx )
	{
		oski_value_t* yp = y + (d0 + I*4)*incy;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _y1;
		REGISTER oski_value_t _y2;
		REGISTER oski_value_t _y3;
		REGISTER oski_value_t _x0;
		REGISTER oski_value_t _x1;
		REGISTER oski_value_t _x2;
		REGISTER oski_value_t _x3;
		VAL_MUL( _x0, alpha, xp[0] );
		VAL_MUL( _x1, alpha, xp[1*incx] );
		VAL_MUL( _x2, alpha, xp[2*incx] );
		VAL_MUL( _x3, alpha, xp[3*incx] );
		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _y1 );
		VAL_SET_ZERO( _y2 );
		VAL_SET_ZERO( _y3 );
		VAL_MAC_CONJ( _y0, bdiag[0], _x0 );
		VAL_MAC_CONJ( _y1, bdiag[1], _x0 );
		VAL_MAC_CONJ( _y2, bdiag[2], _x0 );
		VAL_MAC_CONJ( _y3, bdiag[3], _x0 );
		VAL_MAC_CONJ( _y0, bdiag[4], _x1 );
		VAL_MAC_CONJ( _y1, bdiag[5], _x1 );
		VAL_MAC_CONJ( _y2, bdiag[6], _x1 );
		VAL_MAC_CONJ( _y3, bdiag[7], _x1 );
		VAL_MAC_CONJ( _y0, bdiag[8], _x2 );
		VAL_MAC_CONJ( _y1, bdiag[9], _x2 );
		VAL_MAC_CONJ( _y2, bdiag[10], _x2 );
		VAL_MAC_CONJ( _y3, bdiag[11], _x2 );
		VAL_MAC_CONJ( _y0, bdiag[12], _x3 );
		VAL_MAC_CONJ( _y1, bdiag[13], _x3 );
		VAL_MAC_CONJ( _y2, bdiag[14], _x3 );
		VAL_MAC_CONJ( _y3, bdiag[15], _x3 );
		VAL_INC( yp[0], _y0 );
		VAL_INC( yp[1*incy], _y1 );
		VAL_INC( yp[2*incy], _y2 );
		VAL_INC( yp[3*incy], _y3 );
		bdiag += 4*4;
	}
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX
/**
 *  \brief Matrix times single-vector multiply in the herm case;
 *  see MatTransMult_v1().
 */
#define MatHermMult_v1 MatTransMult_v1

#else /* IS_VAL_COMPLEX */


/**
 *  \brief Matrix times single-vector multiply in the herm case.
 */
static void
MatHermMult_v1( oski_index_t M, oski_index_t d0,
	const oski_index_t* bptr, const oski_index_t* bind,
	const oski_value_t* bval, const oski_value_t* bdiag,
	oski_value_t alpha, const oski_value_t* x, oski_index_t incx,
	oski_value_t* y, oski_index_t incy )
{
	if( incy == 1 )
		MBCSR_MatHermMult_v1_aX_b1_xsX_ys1( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y );
	else
		MBCSR_MatHermMult_v1_aX_b1_xsX_ysX( M, d0,
			bptr, bind, bval, bdiag, alpha, x, incx, y, incy );
}


#endif /* !IS_VAL_COMPLEX */


#if !IS_VAL_COMPLEX
/**
 *  \brief See MatTransMult().
 */
#define MatHermMult MatTransMult

#else /* IS_VAL_COMPLEX */



/**
 *  \brief Computes
 *  \f$y \leftarrow y + \alpha\cdot\mathrm{op}(A)\cdot x\f$,
 *  where \f$\mathrm{op}(A) = A^H = \bar{A}^T\f$, on the fully blocked
 *  portion of \f$A\f$.
 */
static int
MatHermMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x_view,
	oski_vecview_t y_view )
{
	oski_index_t j; /* column number */
	const oski_value_t* xpj; /* X(:, j) */
	oski_value_t* ypj; /* Y(:, j) */

	assert( A->r == 4 );
	assert( A->c == 2 );

	for( j = 0, xpj = x_view->val, ypj = y_view->val;
		j < x_view->num_cols;
		j++, xpj += x_view->colinc, ypj += y_view->colinc )
	{
		MatHermMult_v1( A->num_block_rows, A->offset,
			A->bptr, A->bind, A->bval, A->bdiag,
			alpha, xpj, x_view->rowinc, ypj, y_view->rowinc );
	}

	return 0;
}


#endif /* !IS_VAL_COMPLEX */


#if defined(DO_NAME_MANGLING)
/** Mangled name of exportable routine. */
#define SubmatReprMult MANGLE_MOD_(SubmatReprMult_4x2)
#endif

/**
 *  \brief Computes
 *  \f$y \leftarrow y + \alpha\cdot\mathrm{op}(A)\cdot x\f$,
 *  where \f$A\f$ is stored in 4x2 MBCSR format.
 */
int
SubmatReprMult( const oski_submatMBCSR_t* A, oski_matop_t opA,
	oski_value_t alpha, const oski_vecview_t x_view,
	oski_vecview_t y_view )
{
	int err;

	switch( opA )
	{
		case OP_NORMAL:
			err = MatMult( A, alpha, x_view, y_view );
			break;
		case OP_CONJ:
			err = MatConjMult( A, alpha, x_view, y_view );
			break;
		case OP_TRANS:
			err = MatTransMult( A, alpha, x_view, y_view );
			break;
		case OP_CONJ_TRANS:
			err = MatHermMult( A, alpha, x_view, y_view );
			break;

		default:
			OSKI_ERR_BAD_MATOP( MatReprMult, 2, opA );
			err = ERR_BAD_ARG;
	}

	return err;
}


/* eof */
