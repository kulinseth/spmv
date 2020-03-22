/**
 *  \file src/MBCSR/MatMultAndMatTransMult/1x4.c
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of simultaneous multiplication by \f$A\f$ and \f$\mathrm{op}(A)\f$.
 *  \ingroup MATTYPE_MBCSR
 *
 *  Automatically generated by ./gen_a_and_at.sh on Wed Jun  8 15:53:29 PDT 2005.
 */

#include <assert.h>

#include <oski/config.h> /* for 'restrict' keyword */
#include <oski/common.h>
#include <oski/mangle.h>
#include <oski/vecview.h>
#include <oski/MBCSR/format.h>
#include <oski/MBCSR/module.h>

#if IS_VAL_COMPLEX
	/** Complex-valued, so do not use explicit 'register' keyword. */
	#define REGISTER
#else
	/** Real-valued, so use explicit 'register' keyword. */
	#define REGISTER register
#endif

#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX. */
#define MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, A\cdot w\f$, where x, y, w, and z vectors have
 *  unit-stride, general-stride,
 *  unit-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	oski_value_t* zp = z + d0*incz;

	for( I = 0; I < M; I++, yp += 1*incy, zp += 1*incz, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _z0;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _z0 );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			const oski_value_t* wp = w + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _w0;
			REGISTER oski_value_t _w1;
			REGISTER oski_value_t _w2;
			REGISTER oski_value_t _w3;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _w1, wp[1] );
			VAL_ASSIGN( _w2, wp[2] );
			VAL_ASSIGN( _w3, wp[3] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_MAC( _z0, val[0], _w0 );
			VAL_MAC( _z0, val[1], _w1 );
			VAL_MAC( _z0, val[2], _w2 );
			VAL_MAC( _z0, val[3], _w3 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1);
			REGISTER oski_value_t _x0;
			const oski_value_t* wp = w + (d0 + I*1);
			REGISTER oski_value_t _w0;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_MAC( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

		VAL_MAC( zp[0], omega, _z0 );

	} /* I */
} /* MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX */

#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX. */
#define MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, A\cdot w\f$, where x, y, w, and z vectors have
 *  general-stride, general-stride,
 *  general-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	oski_value_t* zp = z + d0*incz;

	for( I = 0; I < M; I++, yp += 1*incy, zp += 1*incz, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _z0;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _z0 );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			const oski_value_t* wp = w + j0*incw;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _w0;
			REGISTER oski_value_t _w1;
			REGISTER oski_value_t _w2;
			REGISTER oski_value_t _w3;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _w1, wp[1*incw] );
			VAL_ASSIGN( _w2, wp[2*incw] );
			VAL_ASSIGN( _w3, wp[3*incw] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_MAC( _z0, val[0], _w0 );
			VAL_MAC( _z0, val[1], _w1 );
			VAL_MAC( _z0, val[2], _w2 );
			VAL_MAC( _z0, val[3], _w3 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1)*incx;
			REGISTER oski_value_t _x0;
			const oski_value_t* wp = w + (d0 + I*1)*incw;
			REGISTER oski_value_t _w0;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_MAC( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

		VAL_MAC( zp[0], omega, _z0 );

	} /* I */
} /* MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX */


/**
 *  \brief Exported module wrapper for the \f$1\times 4\f$
 *  implementation of \f$A\cdot x, A\cdot w\f$.
 */
static int
MatMultAndMatMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x, oski_vecview_t y,
	oski_value_t omega, const oski_vecview_t w, oski_vecview_t z )
{
	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	const oski_value_t* wp = w->val;
	oski_value_t* zp = z->val;

	assert( A != NULL );
	assert( A->r == 1 );
	assert( A->c == 4 );

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && w->rowinc == 1 )
			MBCSR_MatMultAndMatMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, yp, y->rowinc,
				omega, wp, zp, z->rowinc );
		else
			MBCSR_MatMultAndMatMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, x->rowinc, yp, y->rowinc,
				omega, wp, w->rowinc, zp, z->rowinc );

		xp += x->colinc;
		yp += y->colinc;
		wp += w->colinc;
		zp += z->colinc;
	}
	return 0;
} /* MatMultAndMatMult */

