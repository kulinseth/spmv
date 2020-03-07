/**
 *  \file src/BCSR/MatTransMatMult/BCSR_5x8.c
 *  \brief The \f$5\times 8\f$ BCSR implementation
 *  of \f$A^TA\cdot x\f$ and \f$A^HA\cdot x\f$.
 *  \ingroup MATTYPE_BCSR
 *
 *  Automatically generated by ./gen_ata.sh on Tue Jun  7 13:31:16 PDT 2005.
 */

#if HAVE_CONFIG_H
#include <config/config.h> /* for 'restrict' keyword */
#endif

#include <assert.h>

#include <oski/config.h>
#include <oski/common.h>
#include <oski/mangle.h>
#include <oski/vecview.h>
#include <oski/BCSR/format.h>
#include <oski/BCSR/module.h>

#if IS_VAL_COMPLEX
	/** Complex-valued, so do not use explicit 'register' keyword. */
	#define REGISTER
#else
	/** Real-valued, so use explicit 'register' keyword. */
	#define REGISTER register
#endif

#if defined(DO_NAME_MANGLING)
/** Mangled name for BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1. */
#define BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1 \
	MANGLE_MOD_(BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1_5x8)
#endif

/**
 *  \brief The \f$5\times 8\f$ BCSR implementation
 *  of \f$A^TA\cdot x\f$, where the source and destination
 *  vectors have unit-stride and unit-stride,
 *  respectively.
 *
 *  Parameter 'tp' may be NULL if no intermediate vector output
 *  is desired.
 */
