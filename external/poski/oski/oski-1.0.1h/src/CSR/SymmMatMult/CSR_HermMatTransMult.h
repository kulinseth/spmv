
/** \file src/CSR/SymmMatMult/CSR_HermMatTransMult.h
 *  \brief Prototypes for subroutines that compute variations on
 *  \f$y \leftarrow y + \alpha \cdot op(A) \cdot x\f$,
 *  where \f$A\f$ is Hermitian (i.e., \f$A = A^H\f$) and \f$op(A) = A^T\f$.
 *  \ingroup MATTYPE_CSR
 *
 *  This file automatically generated by ./gen_csr_symm.sh on Fri Feb 25 13:16:19 PST 2005.
 */

#if !defined(INC_CSR_HermMatTransMult)  && IS_VAL_COMPLEX
/** src/CSR/SymmMatMult/CSR_HermMatTransMult included. */
#define INC_CSR_HermMatTransMult


#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_a1_b1_xs1_ys1() */
#define CSR_HermMatTransMult_v1_a1_b1_xs1_ys1 MANGLE_(CSR_HermMatTransMult_v1_a1_b1_xs1_ys1)
#endif

void CSR_HermMatTransMult_v1_a1_b1_xs1_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x ,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_a1_b1_xs1_ysX() */
#define CSR_HermMatTransMult_v1_a1_b1_xs1_ysX MANGLE_(CSR_HermMatTransMult_v1_a1_b1_xs1_ysX)
#endif

void CSR_HermMatTransMult_v1_a1_b1_xs1_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x ,
	oski_value_t* restrict y , oski_index_t incy );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_a1_b1_xsX_ys1() */
#define CSR_HermMatTransMult_v1_a1_b1_xsX_ys1 MANGLE_(CSR_HermMatTransMult_v1_a1_b1_xsX_ys1)
#endif

void CSR_HermMatTransMult_v1_a1_b1_xsX_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_a1_b1_xsX_ysX() */
#define CSR_HermMatTransMult_v1_a1_b1_xsX_ysX MANGLE_(CSR_HermMatTransMult_v1_a1_b1_xsX_ysX)
#endif

void CSR_HermMatTransMult_v1_a1_b1_xsX_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y , oski_index_t incy );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aN1_b1_xs1_ys1() */
#define CSR_HermMatTransMult_v1_aN1_b1_xs1_ys1 MANGLE_(CSR_HermMatTransMult_v1_aN1_b1_xs1_ys1)
#endif

void CSR_HermMatTransMult_v1_aN1_b1_xs1_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x ,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aN1_b1_xs1_ysX() */
#define CSR_HermMatTransMult_v1_aN1_b1_xs1_ysX MANGLE_(CSR_HermMatTransMult_v1_aN1_b1_xs1_ysX)
#endif

void CSR_HermMatTransMult_v1_aN1_b1_xs1_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x ,
	oski_value_t* restrict y , oski_index_t incy );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aN1_b1_xsX_ys1() */
#define CSR_HermMatTransMult_v1_aN1_b1_xsX_ys1 MANGLE_(CSR_HermMatTransMult_v1_aN1_b1_xsX_ys1)
#endif

void CSR_HermMatTransMult_v1_aN1_b1_xsX_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aN1_b1_xsX_ysX() */
#define CSR_HermMatTransMult_v1_aN1_b1_xsX_ysX MANGLE_(CSR_HermMatTransMult_v1_aN1_b1_xsX_ysX)
#endif

void CSR_HermMatTransMult_v1_aN1_b1_xsX_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y , oski_index_t incy );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aX_b1_xs1_ys1() */
#define CSR_HermMatTransMult_v1_aX_b1_xs1_ys1 MANGLE_(CSR_HermMatTransMult_v1_aX_b1_xs1_ys1)
#endif

void CSR_HermMatTransMult_v1_aX_b1_xs1_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, oski_value_t alpha, const oski_value_t* restrict x ,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aX_b1_xs1_ysX() */
#define CSR_HermMatTransMult_v1_aX_b1_xs1_ysX MANGLE_(CSR_HermMatTransMult_v1_aX_b1_xs1_ysX)
#endif

void CSR_HermMatTransMult_v1_aX_b1_xs1_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, oski_value_t alpha, const oski_value_t* restrict x ,
	oski_value_t* restrict y , oski_index_t incy );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aX_b1_xsX_ys1() */
#define CSR_HermMatTransMult_v1_aX_b1_xsX_ys1 MANGLE_(CSR_HermMatTransMult_v1_aX_b1_xsX_ys1)
#endif

void CSR_HermMatTransMult_v1_aX_b1_xsX_ys1( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, oski_value_t alpha, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y  );

#if defined(DO_NAME_MANGLING)
/** Mangled name for CSR_HermMatTransMult_v1_aX_b1_xsX_ysX() */
#define CSR_HermMatTransMult_v1_aX_b1_xsX_ysX MANGLE_(CSR_HermMatTransMult_v1_aX_b1_xsX_ysX)
#endif

void CSR_HermMatTransMult_v1_aX_b1_xsX_ysX( oski_index_t m, oski_index_t n,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, oski_index_t index_base
	, oski_value_t alpha, const oski_value_t* restrict x , oski_index_t incx,
	oski_value_t* restrict y , oski_index_t incy );
#endif /* !defined(INC_CSR_HermMatTransMult) */