#if IS_VAL_COMPLEX
#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX. */
#define MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, \bar{A}\cdot w\f$, where x, y, w, and z vectors have
 *  unit-stride, general-stride,
 *  unit-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	oski_value_t* zp = z + d0*incz;

	for( I = 0; I < M; I++, yp += 1*incy, zp += 1*incz, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _z0;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _z0 );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			const oski_value_t* wp = w + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _w0;
			REGISTER oski_value_t _w1;
			REGISTER oski_value_t _w2;
			REGISTER oski_value_t _w3;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _w1, wp[1] );
			VAL_ASSIGN( _w2, wp[2] );
			VAL_ASSIGN( _w3, wp[3] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_MAC_CONJ( _z0, val[0], _w0 );
			VAL_MAC_CONJ( _z0, val[1], _w1 );
			VAL_MAC_CONJ( _z0, val[2], _w2 );
			VAL_MAC_CONJ( _z0, val[3], _w3 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1);
			REGISTER oski_value_t _x0;
			const oski_value_t* wp = w + (d0 + I*1);
			REGISTER oski_value_t _w0;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_MAC_CONJ( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

		VAL_MAC( zp[0], omega, _z0 );

	} /* I */
} /* MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX */

#endif /* IS_VAL_COMPLEX */
#if IS_VAL_COMPLEX
#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX. */
#define MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, \bar{A}\cdot w\f$, where x, y, w, and z vectors have
 *  general-stride, general-stride,
 *  general-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	oski_value_t* zp = z + d0*incz;

	for( I = 0; I < M; I++, yp += 1*incy, zp += 1*incz, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _z0;

		VAL_SET_ZERO( _y0 );
		VAL_SET_ZERO( _z0 );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			const oski_value_t* wp = w + j0*incw;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _w0;
			REGISTER oski_value_t _w1;
			REGISTER oski_value_t _w2;
			REGISTER oski_value_t _w3;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _w1, wp[1*incw] );
			VAL_ASSIGN( _w2, wp[2*incw] );
			VAL_ASSIGN( _w3, wp[3*incw] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_MAC_CONJ( _z0, val[0], _w0 );
			VAL_MAC_CONJ( _z0, val[1], _w1 );
			VAL_MAC_CONJ( _z0, val[2], _w2 );
			VAL_MAC_CONJ( _z0, val[3], _w3 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1)*incx;
			REGISTER oski_value_t _x0;
			const oski_value_t* wp = w + (d0 + I*1)*incw;
			REGISTER oski_value_t _w0;

			VAL_ASSIGN( _w0, wp[0] );
			VAL_ASSIGN( _x0, xp[0] );
			VAL_MAC_CONJ( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

		VAL_MAC( zp[0], omega, _z0 );

	} /* I */
} /* MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX */

#endif /* IS_VAL_COMPLEX */

/**
 *  \brief Exported module wrapper for the \f$1\times 4\f$
 *  implementation of \f$A\cdot x, \bar{A}\cdot w\f$.
 */
static int
MatMultAndMatConjMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x, oski_vecview_t y,
	oski_value_t omega, const oski_vecview_t w, oski_vecview_t z )
{
#if !IS_VAL_COMPLEX
	/* Call equivalent real kernel */
	return MatMultAndMatMult( A, alpha, x, y, omega, w, z );
#else /* IS_VAL_COMPLEX */

	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	const oski_value_t* wp = w->val;
	oski_value_t* zp = z->val;

	assert( A != NULL );
	assert( A->r == 1 );
	assert( A->c == 4 );

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && w->rowinc == 1 )
			MBCSR_MatMultAndMatConjMult_v1_aX_b1_xs1_ysX_oX_z1_ws1_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, yp, y->rowinc,
				omega, wp, zp, z->rowinc );
		else
			MBCSR_MatMultAndMatConjMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, x->rowinc, yp, y->rowinc,
				omega, wp, w->rowinc, zp, z->rowinc );

		xp += x->colinc;
		yp += y->colinc;
		wp += w->colinc;
		zp += z->colinc;
	}
	return 0;