void
BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1( oski_index_t M,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y,
	oski_value_t* restrict t, oski_index_t inct )
{
	oski_index_t I;
	oski_value_t* tp = t;

	for( I = 0; I < M; I++ )
	{
		oski_index_t K;
		REGISTER oski_value_t _t0 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t1 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t2 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t3 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t4 = MAKE_VAL_COMPLEX(0.0, 0.0);
		const oski_value_t* vp;

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _x4;
			REGISTER oski_value_t _x5;
			REGISTER oski_value_t _x6;
			REGISTER oski_value_t _x7;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_ASSIGN( _x4, xp[4] );
			VAL_ASSIGN( _x5, xp[5] );
			VAL_ASSIGN( _x6, xp[6] );
			VAL_ASSIGN( _x7, xp[7] );
			VAL_MAC( _t0, vp[0], _x0 );
			VAL_MAC( _t1, vp[8], _x0 );
			VAL_MAC( _t2, vp[16], _x0 );
			VAL_MAC( _t3, vp[24], _x0 );
			VAL_MAC( _t4, vp[32], _x0 );
			VAL_MAC( _t0, vp[1], _x1 );
			VAL_MAC( _t1, vp[9], _x1 );
			VAL_MAC( _t2, vp[17], _x1 );
			VAL_MAC( _t3, vp[25], _x1 );
			VAL_MAC( _t4, vp[33], _x1 );
			VAL_MAC( _t0, vp[2], _x2 );
			VAL_MAC( _t1, vp[10], _x2 );
			VAL_MAC( _t2, vp[18], _x2 );
			VAL_MAC( _t3, vp[26], _x2 );
			VAL_MAC( _t4, vp[34], _x2 );
			VAL_MAC( _t0, vp[3], _x3 );
			VAL_MAC( _t1, vp[11], _x3 );
			VAL_MAC( _t2, vp[19], _x3 );
			VAL_MAC( _t3, vp[27], _x3 );
			VAL_MAC( _t4, vp[35], _x3 );
			VAL_MAC( _t0, vp[4], _x4 );
			VAL_MAC( _t1, vp[12], _x4 );
			VAL_MAC( _t2, vp[20], _x4 );
			VAL_MAC( _t3, vp[28], _x4 );
			VAL_MAC( _t4, vp[36], _x4 );
			VAL_MAC( _t0, vp[5], _x5 );
			VAL_MAC( _t1, vp[13], _x5 );
			VAL_MAC( _t2, vp[21], _x5 );
			VAL_MAC( _t3, vp[29], _x5 );
			VAL_MAC( _t4, vp[37], _x5 );
			VAL_MAC( _t0, vp[6], _x6 );
			VAL_MAC( _t1, vp[14], _x6 );
			VAL_MAC( _t2, vp[22], _x6 );
			VAL_MAC( _t3, vp[30], _x6 );
			VAL_MAC( _t4, vp[38], _x6 );
			VAL_MAC( _t0, vp[7], _x7 );
			VAL_MAC( _t1, vp[15], _x7 );
			VAL_MAC( _t2, vp[23], _x7 );
			VAL_MAC( _t3, vp[31], _x7 );
			VAL_MAC( _t4, vp[39], _x7 );
		}

		if( tp != NULL )
		{
			VAL_ASSIGN( tp[0], _t0 );
			VAL_ASSIGN( tp[1*inct], _t1 );
			VAL_ASSIGN( tp[2*inct], _t2 );
			VAL_ASSIGN( tp[3*inct], _t3 );
			VAL_ASSIGN( tp[4*inct], _t4 );
			tp += 5*inct;
		}

		VAL_SCALE( _t0, alpha );
		VAL_SCALE( _t1, alpha );
		VAL_SCALE( _t2, alpha );
		VAL_SCALE( _t3, alpha );
		VAL_SCALE( _t4, alpha );

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			oski_value_t* yp = y + j0;
			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			REGISTER oski_value_t _y2;
			REGISTER oski_value_t _y3;
			REGISTER oski_value_t _y4;
			REGISTER oski_value_t _y5;
			REGISTER oski_value_t _y6;
			REGISTER oski_value_t _y7;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_SET_ZERO( _y2 );
			VAL_SET_ZERO( _y3 );
			VAL_SET_ZERO( _y4 );
			VAL_SET_ZERO( _y5 );
			VAL_SET_ZERO( _y6 );
			VAL_SET_ZERO( _y7 );
			VAL_MAC( _y0, vp[0], _t0 );
			VAL_MAC( _y1, vp[1], _t0 );
			VAL_MAC( _y2, vp[2], _t0 );
			VAL_MAC( _y3, vp[3], _t0 );
			VAL_MAC( _y4, vp[4], _t0 );
			VAL_MAC( _y5, vp[5], _t0 );
			VAL_MAC( _y6, vp[6], _t0 );
			VAL_MAC( _y7, vp[7], _t0 );
			VAL_MAC( _y0, vp[8], _t1 );
			VAL_MAC( _y1, vp[9], _t1 );
			VAL_MAC( _y2, vp[10], _t1 );
			VAL_MAC( _y3, vp[11], _t1 );
			VAL_MAC( _y4, vp[12], _t1 );
			VAL_MAC( _y5, vp[13], _t1 );
			VAL_MAC( _y6, vp[14], _t1 );
			VAL_MAC( _y7, vp[15], _t1 );
			VAL_MAC( _y0, vp[16], _t2 );
			VAL_MAC( _y1, vp[17], _t2 );
			VAL_MAC( _y2, vp[18], _t2 );
			VAL_MAC( _y3, vp[19], _t2 );
			VAL_MAC( _y4, vp[20], _t2 );
			VAL_MAC( _y5, vp[21], _t2 );
			VAL_MAC( _y6, vp[22], _t2 );
			VAL_MAC( _y7, vp[23], _t2 );
			VAL_MAC( _y0, vp[24], _t3 );
			VAL_MAC( _y1, vp[25], _t3 );
			VAL_MAC( _y2, vp[26], _t3 );
			VAL_MAC( _y3, vp[27], _t3 );
			VAL_MAC( _y4, vp[28], _t3 );
			VAL_MAC( _y5, vp[29], _t3 );
			VAL_MAC( _y6, vp[30], _t3 );
			VAL_MAC( _y7, vp[31], _t3 );
			VAL_MAC( _y0, vp[32], _t4 );
			VAL_MAC( _y1, vp[33], _t4 );
			VAL_MAC( _y2, vp[34], _t4 );
			VAL_MAC( _y3, vp[35], _t4 );
			VAL_MAC( _y4, vp[36], _t4 );
			VAL_MAC( _y5, vp[37], _t4 );
			VAL_MAC( _y6, vp[38], _t4 );
			VAL_MAC( _y7, vp[39], _t4 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1], _y1 );
			VAL_INC( yp[2], _y2 );
			VAL_INC( yp[3], _y3 );
			VAL_INC( yp[4], _y4 );
			VAL_INC( yp[5], _y5 );
			VAL_INC( yp[6], _y6 );
			VAL_INC( yp[7], _y7 );
		}

		val += (ptr[I+1]-ptr[I]) * 40;
	}
} /* BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1 */

#if defined(DO_NAME_MANGLING)
/** Mangled name for BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX. */
#define BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX \
	MANGLE_MOD_(BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX_5x8)
#endif

/**
 *  \brief The \f$5\times 8\f$ BCSR implementation
 *  of \f$A^TA\cdot x\f$, where the source and destination
 *  vectors have general-stride and general-stride,
 *  respectively.
 *
 *  Parameter 'tp' may be NULL if no intermediate vector output
 *  is desired.
 */