#endif /* IS_VAL_COMPLEX */
} /* MatMultAndMatConjMult */

#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1. */
#define MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1 \
	MANGLE_MOD_(MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, A^T\cdot w\f$, where x, y, w, and z vectors have
 *  unit-stride, general-stride,
 *  general-stride, and unit-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	const oski_value_t* wp = w + d0*incw;

	for( I = 0; I < M; I++, yp += 1*incy, wp += 1*incw, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _w0;

		VAL_SET_ZERO( _y0 );
		VAL_MUL( _w0, omega, wp[0] );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			oski_value_t* zp = z + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _z0;
			REGISTER oski_value_t _z1;
			REGISTER oski_value_t _z2;
			REGISTER oski_value_t _z3;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_SET_ZERO( _z0 );
			VAL_SET_ZERO( _z1 );
			VAL_SET_ZERO( _z2 );
			VAL_SET_ZERO( _z3 );
			VAL_MAC( _z0, val[0], _w0 );
			VAL_MAC( _z1, val[1], _w0 );
			VAL_MAC( _z2, val[2], _w0 );
			VAL_MAC( _z3, val[3], _w0 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
			VAL_INC( zp[0], _z0 );
			VAL_INC( zp[1], _z1 );
			VAL_INC( zp[2], _z2 );
			VAL_INC( zp[3], _z3 );

		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1);
			REGISTER oski_value_t _x0;
			oski_value_t* zp = z + (d0+I*1);
			REGISTER oski_value_t _z0;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_SET_ZERO( _z0 );
			VAL_MAC( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
			VAL_INC( zp[0], _z0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

	} /* I */
} /* MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1 */

#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX. */
#define MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, A^T\cdot w\f$, where x, y, w, and z vectors have
 *  general-stride, general-stride,
 *  general-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	const oski_value_t* wp = w + d0*incw;

	for( I = 0; I < M; I++, yp += 1*incy, wp += 1*incw, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _w0;

		VAL_SET_ZERO( _y0 );
		VAL_MUL( _w0, omega, wp[0] );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			oski_value_t* zp = z + j0*incz;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _z0;
			REGISTER oski_value_t _z1;
			REGISTER oski_value_t _z2;
			REGISTER oski_value_t _z3;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_SET_ZERO( _z0 );
			VAL_SET_ZERO( _z1 );
			VAL_SET_ZERO( _z2 );
			VAL_SET_ZERO( _z3 );
			VAL_MAC( _z0, val[0], _w0 );
			VAL_MAC( _z1, val[1], _w0 );
			VAL_MAC( _z2, val[2], _w0 );
			VAL_MAC( _z3, val[3], _w0 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
			VAL_INC( zp[0], _z0 );
			VAL_INC( zp[1*incz], _z1 );
			VAL_INC( zp[2*incz], _z2 );
			VAL_INC( zp[3*incz], _z3 );

		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1)*incx;
			REGISTER oski_value_t _x0;
			oski_value_t* zp = z + (d0+I*1)*incz;
			REGISTER oski_value_t _z0;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_SET_ZERO( _z0 );
			VAL_MAC( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
			VAL_INC( zp[0], _z0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

	} /* I */
} /* MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX */


/**
 *  \brief Exported module wrapper for the \f$1\times 4\f$
 *  implementation of \f$A\cdot x, A^T\cdot w\f$.
 */
static int
MatMultAndMatTransMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x, oski_vecview_t y,
	oski_value_t omega, const oski_vecview_t w, oski_vecview_t z )
{
	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	const oski_value_t* wp = w->val;
	oski_value_t* zp = z->val;

	assert( A != NULL );
	assert( A->r == 1 );
	assert( A->c == 4 );

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && z->rowinc == 1 )
			MBCSR_MatMultAndMatTransMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, yp, y->rowinc,
				omega, wp, w->rowinc, zp );
		else
			MBCSR_MatMultAndMatTransMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, x->rowinc, yp, y->rowinc,
				omega, wp, w->rowinc, zp, z->rowinc );

		xp += x->colinc;
		yp += y->colinc;
		wp += w->colinc;
		zp += z->colinc;
	}
	return 0;
} /* MatMultAndMatTransMult */

#if IS_VAL_COMPLEX
#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1. */
#define MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1 \
	MANGLE_MOD_(MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, \bar{A}^T\cdot w\f$, where x, y, w, and z vectors have
 *  unit-stride, general-stride,
 *  general-stride, and unit-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	const oski_value_t* wp = w + d0*incw;

	for( I = 0; I < M; I++, yp += 1*incy, wp += 1*incw, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _w0;

		VAL_SET_ZERO( _y0 );
		VAL_MUL( _w0, omega, wp[0] );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			oski_value_t* zp = z + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _z0;
			REGISTER oski_value_t _z1;
			REGISTER oski_value_t _z2;
			REGISTER oski_value_t _z3;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_SET_ZERO( _z0 );
			VAL_SET_ZERO( _z1 );
			VAL_SET_ZERO( _z2 );
			VAL_SET_ZERO( _z3 );
			VAL_MAC_CONJ( _z0, val[0], _w0 );
			VAL_MAC_CONJ( _z1, val[1], _w0 );
			VAL_MAC_CONJ( _z2, val[2], _w0 );
			VAL_MAC_CONJ( _z3, val[3], _w0 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
			VAL_INC( zp[0], _z0 );
			VAL_INC( zp[1], _z1 );
			VAL_INC( zp[2], _z2 );
			VAL_INC( zp[3], _z3 );

		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1);
			REGISTER oski_value_t _x0;
			oski_value_t* zp = z + (d0+I*1);
			REGISTER oski_value_t _z0;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_SET_ZERO( _z0 );
			VAL_MAC_CONJ( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
			VAL_INC( zp[0], _z0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

	} /* I */
} /* MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1 */

#endif /* IS_VAL_COMPLEX */
#if IS_VAL_COMPLEX
#if defined(DO_NAME_MANGLING)
/** Mangled name for MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX. */
#define MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX \
	MANGLE_MOD_(MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX_1x4)
#endif

/**
 *  \brief The \f$1\times 4\f$ MBCSR implementation
 *  of \f$A\cdot x, \bar{A}^T\cdot w\f$, where x, y, w, and z vectors have
 *  general-stride, general-stride,
 *  general-stride, and general-stride,
 *  respectively.
 */
void
MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
	oski_index_t M, oski_index_t d0,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val, const oski_value_t* restrict diag,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t omega, const oski_value_t* restrict w, oski_index_t incw,
	oski_value_t* restrict z, oski_index_t incz )
{
	oski_index_t I;
	oski_value_t* yp = y + d0*incy;
	const oski_value_t* wp = w + d0*incw;

	for( I = 0; I < M; I++, yp += 1*incy, wp += 1*incw, diag += 1*1 )
	{
		oski_index_t K;
		REGISTER oski_value_t _y0;
		REGISTER oski_value_t _w0;

		VAL_SET_ZERO( _y0 );
		VAL_MUL( _w0, omega, wp[0] );

		for( K = ptr[I]; K < ptr[I+1]; K++, val += 1*4 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			oski_value_t* zp = z + j0*incz;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _z0;
			REGISTER oski_value_t _z1;
			REGISTER oski_value_t _z2;
			REGISTER oski_value_t _z3;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_SET_ZERO( _z0 );
			VAL_SET_ZERO( _z1 );
			VAL_SET_ZERO( _z2 );
			VAL_SET_ZERO( _z3 );
			VAL_MAC_CONJ( _z0, val[0], _w0 );
			VAL_MAC_CONJ( _z1, val[1], _w0 );
			VAL_MAC_CONJ( _z2, val[2], _w0 );
			VAL_MAC_CONJ( _z3, val[3], _w0 );
			VAL_MAC( _y0, val[0], _x0 );
			VAL_MAC( _y0, val[1], _x1 );
			VAL_MAC( _y0, val[2], _x2 );
			VAL_MAC( _y0, val[3], _x3 );
			VAL_INC( zp[0], _z0 );
			VAL_INC( zp[1*incz], _z1 );
			VAL_INC( zp[2*incz], _z2 );
			VAL_INC( zp[3*incz], _z3 );

		}
		/* Diag block multiply */
		{
			const oski_value_t* xp = x + (d0 + I*1)*incx;
			REGISTER oski_value_t _x0;
			oski_value_t* zp = z + (d0+I*1)*incz;
			REGISTER oski_value_t _z0;

			VAL_ASSIGN( _x0, xp[0] );
			VAL_SET_ZERO( _z0 );
			VAL_MAC_CONJ( _z0, diag[0], _w0 );
			VAL_MAC( _y0, diag[0], _x0 );
			VAL_INC( zp[0], _z0 );
		}
		VAL_MAC( yp[0], alpha, _y0 );

	} /* I */
} /* MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX */

#endif /* IS_VAL_COMPLEX */

/**
 *  \brief Exported module wrapper for the \f$1\times 4\f$
 *  implementation of \f$A\cdot x, \bar{A}^T\cdot w\f$.
 */
static int
MatMultAndMatHermMult( const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x, oski_vecview_t y,
	oski_value_t omega, const oski_vecview_t w, oski_vecview_t z )
{
#if !IS_VAL_COMPLEX
	/* Call equivalent real kernel */
	return MatMultAndMatTransMult( A, alpha, x, y, omega, w, z );
#else /* IS_VAL_COMPLEX */

	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	const oski_value_t* wp = w->val;
	oski_value_t* zp = z->val;

	assert( A != NULL );
	assert( A->r == 1 );
	assert( A->c == 4 );

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && z->rowinc == 1 )
			MBCSR_MatMultAndMatHermMult_v1_aX_b1_xs1_ysX_oX_z1_wsX_zs1(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, yp, y->rowinc,
				omega, wp, w->rowinc, zp );
		else
			MBCSR_MatMultAndMatHermMult_v1_aX_b1_xsX_ysX_oX_z1_wsX_zsX(
				A->num_block_rows, A->offset,
				A->bptr, A->bind, A->bval, A->bdiag,
				alpha, xp, x->rowinc, yp, y->rowinc,
				omega, wp, w->rowinc, zp, z->rowinc );

		xp += x->colinc;
		yp += y->colinc;
		wp += w->colinc;
		zp += z->colinc;
	}
	return 0;