void
BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX( oski_index_t M,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t* restrict t, oski_index_t inct )
{
	oski_index_t I;
	oski_value_t* tp = t;

	for( I = 0; I < M; I++ )
	{
		oski_index_t K;
		REGISTER oski_value_t _t0 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t1 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t2 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t3 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t4 = MAKE_VAL_COMPLEX(0.0, 0.0);
		const oski_value_t* vp;

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _x4;
			REGISTER oski_value_t _x5;
			REGISTER oski_value_t _x6;
			REGISTER oski_value_t _x7;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_ASSIGN( _x4, xp[4*incx] );
			VAL_ASSIGN( _x5, xp[5*incx] );
			VAL_ASSIGN( _x6, xp[6*incx] );
			VAL_ASSIGN( _x7, xp[7*incx] );
			VAL_MAC( _t0, vp[0], _x0 );
			VAL_MAC( _t1, vp[8], _x0 );
			VAL_MAC( _t2, vp[16], _x0 );
			VAL_MAC( _t3, vp[24], _x0 );
			VAL_MAC( _t4, vp[32], _x0 );
			VAL_MAC( _t0, vp[1], _x1 );
			VAL_MAC( _t1, vp[9], _x1 );
			VAL_MAC( _t2, vp[17], _x1 );
			VAL_MAC( _t3, vp[25], _x1 );
			VAL_MAC( _t4, vp[33], _x1 );
			VAL_MAC( _t0, vp[2], _x2 );
			VAL_MAC( _t1, vp[10], _x2 );
			VAL_MAC( _t2, vp[18], _x2 );
			VAL_MAC( _t3, vp[26], _x2 );
			VAL_MAC( _t4, vp[34], _x2 );
			VAL_MAC( _t0, vp[3], _x3 );
			VAL_MAC( _t1, vp[11], _x3 );
			VAL_MAC( _t2, vp[19], _x3 );
			VAL_MAC( _t3, vp[27], _x3 );
			VAL_MAC( _t4, vp[35], _x3 );
			VAL_MAC( _t0, vp[4], _x4 );
			VAL_MAC( _t1, vp[12], _x4 );
			VAL_MAC( _t2, vp[20], _x4 );
			VAL_MAC( _t3, vp[28], _x4 );
			VAL_MAC( _t4, vp[36], _x4 );
			VAL_MAC( _t0, vp[5], _x5 );
			VAL_MAC( _t1, vp[13], _x5 );
			VAL_MAC( _t2, vp[21], _x5 );
			VAL_MAC( _t3, vp[29], _x5 );
			VAL_MAC( _t4, vp[37], _x5 );
			VAL_MAC( _t0, vp[6], _x6 );
			VAL_MAC( _t1, vp[14], _x6 );
			VAL_MAC( _t2, vp[22], _x6 );
			VAL_MAC( _t3, vp[30], _x6 );
			VAL_MAC( _t4, vp[38], _x6 );
			VAL_MAC( _t0, vp[7], _x7 );
			VAL_MAC( _t1, vp[15], _x7 );
			VAL_MAC( _t2, vp[23], _x7 );
			VAL_MAC( _t3, vp[31], _x7 );
			VAL_MAC( _t4, vp[39], _x7 );
		}

		if( tp != NULL )
		{
			VAL_ASSIGN( tp[0], _t0 );
			VAL_ASSIGN( tp[1*inct], _t1 );
			VAL_ASSIGN( tp[2*inct], _t2 );
			VAL_ASSIGN( tp[3*inct], _t3 );
			VAL_ASSIGN( tp[4*inct], _t4 );
			tp += 5*inct;
		}

		VAL_SCALE( _t0, alpha );
		VAL_SCALE( _t1, alpha );
		VAL_SCALE( _t2, alpha );
		VAL_SCALE( _t3, alpha );
		VAL_SCALE( _t4, alpha );

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			oski_value_t* yp = y + j0*incy;
			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			REGISTER oski_value_t _y2;
			REGISTER oski_value_t _y3;
			REGISTER oski_value_t _y4;
			REGISTER oski_value_t _y5;
			REGISTER oski_value_t _y6;
			REGISTER oski_value_t _y7;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_SET_ZERO( _y2 );
			VAL_SET_ZERO( _y3 );
			VAL_SET_ZERO( _y4 );
			VAL_SET_ZERO( _y5 );
			VAL_SET_ZERO( _y6 );
			VAL_SET_ZERO( _y7 );
			VAL_MAC( _y0, vp[0], _t0 );
			VAL_MAC( _y1, vp[1], _t0 );
			VAL_MAC( _y2, vp[2], _t0 );
			VAL_MAC( _y3, vp[3], _t0 );
			VAL_MAC( _y4, vp[4], _t0 );
			VAL_MAC( _y5, vp[5], _t0 );
			VAL_MAC( _y6, vp[6], _t0 );
			VAL_MAC( _y7, vp[7], _t0 );
			VAL_MAC( _y0, vp[8], _t1 );
			VAL_MAC( _y1, vp[9], _t1 );
			VAL_MAC( _y2, vp[10], _t1 );
			VAL_MAC( _y3, vp[11], _t1 );
			VAL_MAC( _y4, vp[12], _t1 );
			VAL_MAC( _y5, vp[13], _t1 );
			VAL_MAC( _y6, vp[14], _t1 );
			VAL_MAC( _y7, vp[15], _t1 );
			VAL_MAC( _y0, vp[16], _t2 );
			VAL_MAC( _y1, vp[17], _t2 );
			VAL_MAC( _y2, vp[18], _t2 );
			VAL_MAC( _y3, vp[19], _t2 );
			VAL_MAC( _y4, vp[20], _t2 );
			VAL_MAC( _y5, vp[21], _t2 );
			VAL_MAC( _y6, vp[22], _t2 );
			VAL_MAC( _y7, vp[23], _t2 );
			VAL_MAC( _y0, vp[24], _t3 );
			VAL_MAC( _y1, vp[25], _t3 );
			VAL_MAC( _y2, vp[26], _t3 );
			VAL_MAC( _y3, vp[27], _t3 );
			VAL_MAC( _y4, vp[28], _t3 );
			VAL_MAC( _y5, vp[29], _t3 );
			VAL_MAC( _y6, vp[30], _t3 );
			VAL_MAC( _y7, vp[31], _t3 );
			VAL_MAC( _y0, vp[32], _t4 );
			VAL_MAC( _y1, vp[33], _t4 );
			VAL_MAC( _y2, vp[34], _t4 );
			VAL_MAC( _y3, vp[35], _t4 );
			VAL_MAC( _y4, vp[36], _t4 );
			VAL_MAC( _y5, vp[37], _t4 );
			VAL_MAC( _y6, vp[38], _t4 );
			VAL_MAC( _y7, vp[39], _t4 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1*incy], _y1 );
			VAL_INC( yp[2*incy], _y2 );
			VAL_INC( yp[3*incy], _y3 );
			VAL_INC( yp[4*incy], _y4 );
			VAL_INC( yp[5*incy], _y5 );
			VAL_INC( yp[6*incy], _y6 );
			VAL_INC( yp[7*incy], _y7 );
		}

		val += (ptr[I+1]-ptr[I]) * 40;
	}
} /* BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX */


#if defined(DO_NAME_MANGLING)
/** Mangled name for primary exportable symbol, MatReprTransMatReprMult. */
#define MatReprTransMatReprMult MANGLE_MOD_(MatReprTransMatReprMult_5x8)
#endif

/**
 *  \brief Exported module wrapper for the \f$5\times 8\f$
 *  implementation of \f$A^TA\cdot x\f$.
 */
int
MatReprTransMatReprMult( const oski_matBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x,
	oski_vecview_t y, oski_vecview_t t )
{
	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	oski_value_t* tp;
	oski_index_t inct;

	if( t == INVALID_VEC )
	{
		tp = NULL;
		inct = 0;
	}
	else
	{
		tp = t->val;
		inct = t->rowinc;
	}

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && y->rowinc == 1 )
			BCSR_MatTransMatMult_v1_aX_b1_xs1_ys1(
				A->num_block_rows, A->bptr, A->bind, A->bval,
				alpha, xp, yp, tp, inct );
		else
			BCSR_MatTransMatMult_v1_aX_b1_xsX_ysX(
				A->num_block_rows,
				A->bptr, A->bind, A->bval, alpha,
				xp, x->rowinc, yp, y->rowinc, tp, inct );

		xp += x->colinc;
		yp += y->colinc;
		if( tp != NULL ) tp += t->colinc;
	}
	return 0;
}

#if defined(DO_NAME_MANGLING)
/** Mangled name for BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1. */
#define BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1 \
	MANGLE_MOD_(BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1_5x8)
#endif

/**
 *  \brief The \f$5\times 8\f$ BCSR implementation
 *  of \f$A^HA\cdot x\f$, where the source and destination
 *  vectors have unit-stride and unit-stride,
 *  respectively.
 *
 *  Parameter 'tp' may be NULL if no intermediate vector output
 *  is desired.
 */