#endif /* IS_VAL_COMPLEX */
} /* MatMultAndMatHermMult */


#if defined(DO_NAME_MANGLING)
/** Mangled name for primary exportable symbol */
#define SubmatReprMultAndSubmatReprTransMult \
	MANGLE_MOD_(SubmatReprMultAndSubmatReprTransMult_1x4)
#endif

/**
 *  \brief Entry point to the 1x4 kernel that implements
 *  simultaneous multiplication by sparse \f$A\f$ and
 *  \f$\mathrm{op}(A)\f$.
 */
int
SubmatReprMultAndSubmatReprTransMult(
	const oski_submatMBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x, oski_vecview_t y,
	oski_matop_t opA,
	oski_value_t omega, const oski_vecview_t w, oski_vecview_t z )
{
	int err = 0;
	switch( opA ) {
		case OP_NORMAL:
			err = MatMultAndMatMult( A, alpha, x, y, omega, w, z );
			break;
		case OP_TRANS:
			err = MatMultAndMatTransMult( A, alpha, x, y, omega, w, z );
			break;
		case OP_CONJ:
			err = MatMultAndMatConjMult( A, alpha, x, y, omega, w, z );
			break;
		case OP_CONJ_TRANS:
			err = MatMultAndMatHermMult( A, alpha, x, y, omega, w, z );
			break;
		default:
			assert( 0 );
	}
	return err;
}

/* eof */