void
BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1( oski_index_t M,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val,
	oski_value_t alpha, const oski_value_t* restrict x,
	oski_value_t* restrict y,
	oski_value_t* restrict t, oski_index_t inct )
{
	oski_index_t I;
	oski_value_t* tp = t;

	for( I = 0; I < M; I++ )
	{
		oski_index_t K;
		REGISTER oski_value_t _t0 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t1 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t2 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t3 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t4 = MAKE_VAL_COMPLEX(0.0, 0.0);
		const oski_value_t* vp;

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _x4;
			REGISTER oski_value_t _x5;
			REGISTER oski_value_t _x6;
			REGISTER oski_value_t _x7;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1] );
			VAL_ASSIGN( _x2, xp[2] );
			VAL_ASSIGN( _x3, xp[3] );
			VAL_ASSIGN( _x4, xp[4] );
			VAL_ASSIGN( _x5, xp[5] );
			VAL_ASSIGN( _x6, xp[6] );
			VAL_ASSIGN( _x7, xp[7] );
			VAL_MAC( _t0, vp[0], _x0 );
			VAL_MAC( _t1, vp[8], _x0 );
			VAL_MAC( _t2, vp[16], _x0 );
			VAL_MAC( _t3, vp[24], _x0 );
			VAL_MAC( _t4, vp[32], _x0 );
			VAL_MAC( _t0, vp[1], _x1 );
			VAL_MAC( _t1, vp[9], _x1 );
			VAL_MAC( _t2, vp[17], _x1 );
			VAL_MAC( _t3, vp[25], _x1 );
			VAL_MAC( _t4, vp[33], _x1 );
			VAL_MAC( _t0, vp[2], _x2 );
			VAL_MAC( _t1, vp[10], _x2 );
			VAL_MAC( _t2, vp[18], _x2 );
			VAL_MAC( _t3, vp[26], _x2 );
			VAL_MAC( _t4, vp[34], _x2 );
			VAL_MAC( _t0, vp[3], _x3 );
			VAL_MAC( _t1, vp[11], _x3 );
			VAL_MAC( _t2, vp[19], _x3 );
			VAL_MAC( _t3, vp[27], _x3 );
			VAL_MAC( _t4, vp[35], _x3 );
			VAL_MAC( _t0, vp[4], _x4 );
			VAL_MAC( _t1, vp[12], _x4 );
			VAL_MAC( _t2, vp[20], _x4 );
			VAL_MAC( _t3, vp[28], _x4 );
			VAL_MAC( _t4, vp[36], _x4 );
			VAL_MAC( _t0, vp[5], _x5 );
			VAL_MAC( _t1, vp[13], _x5 );
			VAL_MAC( _t2, vp[21], _x5 );
			VAL_MAC( _t3, vp[29], _x5 );
			VAL_MAC( _t4, vp[37], _x5 );
			VAL_MAC( _t0, vp[6], _x6 );
			VAL_MAC( _t1, vp[14], _x6 );
			VAL_MAC( _t2, vp[22], _x6 );
			VAL_MAC( _t3, vp[30], _x6 );
			VAL_MAC( _t4, vp[38], _x6 );
			VAL_MAC( _t0, vp[7], _x7 );
			VAL_MAC( _t1, vp[15], _x7 );
			VAL_MAC( _t2, vp[23], _x7 );
			VAL_MAC( _t3, vp[31], _x7 );
			VAL_MAC( _t4, vp[39], _x7 );
		}

		if( tp != NULL )
		{
			VAL_ASSIGN( tp[0], _t0 );
			VAL_ASSIGN( tp[1*inct], _t1 );
			VAL_ASSIGN( tp[2*inct], _t2 );
			VAL_ASSIGN( tp[3*inct], _t3 );
			VAL_ASSIGN( tp[4*inct], _t4 );
			tp += 5*inct;
		}

		VAL_SCALE( _t0, alpha );
		VAL_SCALE( _t1, alpha );
		VAL_SCALE( _t2, alpha );
		VAL_SCALE( _t3, alpha );
		VAL_SCALE( _t4, alpha );

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			oski_value_t* yp = y + j0;
			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			REGISTER oski_value_t _y2;
			REGISTER oski_value_t _y3;
			REGISTER oski_value_t _y4;
			REGISTER oski_value_t _y5;
			REGISTER oski_value_t _y6;
			REGISTER oski_value_t _y7;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_SET_ZERO( _y2 );
			VAL_SET_ZERO( _y3 );
			VAL_SET_ZERO( _y4 );
			VAL_SET_ZERO( _y5 );
			VAL_SET_ZERO( _y6 );
			VAL_SET_ZERO( _y7 );
			VAL_MAC_CONJ( _y0, vp[0], _t0 );
			VAL_MAC_CONJ( _y1, vp[1], _t0 );
			VAL_MAC_CONJ( _y2, vp[2], _t0 );
			VAL_MAC_CONJ( _y3, vp[3], _t0 );
			VAL_MAC_CONJ( _y4, vp[4], _t0 );
			VAL_MAC_CONJ( _y5, vp[5], _t0 );
			VAL_MAC_CONJ( _y6, vp[6], _t0 );
			VAL_MAC_CONJ( _y7, vp[7], _t0 );
			VAL_MAC_CONJ( _y0, vp[8], _t1 );
			VAL_MAC_CONJ( _y1, vp[9], _t1 );
			VAL_MAC_CONJ( _y2, vp[10], _t1 );
			VAL_MAC_CONJ( _y3, vp[11], _t1 );
			VAL_MAC_CONJ( _y4, vp[12], _t1 );
			VAL_MAC_CONJ( _y5, vp[13], _t1 );
			VAL_MAC_CONJ( _y6, vp[14], _t1 );
			VAL_MAC_CONJ( _y7, vp[15], _t1 );
			VAL_MAC_CONJ( _y0, vp[16], _t2 );
			VAL_MAC_CONJ( _y1, vp[17], _t2 );
			VAL_MAC_CONJ( _y2, vp[18], _t2 );
			VAL_MAC_CONJ( _y3, vp[19], _t2 );
			VAL_MAC_CONJ( _y4, vp[20], _t2 );
			VAL_MAC_CONJ( _y5, vp[21], _t2 );
			VAL_MAC_CONJ( _y6, vp[22], _t2 );
			VAL_MAC_CONJ( _y7, vp[23], _t2 );
			VAL_MAC_CONJ( _y0, vp[24], _t3 );
			VAL_MAC_CONJ( _y1, vp[25], _t3 );
			VAL_MAC_CONJ( _y2, vp[26], _t3 );
			VAL_MAC_CONJ( _y3, vp[27], _t3 );
			VAL_MAC_CONJ( _y4, vp[28], _t3 );
			VAL_MAC_CONJ( _y5, vp[29], _t3 );
			VAL_MAC_CONJ( _y6, vp[30], _t3 );
			VAL_MAC_CONJ( _y7, vp[31], _t3 );
			VAL_MAC_CONJ( _y0, vp[32], _t4 );
			VAL_MAC_CONJ( _y1, vp[33], _t4 );
			VAL_MAC_CONJ( _y2, vp[34], _t4 );
			VAL_MAC_CONJ( _y3, vp[35], _t4 );
			VAL_MAC_CONJ( _y4, vp[36], _t4 );
			VAL_MAC_CONJ( _y5, vp[37], _t4 );
			VAL_MAC_CONJ( _y6, vp[38], _t4 );
			VAL_MAC_CONJ( _y7, vp[39], _t4 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1], _y1 );
			VAL_INC( yp[2], _y2 );
			VAL_INC( yp[3], _y3 );
			VAL_INC( yp[4], _y4 );
			VAL_INC( yp[5], _y5 );
			VAL_INC( yp[6], _y6 );
			VAL_INC( yp[7], _y7 );
		}

		val += (ptr[I+1]-ptr[I]) * 40;
	}
} /* BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1 */

#if defined(DO_NAME_MANGLING)
/** Mangled name for BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX. */
#define BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX \
	MANGLE_MOD_(BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX_5x8)
#endif

/**
 *  \brief The \f$5\times 8\f$ BCSR implementation
 *  of \f$A^HA\cdot x\f$, where the source and destination
 *  vectors have general-stride and general-stride,
 *  respectively.
 *
 *  Parameter 'tp' may be NULL if no intermediate vector output
 *  is desired.
 */
void
BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX( oski_index_t M,
	const oski_index_t* restrict ptr, const oski_index_t* restrict ind,
	const oski_value_t* restrict val,
	oski_value_t alpha, const oski_value_t* restrict x, oski_index_t incx,
	oski_value_t* restrict y, oski_index_t incy,
	oski_value_t* restrict t, oski_index_t inct )
{
	oski_index_t I;
	oski_value_t* tp = t;

	for( I = 0; I < M; I++ )
	{
		oski_index_t K;
		REGISTER oski_value_t _t0 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t1 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t2 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t3 = MAKE_VAL_COMPLEX(0.0, 0.0);
		REGISTER oski_value_t _t4 = MAKE_VAL_COMPLEX(0.0, 0.0);
		const oski_value_t* vp;

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			const oski_value_t* xp = x + j0*incx;
			REGISTER oski_value_t _x0;
			REGISTER oski_value_t _x1;
			REGISTER oski_value_t _x2;
			REGISTER oski_value_t _x3;
			REGISTER oski_value_t _x4;
			REGISTER oski_value_t _x5;
			REGISTER oski_value_t _x6;
			REGISTER oski_value_t _x7;
			VAL_ASSIGN( _x0, xp[0] );
			VAL_ASSIGN( _x1, xp[1*incx] );
			VAL_ASSIGN( _x2, xp[2*incx] );
			VAL_ASSIGN( _x3, xp[3*incx] );
			VAL_ASSIGN( _x4, xp[4*incx] );
			VAL_ASSIGN( _x5, xp[5*incx] );
			VAL_ASSIGN( _x6, xp[6*incx] );
			VAL_ASSIGN( _x7, xp[7*incx] );
			VAL_MAC( _t0, vp[0], _x0 );
			VAL_MAC( _t1, vp[8], _x0 );
			VAL_MAC( _t2, vp[16], _x0 );
			VAL_MAC( _t3, vp[24], _x0 );
			VAL_MAC( _t4, vp[32], _x0 );
			VAL_MAC( _t0, vp[1], _x1 );
			VAL_MAC( _t1, vp[9], _x1 );
			VAL_MAC( _t2, vp[17], _x1 );
			VAL_MAC( _t3, vp[25], _x1 );
			VAL_MAC( _t4, vp[33], _x1 );
			VAL_MAC( _t0, vp[2], _x2 );
			VAL_MAC( _t1, vp[10], _x2 );
			VAL_MAC( _t2, vp[18], _x2 );
			VAL_MAC( _t3, vp[26], _x2 );
			VAL_MAC( _t4, vp[34], _x2 );
			VAL_MAC( _t0, vp[3], _x3 );
			VAL_MAC( _t1, vp[11], _x3 );
			VAL_MAC( _t2, vp[19], _x3 );
			VAL_MAC( _t3, vp[27], _x3 );
			VAL_MAC( _t4, vp[35], _x3 );
			VAL_MAC( _t0, vp[4], _x4 );
			VAL_MAC( _t1, vp[12], _x4 );
			VAL_MAC( _t2, vp[20], _x4 );
			VAL_MAC( _t3, vp[28], _x4 );
			VAL_MAC( _t4, vp[36], _x4 );
			VAL_MAC( _t0, vp[5], _x5 );
			VAL_MAC( _t1, vp[13], _x5 );
			VAL_MAC( _t2, vp[21], _x5 );
			VAL_MAC( _t3, vp[29], _x5 );
			VAL_MAC( _t4, vp[37], _x5 );
			VAL_MAC( _t0, vp[6], _x6 );
			VAL_MAC( _t1, vp[14], _x6 );
			VAL_MAC( _t2, vp[22], _x6 );
			VAL_MAC( _t3, vp[30], _x6 );
			VAL_MAC( _t4, vp[38], _x6 );
			VAL_MAC( _t0, vp[7], _x7 );
			VAL_MAC( _t1, vp[15], _x7 );
			VAL_MAC( _t2, vp[23], _x7 );
			VAL_MAC( _t3, vp[31], _x7 );
			VAL_MAC( _t4, vp[39], _x7 );
		}

		if( tp != NULL )
		{
			VAL_ASSIGN( tp[0], _t0 );
			VAL_ASSIGN( tp[1*inct], _t1 );
			VAL_ASSIGN( tp[2*inct], _t2 );
			VAL_ASSIGN( tp[3*inct], _t3 );
			VAL_ASSIGN( tp[4*inct], _t4 );
			tp += 5*inct;
		}

		VAL_SCALE( _t0, alpha );
		VAL_SCALE( _t1, alpha );
		VAL_SCALE( _t2, alpha );
		VAL_SCALE( _t3, alpha );
		VAL_SCALE( _t4, alpha );

		for( K = ptr[I], vp = val; K < ptr[I+1]; K++, vp += 5*8 )
		{
			oski_index_t j0 = ind[K];
			oski_value_t* yp = y + j0*incy;
			REGISTER oski_value_t _y0;
			REGISTER oski_value_t _y1;
			REGISTER oski_value_t _y2;
			REGISTER oski_value_t _y3;
			REGISTER oski_value_t _y4;
			REGISTER oski_value_t _y5;
			REGISTER oski_value_t _y6;
			REGISTER oski_value_t _y7;
			VAL_SET_ZERO( _y0 );
			VAL_SET_ZERO( _y1 );
			VAL_SET_ZERO( _y2 );
			VAL_SET_ZERO( _y3 );
			VAL_SET_ZERO( _y4 );
			VAL_SET_ZERO( _y5 );
			VAL_SET_ZERO( _y6 );
			VAL_SET_ZERO( _y7 );
			VAL_MAC_CONJ( _y0, vp[0], _t0 );
			VAL_MAC_CONJ( _y1, vp[1], _t0 );
			VAL_MAC_CONJ( _y2, vp[2], _t0 );
			VAL_MAC_CONJ( _y3, vp[3], _t0 );
			VAL_MAC_CONJ( _y4, vp[4], _t0 );
			VAL_MAC_CONJ( _y5, vp[5], _t0 );
			VAL_MAC_CONJ( _y6, vp[6], _t0 );
			VAL_MAC_CONJ( _y7, vp[7], _t0 );
			VAL_MAC_CONJ( _y0, vp[8], _t1 );
			VAL_MAC_CONJ( _y1, vp[9], _t1 );
			VAL_MAC_CONJ( _y2, vp[10], _t1 );
			VAL_MAC_CONJ( _y3, vp[11], _t1 );
			VAL_MAC_CONJ( _y4, vp[12], _t1 );
			VAL_MAC_CONJ( _y5, vp[13], _t1 );
			VAL_MAC_CONJ( _y6, vp[14], _t1 );
			VAL_MAC_CONJ( _y7, vp[15], _t1 );
			VAL_MAC_CONJ( _y0, vp[16], _t2 );
			VAL_MAC_CONJ( _y1, vp[17], _t2 );
			VAL_MAC_CONJ( _y2, vp[18], _t2 );
			VAL_MAC_CONJ( _y3, vp[19], _t2 );
			VAL_MAC_CONJ( _y4, vp[20], _t2 );
			VAL_MAC_CONJ( _y5, vp[21], _t2 );
			VAL_MAC_CONJ( _y6, vp[22], _t2 );
			VAL_MAC_CONJ( _y7, vp[23], _t2 );
			VAL_MAC_CONJ( _y0, vp[24], _t3 );
			VAL_MAC_CONJ( _y1, vp[25], _t3 );
			VAL_MAC_CONJ( _y2, vp[26], _t3 );
			VAL_MAC_CONJ( _y3, vp[27], _t3 );
			VAL_MAC_CONJ( _y4, vp[28], _t3 );
			VAL_MAC_CONJ( _y5, vp[29], _t3 );
			VAL_MAC_CONJ( _y6, vp[30], _t3 );
			VAL_MAC_CONJ( _y7, vp[31], _t3 );
			VAL_MAC_CONJ( _y0, vp[32], _t4 );
			VAL_MAC_CONJ( _y1, vp[33], _t4 );
			VAL_MAC_CONJ( _y2, vp[34], _t4 );
			VAL_MAC_CONJ( _y3, vp[35], _t4 );
			VAL_MAC_CONJ( _y4, vp[36], _t4 );
			VAL_MAC_CONJ( _y5, vp[37], _t4 );
			VAL_MAC_CONJ( _y6, vp[38], _t4 );
			VAL_MAC_CONJ( _y7, vp[39], _t4 );
			VAL_INC( yp[0], _y0 );
			VAL_INC( yp[1*incy], _y1 );
			VAL_INC( yp[2*incy], _y2 );
			VAL_INC( yp[3*incy], _y3 );
			VAL_INC( yp[4*incy], _y4 );
			VAL_INC( yp[5*incy], _y5 );
			VAL_INC( yp[6*incy], _y6 );
			VAL_INC( yp[7*incy], _y7 );
		}

		val += (ptr[I+1]-ptr[I]) * 40;
	}
} /* BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX */


#if defined(DO_NAME_MANGLING)
/** Mangled name for primary exportable symbol, MatReprHermMatReprMult. */
#define MatReprHermMatReprMult MANGLE_MOD_(MatReprHermMatReprMult_5x8)
#endif

/**
 *  \brief Exported module wrapper for the \f$5\times 8\f$
 *  implementation of \f$A^HA\cdot x\f$.
 */
int
MatReprHermMatReprMult( const oski_matBCSR_t* A,
	oski_value_t alpha, const oski_vecview_t x,
	oski_vecview_t y, oski_vecview_t t )
{
	oski_index_t j;
	const oski_value_t* xp = x->val;
	oski_value_t* yp = y->val;
	oski_value_t* tp;
	oski_index_t inct;

	if( t == INVALID_VEC )
	{
		tp = NULL;
		inct = 0;
	}
	else
	{
		tp = t->val;
		inct = t->rowinc;
	}

	for( j = 0; j < x->num_cols; j++ )
	{
		if( x->rowinc == 1 && y->rowinc == 1 )
			BCSR_MatHermMatMult_v1_aX_b1_xs1_ys1(
				A->num_block_rows, A->bptr, A->bind, A->bval,
				alpha, xp, yp, tp, inct );
		else
			BCSR_MatHermMatMult_v1_aX_b1_xsX_ysX(
				A->num_block_rows,
				A->bptr, A->bind, A->bval, alpha,
				xp, x->rowinc, yp, y->rowinc, tp, inct );

		xp += x->colinc;
		yp += y->colinc;
		if( tp != NULL ) tp += t->colinc;
	}
	return 0;
}


/* eof */
