	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_coo_wrapper       ## -- Begin function spmv_coo_wrapper
	.p2align	4, 0x90
_spmv_coo_wrapper:                      ## @spmv_coo_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	16(%rdi), %ebx
	testl	%ebx, %ebx
	jle	LBB0_3
## %bb.1:
	movq	%rdi, %r15
	movl	12(%rdi), %r14d
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	24(%r15), %rdi
	movq	32(%r15), %rsi
	movq	40(%r15), %rdx
	movl	8(%r15), %r8d
	movq	48(%r15), %r9
	movq	56(%r15), %rax
	movq	%rax, (%rsp)
	movl	%r14d, %ecx
	callq	_spmv_coo
	decl	%ebx
	jne	LBB0_2
LBB0_3:
	xorl	%edi, %edi
	callq	_pthread_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_csr_wrapper       ## -- Begin function spmv_csr_wrapper
	.p2align	4, 0x90
_spmv_csr_wrapper:                      ## @spmv_csr_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	16(%rdi), %ebx
	testl	%ebx, %ebx
	jle	LBB1_3
## %bb.1:
	movq	%rdi, %r15
	movl	12(%rdi), %r14d
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	24(%r15), %rdi
	movq	32(%r15), %rsi
	movq	40(%r15), %rdx
	movq	48(%r15), %r8
	movq	56(%r15), %r9
	movl	%r14d, %ecx
	callq	_spmv_csr
	decl	%ebx
	jne	LBB1_2
LBB1_3:
	xorl	%edi, %edi
	callq	_pthread_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_dia_wrapper       ## -- Begin function spmv_dia_wrapper
	.p2align	4, 0x90
_spmv_dia_wrapper:                      ## @spmv_dia_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	28(%rdi), %r14d
	testl	%r14d, %r14d
	jle	LBB2_3
## %bb.1:
	movq	%rdi, %rbx
	.p2align	4, 0x90
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	32(%rbx), %rdi
	movq	40(%rbx), %rsi
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	movl	12(%rbx), %r8d
	movl	20(%rbx), %r9d
	movl	16(%rbx), %eax
	subq	$8, %rsp
	pushq	56(%rbx)
	pushq	48(%rbx)
	pushq	%rax
	callq	_spmv_dia
	addq	$32, %rsp
	decl	%r14d
	jne	LBB2_2
LBB2_3:
	xorl	%edi, %edi
	callq	_pthread_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_ell_wrapper       ## -- Begin function spmv_ell_wrapper
	.p2align	4, 0x90
_spmv_ell_wrapper:                      ## @spmv_ell_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	20(%rdi), %r14d
	testl	%r14d, %r14d
	jle	LBB3_3
## %bb.1:
	movq	%rdi, %rbx
	.p2align	4, 0x90
LBB3_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	movl	12(%rbx), %r8d
	movl	16(%rbx), %r9d
	pushq	48(%rbx)
	pushq	40(%rbx)
	callq	_spmv_ell
	addq	$16, %rsp
	decl	%r14d
	jne	LBB3_2
LBB3_3:
	xorl	%edi, %edi
	callq	_pthread_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_diaii_wrapper     ## -- Begin function spmv_diaii_wrapper
	.p2align	4, 0x90
_spmv_diaii_wrapper:                    ## @spmv_diaii_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_ellii_wrapper     ## -- Begin function spmv_ellii_wrapper
	.p2align	4, 0x90
_spmv_ellii_wrapper:                    ## @spmv_ellii_wrapper
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movl	20(%rdi), %r14d
	testl	%r14d, %r14d
	jle	LBB5_3
## %bb.1:
	movq	%rdi, %rbx
	.p2align	4, 0x90
LBB5_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	24(%rbx), %rdi
	movq	32(%rbx), %rsi
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	movl	12(%rbx), %r8d
	movl	16(%rbx), %r9d
	pushq	48(%rbx)
	pushq	40(%rbx)
	callq	_spmv_ellii
	addq	$16, %rsp
	decl	%r14d
	jne	LBB5_2
LBB5_3:
	xorl	%edi, %edi
	callq	_pthread_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI6_0:
	.quad	4521832792735477133     ## double 1.9999999999999999E-6
LCPI6_1:
	.quad	4741671816366391296     ## double 1.0E+9
LCPI6_2:
	.quad	4613937818241073152     ## double 3
LCPI6_3:
	.quad	4696837146684686336     ## double 1.0E+6
LCPI6_4:
	.quad	0                       ## double 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$376, %rsp              ## imm = 0x178
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, %r15
	cmpl	$3, %edi
	jle	LBB6_312
## %bb.1:
	movq	8(%r15), %rdi
	leaq	L_.str.1(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB6_309
## %bb.2:
	movq	%rax, %rbx
	movq	24(%r15), %rdi
	callq	_atoi
	movl	%eax, %r14d
	leaq	-172(%rbp), %rsi
	movq	%rbx, %rdi
	callq	_mm_read_banner
	testl	%eax, %eax
	jne	LBB6_310
## %bb.3:
	cmpb	$67, -170(%rbp)
	jne	LBB6_6
## %bb.4:
	cmpb	$77, -172(%rbp)
	jne	LBB6_6
## %bb.5:
	cmpb	$67, -171(%rbp)
	je	LBB6_313
LBB6_6:
	leaq	-324(%rbp), %rsi
	leaq	-44(%rbp), %rdx
	leaq	-156(%rbp), %rcx
	movq	%rbx, %rdi
	callq	_mm_read_mtx_crd_size
	testl	%eax, %eax
	jne	LBB6_309
## %bb.7:
	cmpb	$83, -169(%rbp)
	movq	%rbx, -272(%rbp)        ## 8-byte Spill
	movl	%r14d, -68(%rbp)        ## 4-byte Spill
	movq	%r15, -264(%rbp)        ## 8-byte Spill
	jne	LBB6_12
## %bb.8:
	cmpb	$80, -170(%rbp)
	movl	-156(%rbp), %eax
	jne	LBB6_15
## %bb.9:
	testl	%eax, %eax
	jle	LBB6_22
## %bb.10:
	leaq	-128(%rbp), %r13
	leaq	-124(%rbp), %r12
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	movq	-272(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB6_11:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.6(%rip), %rsi
	movq	%r13, %rdx
	movq	%r12, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-128(%rbp), %eax
	xorl	%ecx, %ecx
	cmpl	-124(%rbp), %eax
	sete	%cl
	subl	%ecx, %r15d
	addl	$2, %r15d
	incl	%ebx
	cmpl	-156(%rbp), %ebx
	jl	LBB6_11
	jmp	LBB6_23
LBB6_12:
	cmpl	$0, -156(%rbp)
	jle	LBB6_22
## %bb.13:
	leaq	-124(%rbp), %r12
	leaq	-296(%rbp), %r13
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	movq	-272(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB6_14:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	-128(%rbp), %rdx
	movq	%r12, %rcx
	movq	%r13, %r8
	xorl	%eax, %eax
	callq	_fscanf
	xorl	%eax, %eax
	xorpd	%xmm0, %xmm0
	ucomisd	-296(%rbp), %xmm0
	setne	%al
	addl	%eax, %r15d
	incl	%ebx
	cmpl	-156(%rbp), %ebx
	jl	LBB6_14
	jmp	LBB6_23
LBB6_15:
	testl	%eax, %eax
	jle	LBB6_22
## %bb.16:
	leaq	-124(%rbp), %r12
	leaq	-296(%rbp), %r13
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	movq	-272(%rbp), %r14        ## 8-byte Reload
	.p2align	4, 0x90
LBB6_17:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	-128(%rbp), %rdx
	movq	%r12, %rcx
	movq	%r13, %r8
	xorl	%eax, %eax
	callq	_fscanf
	xorpd	%xmm0, %xmm0
	ucomisd	-296(%rbp), %xmm0
	je	LBB6_21
## %bb.18:                              ##   in Loop: Header=BB6_17 Depth=1
	movl	-128(%rbp), %eax
	cmpl	-124(%rbp), %eax
	jne	LBB6_20
## %bb.19:                              ##   in Loop: Header=BB6_17 Depth=1
	incl	%r15d
	jmp	LBB6_21
	.p2align	4, 0x90
LBB6_20:                                ##   in Loop: Header=BB6_17 Depth=1
	addl	$2, %r15d
LBB6_21:                                ##   in Loop: Header=BB6_17 Depth=1
	incl	%ebx
	cmpl	-156(%rbp), %ebx
	movq	-272(%rbp), %r14        ## 8-byte Reload
	jl	LBB6_17
	jmp	LBB6_23
LBB6_22:
	xorl	%r15d, %r15d
	movq	-272(%rbp), %r14        ## 8-byte Reload
LBB6_23:
	movq	%r15, -168(%rbp)        ## 8-byte Spill
	movq	%r14, %rdi
	callq	_rewind
	leaq	-172(%rbp), %rsi
	movq	%r14, %rdi
	callq	_mm_read_banner
	testl	%eax, %eax
	jne	LBB6_310
## %bb.24:
	leaq	-324(%rbp), %rsi
	leaq	-44(%rbp), %rdx
	leaq	-156(%rbp), %rcx
	movq	%r14, %rdi
	callq	_mm_read_mtx_crd_size
	testl	%eax, %eax
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	jne	LBB6_309
## %bb.25:
	movl	-324(%rbp), %r13d
	movl	-44(%rbp), %eax
	cmpl	%eax, %r13d
	jle	LBB6_27
## %bb.26:
	movl	%r13d, -44(%rbp)
	jmp	LBB6_28
LBB6_27:
	movl	%eax, -324(%rbp)
	movl	%eax, %r13d
LBB6_28:
	movslq	%ecx, %r14
	leaq	(,%r14,4), %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB6_314
## %bb.29:
	movq	%rbx, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB6_315
## %bb.30:
	movq	%rax, %r15
	shlq	$3, %r14
	movq	%r14, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB6_311
## %bb.31:
	movq	%rax, %r12
	leal	1(%r13), %eax
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB6_317
## %bb.32:
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB6_318
## %bb.33:
	movq	%r14, %rdi
	callq	_malloc
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	testq	%rax, %rax
	je	LBB6_311
## %bb.34:
	movslq	%r13d, %rdi
	shlq	$3, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB6_319
## %bb.35:
	movq	%rax, %rbx
	movl	%r13d, %edi
	movq	%rax, %rsi
	callq	_init_arr
	movslq	-44(%rbp), %rdi
	movl	$8, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB6_320
## %bb.36:
	movq	%rax, %r13
	movb	-170(%rbp), %cl
	cmpb	$83, -169(%rbp)
	movl	-156(%rbp), %eax
	movq	%r15, -56(%rbp)         ## 8-byte Spill
	movq	%r12, -64(%rbp)         ## 8-byte Spill
	movq	%rbx, -208(%rbp)        ## 8-byte Spill
	jne	LBB6_43
## %bb.37:
	cmpb	$80, %cl
	jne	LBB6_47
## %bb.38:
	testl	%eax, %eax
	jle	LBB6_69
## %bb.39:
	leaq	-124(%rbp), %r14
	movabsq	$4607182418800017408, %r15 ## imm = 0x3FF0000000000000
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB6_40:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.6(%rip), %rsi
	leaq	-128(%rbp), %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-128(%rbp), %esi
	leal	-1(%rsi), %r8d
	movslq	%r12d, %rax
	movq	-144(%rbp), %r9         ## 8-byte Reload
	movl	%r8d, (%r9,%rax,4)
	movl	-124(%rbp), %edi
	leal	-1(%rdi), %edx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	%edx, (%rcx,%rax,4)
	movq	-64(%rbp), %r10         ## 8-byte Reload
	movq	%r15, (%r10,%rax,8)
	incl	%eax
	cmpl	%edi, %esi
	je	LBB6_42
## %bb.41:                              ##   in Loop: Header=BB6_40 Depth=1
	cltq
	movl	%edx, (%r9,%rax,4)
	movl	%r8d, (%rcx,%rax,4)
	movq	%r15, (%r10,%rax,8)
	addl	$2, %r12d
	movl	%r12d, %eax
LBB6_42:                                ##   in Loop: Header=BB6_40 Depth=1
	incl	%ebx
	movl	%eax, %r12d
	cmpl	-156(%rbp), %ebx
	jl	LBB6_40
	jmp	LBB6_69
LBB6_43:
	cmpb	$80, %cl
	jne	LBB6_60
## %bb.44:
	testl	%eax, %eax
	jle	LBB6_69
## %bb.45:
	leaq	L_.str.6(%rip), %r12
	leaq	-124(%rbp), %r14
	movabsq	$4607182418800017408, %r15 ## imm = 0x3FF0000000000000
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB6_46:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	movq	%r12, %rsi
	leaq	-128(%rbp), %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	-128(%rbp), %eax
	decl	%eax
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-124(%rbp), %eax
	decl	%eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%r15, (%rax,%rbx,8)
	incq	%rbx
	movslq	-156(%rbp), %rax
	cmpq	%rax, %rbx
	jl	LBB6_46
	jmp	LBB6_69
LBB6_47:
	testl	%eax, %eax
	jle	LBB6_69
## %bb.48:
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movq	-64(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_49:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.5(%rip), %rsi
	leaq	-128(%rbp), %rdx
	leaq	-124(%rbp), %rcx
	leaq	-296(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	movsd	-296(%rbp), %xmm0       ## xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	je	LBB6_56
## %bb.50:                              ##   in Loop: Header=BB6_49 Depth=1
	movl	-128(%rbp), %eax
	decl	%eax
	movslq	%r15d, %rbx
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-124(%rbp), %eax
	decl	%eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movsd	%xmm0, (%r14,%rbx,8)
	callq	___fpclassifyd
	cmpl	$1, %eax
	je	LBB6_307
## %bb.51:                              ##   in Loop: Header=BB6_49 Depth=1
	movsd	(%r14,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	callq	___fpclassifyd
	cmpl	$2, %eax
	je	LBB6_308
## %bb.52:                              ##   in Loop: Header=BB6_49 Depth=1
	movsd	(%r14,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	callq	___fpclassifyd
	cmpl	$5, %eax
	jne	LBB6_54
## %bb.53:                              ##   in Loop: Header=BB6_49 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.16(%rip), %rdi
	callq	_fwrite
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	$0, (%rax,%rbx,8)
LBB6_54:                                ##   in Loop: Header=BB6_49 Depth=1
	movl	-128(%rbp), %eax
	cmpl	-124(%rbp), %eax
	jne	LBB6_57
## %bb.55:                              ##   in Loop: Header=BB6_49 Depth=1
	incl	%r15d
LBB6_56:                                ##   in Loop: Header=BB6_49 Depth=1
	incl	%r12d
	cmpl	-156(%rbp), %r12d
	jl	LBB6_49
	jmp	LBB6_69
	.p2align	4, 0x90
LBB6_57:                                ##   in Loop: Header=BB6_49 Depth=1
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movl	(%rdx,%rbx,4), %eax
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, 4(%rcx,%rbx,4)
	movl	(%rcx,%rbx,4), %eax
	movl	%eax, 4(%rdx,%rbx,4)
	movsd	-296(%rbp), %xmm0       ## xmm0 = mem[0],zero
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movsd	%xmm0, 8(%rax,%rbx,8)
	callq	___fpclassifyd
	cmpl	$5, %eax
	jne	LBB6_59
## %bb.58:                              ##   in Loop: Header=BB6_49 Depth=1
	incq	%rbx
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.16(%rip), %rdi
	callq	_fwrite
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	$0, (%rax,%rbx,8)
LBB6_59:                                ##   in Loop: Header=BB6_49 Depth=1
	addl	$2, %r15d
	incl	%r12d
	cmpl	-156(%rbp), %r12d
	jl	LBB6_49
	jmp	LBB6_69
LBB6_60:
	testl	%eax, %eax
	jle	LBB6_69
## %bb.61:
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movq	-64(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_62:                                ## =>This Inner Loop Header: Depth=1
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	leaq	L_.str.5(%rip), %rsi
	leaq	-128(%rbp), %rdx
	leaq	-124(%rbp), %rcx
	leaq	-296(%rbp), %r8
	xorl	%eax, %eax
	callq	_fscanf
	movsd	-296(%rbp), %xmm0       ## xmm0 = mem[0],zero
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	je	LBB6_68
## %bb.63:                              ##   in Loop: Header=BB6_62 Depth=1
	movl	-128(%rbp), %eax
	decl	%eax
	movslq	%r15d, %rbx
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movl	-124(%rbp), %eax
	decl	%eax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	%eax, (%rcx,%rbx,4)
	movsd	%xmm0, (%r14,%rbx,8)
	callq	___fpclassifyd
	cmpl	$1, %eax
	je	LBB6_307
## %bb.64:                              ##   in Loop: Header=BB6_62 Depth=1
	movsd	(%r14,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	callq	___fpclassifyd
	cmpl	$2, %eax
	je	LBB6_308
## %bb.65:                              ##   in Loop: Header=BB6_62 Depth=1
	movsd	(%r14,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	callq	___fpclassifyd
	cmpl	$5, %eax
	jne	LBB6_67
## %bb.66:                              ##   in Loop: Header=BB6_62 Depth=1
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movl	$22, %esi
	movl	$1, %edx
	leaq	L_.str.16(%rip), %rdi
	callq	_fwrite
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	$0, (%rax,%rbx,8)
LBB6_67:                                ##   in Loop: Header=BB6_62 Depth=1
	incl	%r15d
LBB6_68:                                ##   in Loop: Header=BB6_62 Depth=1
	incl	%r12d
	cmpl	-156(%rbp), %r12d
	jl	LBB6_62
LBB6_69:
	movq	-168(%rbp), %r14        ## 8-byte Reload
	leal	-1(%r14), %r8d
	movq	-144(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %rdi
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	xorl	%ecx, %ecx
	callq	_quickSort
	movl	$1, -224(%rbp)          ## 4-byte Folded Spill
	cmpl	$1000000, %r14d         ## imm = 0xF4240
	jg	LBB6_75
## %bb.70:
	movl	$500, -224(%rbp)        ## 4-byte Folded Spill
                                        ## imm = 0x1F4
	cmpl	$100000, %r14d          ## imm = 0x186A0
	jg	LBB6_75
## %bb.71:
	movl	$1000, -224(%rbp)       ## 4-byte Folded Spill
                                        ## imm = 0x3E8
	cmpl	$50000, %r14d           ## imm = 0xC350
	jg	LBB6_75
## %bb.72:
	movl	$5000, -224(%rbp)       ## 4-byte Folded Spill
                                        ## imm = 0x1388
	cmpl	$20000, %r14d           ## imm = 0x4E20
	jg	LBB6_75
## %bb.73:
	movl	$10000, -224(%rbp)      ## 4-byte Folded Spill
                                        ## imm = 0x2710
	cmpl	$5000, %r14d            ## imm = 0x1388
	jg	LBB6_75
## %bb.74:
	cmpl	$500, %r14d             ## imm = 0x1F4
	movl	$100000, %eax           ## imm = 0x186A0
	movl	$1000000, %ecx          ## imm = 0xF4240
	cmovgl	%eax, %ecx
	movl	%ecx, -224(%rbp)        ## 4-byte Spill
LBB6_75:
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movl	%r15d, %eax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	leaq	15(,%rax,8), %rax
	andq	$-16, %rax
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, %r12
	movq	-264(%rbp), %rax        ## 8-byte Reload
	movq	16(%rax), %rdi
	callq	_atoi
                                        ## kill: def $eax killed $eax def $rax
	decl	%eax
	cmpl	$5, %eax
	ja	LBB6_218
## %bb.76:
	leaq	LJTI6_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
LBB6_77:
	movq	%rsp, -336(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movl	%r15d, %ecx
	movq	%rsp, %r15
	movl	%r14d, %eax
	cltd
	idivl	%ecx
	movl	%eax, %esi
	testl	%ecx, %ecx
	jle	LBB6_107
## %bb.78:
	movabsq	$-4294967296, %rdi      ## imm = 0xFFFFFFFF00000000
	movl	-44(%rbp), %eax
	cltq
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	movslq	%esi, %rax
	movslq	%ecx, %rcx
	movq	%rcx, -280(%rbp)        ## 8-byte Spill
	leaq	(,%rax,4), %rcx
	movq	%rcx, -288(%rbp)        ## 8-byte Spill
	shlq	$3, %rax
	movq	%rax, -184(%rbp)        ## 8-byte Spill
	xorl	%ebx, %ebx
	movl	%esi, -232(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB6_79:                                ## =>This Inner Loop Header: Depth=1
	movq	%rdi, -120(%rbp)        ## 8-byte Spill
	movl	$64, %edi
	callq	_malloc
	movq	%rax, (%r15,%rbx,8)
	testq	%rax, %rax
	je	LBB6_306
## %bb.80:                              ##   in Loop: Header=BB6_79 Depth=1
	movq	%rax, %r14
	movq	%rbx, -152(%rbp)        ## 8-byte Spill
	movl	%ebx, (%rax)
	movq	-168(%rbp), %rax        ## 8-byte Reload
	movl	%eax, 4(%r14)
	movq	-264(%rbp), %rdi        ## 8-byte Reload
	movl	%edi, 8(%r14)
	movq	-144(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, 24(%r14)
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	%rax, 32(%r14)
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rax, 40(%r14)
	movq	-208(%rbp), %rax        ## 8-byte Reload
	movq	%rax, 48(%r14)
	movl	$8, %esi
	callq	_calloc
	movq	%rax, 56(%r14)
	movl	-232(%rbp), %esi        ## 4-byte Reload
	movl	%esi, 12(%r14)
	movl	-224(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 16(%r14)
	movq	-152(%rbp), %rcx        ## 8-byte Reload
	incq	%rcx
	movq	-120(%rbp), %rdi        ## 8-byte Reload
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rdi
	movq	-288(%rbp), %rax        ## 8-byte Reload
	addq	%rax, %rbx
	movq	%rbx, -144(%rbp)        ## 8-byte Spill
	addq	%rax, -56(%rbp)         ## 8-byte Folded Spill
	movq	-64(%rbp), %rax         ## 8-byte Reload
	addq	-184(%rbp), %rax        ## 8-byte Folded Reload
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movq	%rcx, %rbx
	cmpq	-280(%rbp), %rcx        ## 8-byte Folded Reload
	jl	LBB6_79
## %bb.81:
	sarq	$32, %rdi
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_108
LBB6_82:
	movl	-44(%rbp), %esi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %r8          ## 8-byte Reload
	movq	-120(%rbp), %r9         ## 8-byte Reload
	pushq	-152(%rbp)              ## 8-byte Folded Reload
	pushq	-232(%rbp)              ## 8-byte Folded Reload
	callq	_coo_csr
	addq	$16, %rsp
	movq	%rsp, -288(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %edi
	movl	%edi, %eax
	cltd
	idivl	%r15d
	movl	%eax, %esi
	testl	%r15d, %r15d
	jle	LBB6_173
## %bb.83:
	movabsq	$-4294967296, %rbx      ## imm = 0xFFFFFFFF00000000
	movslq	%esi, %rax
	movslq	%r15d, %rcx
	movq	%rcx, -184(%rbp)        ## 8-byte Spill
	leaq	(,%rax,4), %rcx
	movq	%rcx, -280(%rbp)        ## 8-byte Spill
	shlq	$3, %rax
	movq	%rax, -264(%rbp)        ## 8-byte Spill
	xorl	%r15d, %r15d
	movq	%r13, %r14
	movl	%esi, -144(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB6_84:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, -56(%rbp)         ## 8-byte Spill
	movl	%edi, %ebx
	movl	$64, %edi
	callq	_malloc
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx,%r15,8)
	testq	%rax, %rax
	je	LBB6_306
## %bb.85:                              ##   in Loop: Header=BB6_84 Depth=1
	movl	%r15d, (%rax)
	movq	-168(%rbp), %rcx        ## 8-byte Reload
	movl	%ecx, 4(%rax)
	movl	%ebx, %edi
	movl	%ebx, 8(%rax)
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 24(%rax)
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, 32(%rax)
	movq	-152(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, 40(%rax)
	movq	-208(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, 48(%rax)
	movq	%r14, 56(%rax)
	movl	-144(%rbp), %esi        ## 4-byte Reload
	movl	%esi, 12(%rax)
	movl	-224(%rbp), %ecx        ## 4-byte Reload
	movl	%ecx, 16(%rax)
	incq	%r15
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rbx
	addq	-280(%rbp), %rdx        ## 8-byte Folded Reload
	movq	%rdx, -120(%rbp)        ## 8-byte Spill
	addq	-264(%rbp), %r14        ## 8-byte Folded Reload
	cmpq	-184(%rbp), %r15        ## 8-byte Folded Reload
	jl	LBB6_84
## %bb.86:
	sarq	$32, %rbx
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_174
LBB6_87:
	movl	-44(%rbp), %esi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %r8          ## 8-byte Reload
	movq	-120(%rbp), %rbx        ## 8-byte Reload
	movq	%rbx, %r9
	pushq	-152(%rbp)              ## 8-byte Folded Reload
	movq	-232(%rbp), %r15        ## 8-byte Reload
	pushq	%r15
	callq	_coo_csr
	addq	$16, %rsp
	movl	-44(%rbp), %r9d
	subq	$8, %rsp
	leaq	-316(%rbp), %rax
	leaq	-320(%rbp), %r10
	leaq	-312(%rbp), %rcx
	leaq	-304(%rbp), %r8
	movq	%rbx, %rdi
	movq	%r15, %rsi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	pushq	%r14
	pushq	%rax
	pushq	%r10
	callq	_csr_dia
	addq	$32, %rsp
	movq	%rsp, -288(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %ebx
	movl	%ebx, %eax
	cltd
	idivl	%r15d
	movl	%eax, %edx
	testl	%r15d, %r15d
	jle	LBB6_192
## %bb.88:
	movabsq	$-4294967296, %rsi      ## imm = 0xFFFFFFFF00000000
	movl	-320(%rbp), %eax
	movl	-316(%rbp), %ecx
	movl	%ecx, -152(%rbp)        ## 4-byte Spill
	movq	-304(%rbp), %rcx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movq	-312(%rbp), %rcx
	movq	%rcx, -264(%rbp)        ## 8-byte Spill
	movslq	%r15d, %rcx
	movq	%rcx, -184(%rbp)        ## 8-byte Spill
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	imull	%edx, %eax
	movl	%eax, -280(%rbp)        ## 4-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	movl	%edx, -144(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB6_89:                                ## =>This Inner Loop Header: Depth=1
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movl	$64, %edi
	callq	_malloc
	movq	%rax, %rcx
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, (%rax,%r15,8)
	testq	%rcx, %rcx
	je	LBB6_306
## %bb.90:                              ##   in Loop: Header=BB6_89 Depth=1
	movl	%r15d, (%rcx)
	movl	-120(%rbp), %esi        ## 4-byte Reload
	movl	%esi, 12(%rcx)
	movl	%ebx, 20(%rcx)
	movl	-152(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 16(%rcx)
	movl	%r14d, %eax
	cltd
	idivl	%esi
	movl	%eax, 4(%rcx)
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 40(%rcx)
	movq	-264(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 32(%rcx)
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 48(%rcx)
	movq	%r13, 56(%rcx)
	movl	-144(%rbp), %edx        ## 4-byte Reload
	addl	%edx, %eax
	movl	%eax, 8(%rcx)
	movl	-224(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 28(%rcx)
	incq	%r15
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rsi
	addl	-280(%rbp), %r14d       ## 4-byte Folded Reload
	cmpq	-184(%rbp), %r15        ## 8-byte Folded Reload
	jl	LBB6_89
## %bb.91:
	sarq	$32, %rsi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_193
LBB6_92:
	movl	-44(%rbp), %esi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %r8          ## 8-byte Reload
	movq	-120(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	pushq	-152(%rbp)              ## 8-byte Folded Reload
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	pushq	%rbx
	callq	_coo_csr
	addq	$16, %rsp
	movl	-44(%rbp), %r9d
	leaq	-304(%rbp), %rax
	leaq	-408(%rbp), %rcx
	leaq	-312(%rbp), %r8
	movq	%r15, %rdi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	%rbx, %rsi
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	pushq	%r14
	pushq	%rax
	callq	_csr_ell
	addq	$16, %rsp
	movq	%rsp, -280(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %ebx
	movl	%ebx, %eax
	cltd
	idivl	%r15d
	movl	%eax, %edx
	testl	%r15d, %r15d
	jle	LBB6_221
## %bb.93:
	movabsq	$-4294967296, %rsi      ## imm = 0xFFFFFFFF00000000
	movl	-304(%rbp), %eax
	movq	-312(%rbp), %rcx
	movq	%rcx, -152(%rbp)        ## 8-byte Spill
	movq	-408(%rbp), %rcx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movslq	%r15d, %rcx
	movq	%rcx, -264(%rbp)        ## 8-byte Spill
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	imull	%edx, %eax
	movl	%eax, -184(%rbp)        ## 4-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	movl	%edx, -144(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB6_94:                                ## =>This Inner Loop Header: Depth=1
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movl	$56, %edi
	callq	_malloc
	movq	%rax, %rcx
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, (%rax,%r15,8)
	testq	%rcx, %rcx
	je	LBB6_306
## %bb.95:                              ##   in Loop: Header=BB6_94 Depth=1
	movl	%r15d, (%rcx)
	movl	-120(%rbp), %esi        ## 4-byte Reload
	movl	%esi, 12(%rcx)
	movl	%ebx, 16(%rcx)
	movl	%r14d, %eax
	cltd
	idivl	%esi
	movl	%eax, 4(%rcx)
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 32(%rcx)
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 24(%rcx)
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 40(%rcx)
	movq	%r13, 48(%rcx)
	movl	-144(%rbp), %edx        ## 4-byte Reload
	addl	%edx, %eax
	movl	%eax, 8(%rcx)
	movl	-224(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 20(%rcx)
	incq	%r15
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rsi
	addl	-184(%rbp), %r14d       ## 4-byte Folded Reload
	cmpq	-264(%rbp), %r15        ## 8-byte Folded Reload
	jl	LBB6_94
## %bb.96:
	sarq	$32, %rsi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_222
LBB6_97:
	movl	-44(%rbp), %esi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %r8          ## 8-byte Reload
	movq	-120(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	pushq	-152(%rbp)              ## 8-byte Folded Reload
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	pushq	%rbx
	callq	_coo_csr
	addq	$16, %rsp
	movl	-44(%rbp), %r9d
	subq	$8, %rsp
	leaq	-316(%rbp), %rax
	leaq	-320(%rbp), %r10
	leaq	-312(%rbp), %rcx
	leaq	-304(%rbp), %r8
	movq	%r15, %rdi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	%rbx, %rsi
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	pushq	%r14
	pushq	%rax
	pushq	%r10
	callq	_csr_diaii
	addq	$32, %rsp
	movq	%rsp, -336(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %r14d
	movl	%r14d, %eax
	cltd
	idivl	%r15d
                                        ## kill: def $eax killed $eax def $rax
	movq	%rax, -288(%rbp)        ## 8-byte Spill
	leaq	-408(%rbp), %rdi
	callq	_pthread_attr_init
	testl	%eax, %eax
	jne	LBB6_321
## %bb.98:
	leaq	-408(%rbp), %rdi
	leaq	-344(%rbp), %rsi
	callq	_pthread_attr_getscope
	testl	%eax, %eax
	jne	LBB6_322
## %bb.99:
	movl	-344(%rbp), %eax
	cmpl	$1, %eax
	je	LBB6_272
## %bb.100:
	cmpl	$2, %eax
	jne	LBB6_274
## %bb.101:
	leaq	L_str.51(%rip), %rdi
	jmp	LBB6_273
LBB6_102:
	movl	-44(%rbp), %esi
	movl	%r14d, %edi
	movq	%rbx, %rdx
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %r8          ## 8-byte Reload
	movq	-120(%rbp), %r15        ## 8-byte Reload
	movq	%r15, %r9
	pushq	-152(%rbp)              ## 8-byte Folded Reload
	movq	-232(%rbp), %rbx        ## 8-byte Reload
	pushq	%rbx
	callq	_coo_csr
	addq	$16, %rsp
	movl	-44(%rbp), %r9d
	leaq	-304(%rbp), %rax
	leaq	-408(%rbp), %rcx
	leaq	-312(%rbp), %r8
	movq	%r15, %rdi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	%rbx, %rsi
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	pushq	%r14
	pushq	%rax
	callq	_csr_ellii
	addq	$16, %rsp
	movq	%rsp, -280(%rbp)        ## 8-byte Spill
	movq	-184(%rbp), %rax        ## 8-byte Reload
	callq	____chkstk_darwin
	subq	%rax, %rsp
	movq	%rsp, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %ebx
	movl	%ebx, %eax
	cltd
	idivl	%r15d
	movl	%eax, %edx
	testl	%r15d, %r15d
	jle	LBB6_246
## %bb.103:
	movabsq	$-4294967296, %rsi      ## imm = 0xFFFFFFFF00000000
	movl	-304(%rbp), %eax
	movq	-312(%rbp), %rcx
	movq	%rcx, -152(%rbp)        ## 8-byte Spill
	movq	-408(%rbp), %rcx
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	movslq	%r15d, %rcx
	movq	%rcx, -264(%rbp)        ## 8-byte Spill
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	imull	%edx, %eax
	movl	%eax, -184(%rbp)        ## 4-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	movl	%edx, -144(%rbp)        ## 4-byte Spill
	.p2align	4, 0x90
LBB6_104:                               ## =>This Inner Loop Header: Depth=1
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movl	$56, %edi
	callq	_malloc
	movq	%rax, %rcx
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, (%rax,%r15,8)
	testq	%rcx, %rcx
	je	LBB6_306
## %bb.105:                             ##   in Loop: Header=BB6_104 Depth=1
	movl	%r15d, (%rcx)
	movl	-120(%rbp), %esi        ## 4-byte Reload
	movl	%esi, 12(%rcx)
	movl	%ebx, 16(%rcx)
	movl	%r14d, %eax
	cltd
	idivl	%esi
	movl	%eax, 4(%rcx)
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 32(%rcx)
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 24(%rcx)
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 40(%rcx)
	movq	%r13, 48(%rcx)
	movl	-144(%rbp), %edx        ## 4-byte Reload
	addl	%edx, %eax
	movl	%eax, 8(%rcx)
	movl	-224(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 20(%rcx)
	incq	%r15
	movq	-56(%rbp), %rsi         ## 8-byte Reload
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rsi
	addl	-184(%rbp), %r14d       ## 4-byte Folded Reload
	cmpq	-264(%rbp), %r15        ## 8-byte Folded Reload
	jl	LBB6_104
## %bb.106:
	sarq	$32, %rsi
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_247
LBB6_107:
	movq	$-1, %rdi
LBB6_108:
	movl	-68(%rbp), %edx         ## 4-byte Reload
	imull	%edx, %esi
	movl	%r14d, %eax
	subl	%esi, %eax
	movq	(%r15,%rdi,8), %rcx
	addl	%eax, 12(%rcx)
	xorps	%xmm0, %xmm0
	cvtsi2sdl	%r14d, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	xorps	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -120(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	testl	%edx, %edx
	jle	LBB6_323
## %bb.109:
	movslq	%edx, %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_110:                               ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %edi
	movq	(%r15,%rbx,8), %rax
	movq	56(%rax), %rsi
	callq	_zero_arr
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_110
## %bb.111:
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r14
	.p2align	4, 0x90
LBB6_112:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rcx
	movq	%r14, %rdi
	xorl	%esi, %esi
	leaq	_spmv_coo_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.113:                             ##   in Loop: Header=BB6_112 Depth=1
	incq	%rbx
	addq	$8, %r14
	cmpq	-64(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_112
## %bb.114:
	xorl	%r14d, %r14d
	jmp	LBB6_122
LBB6_115:                               ##   in Loop: Header=BB6_122 Depth=1
	movq	%rax, %rdx
	andq	$-4, %rdx
	leaq	-4(%rdx), %rbx
	movq	%rbx, %rdi
	shrq	$2, %rdi
	incq	%rdi
	movl	%edi, %esi
	andl	$1, %esi
	testq	%rbx, %rbx
	je	LBB6_121
## %bb.116:                             ##   in Loop: Header=BB6_122 Depth=1
	movl	$1, %ebx
	subq	%rdi, %rbx
	leaq	-1(%rsi,%rbx), %rbx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB6_117:                               ##   Parent Loop BB6_122 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	32(%r13,%rdi,8), %xmm1
	movupd	48(%r13,%rdi,8), %xmm3
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
	movupd	32(%rcx,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	48(%rcx,%rdi,8), %xmm1
	addpd	%xmm3, %xmm1
	movupd	%xmm0, 32(%r13,%rdi,8)
	movupd	%xmm1, 48(%r13,%rdi,8)
	addq	$8, %rdi
	addq	$2, %rbx
	jne	LBB6_117
## %bb.118:                             ##   in Loop: Header=BB6_122 Depth=1
	testq	%rsi, %rsi
	je	LBB6_120
LBB6_119:                               ##   in Loop: Header=BB6_122 Depth=1
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
LBB6_120:                               ##   in Loop: Header=BB6_122 Depth=1
	cmpq	%rax, %rdx
	jne	LBB6_127
	jmp	LBB6_128
LBB6_121:                               ##   in Loop: Header=BB6_122 Depth=1
	xorl	%edi, %edi
	testq	%rsi, %rsi
	jne	LBB6_119
	jmp	LBB6_120
	.p2align	4, 0x90
LBB6_122:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_117 Depth 2
                                        ##     Child Loop BB6_127 Depth 2
	movq	(%r12,%r14,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	movslq	-44(%rbp), %rax
	testq	%rax, %rax
	jle	LBB6_128
## %bb.123:                             ##   in Loop: Header=BB6_122 Depth=1
	movq	(%r15,%r14,8), %rcx
	movq	56(%rcx), %rcx
	cmpl	$3, %eax
	jbe	LBB6_126
## %bb.124:                             ##   in Loop: Header=BB6_122 Depth=1
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %r13
	jae	LBB6_115
## %bb.125:                             ##   in Loop: Header=BB6_122 Depth=1
	leaq	(%r13,%rax,8), %rdx
	cmpq	%rcx, %rdx
	jbe	LBB6_115
LBB6_126:                               ##   in Loop: Header=BB6_122 Depth=1
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB6_127:                               ##   Parent Loop BB6_122 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	addsd	(%r13,%rdx,8), %xmm0
	movsd	%xmm0, (%r13,%rdx,8)
	incq	%rdx
	cmpq	%rax, %rdx
	jl	LBB6_127
LBB6_128:                               ##   in Loop: Header=BB6_122 Depth=1
	incq	%r14
	cmpq	-96(%rbp), %r14         ## 8-byte Folded Reload
	jne	LBB6_122
## %bb.129:
	xorl	%ebx, %ebx
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_130:                               ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %edi
	movq	(%r15,%rbx,8), %rax
	movq	56(%rax), %rsi
	callq	_zero_arr
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_130
## %bb.131:
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r14
	.p2align	4, 0x90
LBB6_132:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rcx
	movq	%r14, %rdi
	xorl	%esi, %esi
	leaq	_spmv_coo_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.133:                             ##   in Loop: Header=BB6_132 Depth=1
	incq	%rbx
	addq	$8, %r14
	cmpq	-64(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_132
## %bb.134:
	xorl	%r14d, %r14d
	jmp	LBB6_136
LBB6_135:                               ##   in Loop: Header=BB6_136 Depth=1
	xorl	%edi, %edi
	testq	%rsi, %rsi
	jne	LBB6_146
	jmp	LBB6_147
	.p2align	4, 0x90
LBB6_136:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_144 Depth 2
                                        ##     Child Loop BB6_148 Depth 2
	movq	(%r12,%r14,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	movslq	-44(%rbp), %rax
	testq	%rax, %rax
	jle	LBB6_149
## %bb.137:                             ##   in Loop: Header=BB6_136 Depth=1
	movq	(%r15,%r14,8), %rcx
	movq	56(%rcx), %rcx
	cmpl	$4, %eax
	jae	LBB6_139
## %bb.138:                             ##   in Loop: Header=BB6_136 Depth=1
	xorl	%edx, %edx
	jmp	LBB6_148
	.p2align	4, 0x90
LBB6_139:                               ##   in Loop: Header=BB6_136 Depth=1
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %r13
	jae	LBB6_142
## %bb.140:                             ##   in Loop: Header=BB6_136 Depth=1
	leaq	(%r13,%rax,8), %rdx
	cmpq	%rcx, %rdx
	jbe	LBB6_142
## %bb.141:                             ##   in Loop: Header=BB6_136 Depth=1
	xorl	%edx, %edx
	jmp	LBB6_148
LBB6_142:                               ##   in Loop: Header=BB6_136 Depth=1
	movq	%rax, %rdx
	andq	$-4, %rdx
	leaq	-4(%rdx), %rbx
	movq	%rbx, %rdi
	shrq	$2, %rdi
	incq	%rdi
	movl	%edi, %esi
	andl	$1, %esi
	testq	%rbx, %rbx
	je	LBB6_135
## %bb.143:                             ##   in Loop: Header=BB6_136 Depth=1
	movl	$1, %ebx
	subq	%rdi, %rbx
	leaq	-1(%rsi,%rbx), %rbx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB6_144:                               ##   Parent Loop BB6_136 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	32(%r13,%rdi,8), %xmm1
	movupd	48(%r13,%rdi,8), %xmm3
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
	movupd	32(%rcx,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	48(%rcx,%rdi,8), %xmm1
	addpd	%xmm3, %xmm1
	movupd	%xmm0, 32(%r13,%rdi,8)
	movupd	%xmm1, 48(%r13,%rdi,8)
	addq	$8, %rdi
	addq	$2, %rbx
	jne	LBB6_144
## %bb.145:                             ##   in Loop: Header=BB6_136 Depth=1
	testq	%rsi, %rsi
	je	LBB6_147
LBB6_146:                               ##   in Loop: Header=BB6_136 Depth=1
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
LBB6_147:                               ##   in Loop: Header=BB6_136 Depth=1
	cmpq	%rax, %rdx
	je	LBB6_149
	.p2align	4, 0x90
LBB6_148:                               ##   Parent Loop BB6_136 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	addsd	(%r13,%rdx,8), %xmm0
	movsd	%xmm0, (%r13,%rdx,8)
	incq	%rdx
	cmpq	%rax, %rdx
	jl	LBB6_148
LBB6_149:                               ##   in Loop: Header=BB6_136 Depth=1
	incq	%r14
	cmpq	-96(%rbp), %r14         ## 8-byte Folded Reload
	jne	LBB6_136
## %bb.150:
	xorl	%ebx, %ebx
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_151:                               ## =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %edi
	movq	(%r15,%rbx,8), %rax
	movq	56(%rax), %rsi
	callq	_zero_arr
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_151
## %bb.152:
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r14
	.p2align	4, 0x90
LBB6_153:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r15,%rbx,8), %rcx
	movq	%r14, %rdi
	xorl	%esi, %esi
	leaq	_spmv_coo_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.154:                             ##   in Loop: Header=BB6_153 Depth=1
	incq	%rbx
	addq	$8, %r14
	cmpq	-64(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_153
## %bb.155:
	xorl	%ebx, %ebx
	movq	-168(%rbp), %r14        ## 8-byte Reload
	jmp	LBB6_157
LBB6_156:                               ##   in Loop: Header=BB6_157 Depth=1
	xorl	%edi, %edi
	testq	%r8, %r8
	jne	LBB6_167
	jmp	LBB6_168
	.p2align	4, 0x90
LBB6_157:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_165 Depth 2
                                        ##     Child Loop BB6_169 Depth 2
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	movslq	-44(%rbp), %rax
	testq	%rax, %rax
	jle	LBB6_170
## %bb.158:                             ##   in Loop: Header=BB6_157 Depth=1
	movq	(%r15,%rbx,8), %rcx
	movq	56(%rcx), %rcx
	cmpl	$4, %eax
	jae	LBB6_160
## %bb.159:                             ##   in Loop: Header=BB6_157 Depth=1
	xorl	%edx, %edx
	jmp	LBB6_169
	.p2align	4, 0x90
LBB6_160:                               ##   in Loop: Header=BB6_157 Depth=1
	leaq	(%rcx,%rax,8), %rdx
	cmpq	%rdx, %r13
	jae	LBB6_163
## %bb.161:                             ##   in Loop: Header=BB6_157 Depth=1
	leaq	(%r13,%rax,8), %rdx
	cmpq	%rcx, %rdx
	jbe	LBB6_163
## %bb.162:                             ##   in Loop: Header=BB6_157 Depth=1
	xorl	%edx, %edx
	jmp	LBB6_169
LBB6_163:                               ##   in Loop: Header=BB6_157 Depth=1
	movq	%rax, %rdx
	andq	$-4, %rdx
	leaq	-4(%rdx), %rdi
	movq	%rdi, %rsi
	shrq	$2, %rsi
	incq	%rsi
	movl	%esi, %r8d
	andl	$1, %r8d
	testq	%rdi, %rdi
	je	LBB6_156
## %bb.164:                             ##   in Loop: Header=BB6_157 Depth=1
	movl	$1, %edi
	subq	%rsi, %rdi
	leaq	-1(%r8,%rdi), %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB6_165:                               ##   Parent Loop BB6_157 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	32(%r13,%rdi,8), %xmm1
	movupd	48(%r13,%rdi,8), %xmm3
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
	movupd	32(%rcx,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	48(%rcx,%rdi,8), %xmm1
	addpd	%xmm3, %xmm1
	movupd	%xmm0, 32(%r13,%rdi,8)
	movupd	%xmm1, 48(%r13,%rdi,8)
	addq	$8, %rdi
	addq	$2, %rsi
	jne	LBB6_165
## %bb.166:                             ##   in Loop: Header=BB6_157 Depth=1
	testq	%r8, %r8
	je	LBB6_168
LBB6_167:                               ##   in Loop: Header=BB6_157 Depth=1
	movupd	(%rcx,%rdi,8), %xmm0
	movupd	16(%rcx,%rdi,8), %xmm1
	movupd	(%r13,%rdi,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	16(%r13,%rdi,8), %xmm0
	addpd	%xmm1, %xmm0
	movupd	%xmm2, (%r13,%rdi,8)
	movupd	%xmm0, 16(%r13,%rdi,8)
LBB6_168:                               ##   in Loop: Header=BB6_157 Depth=1
	cmpq	%rax, %rdx
	je	LBB6_170
	.p2align	4, 0x90
LBB6_169:                               ##   Parent Loop BB6_157 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	(%rcx,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	addsd	(%r13,%rdx,8), %xmm0
	movsd	%xmm0, (%r13,%rdx,8)
	incq	%rdx
	cmpq	%rax, %rdx
	jl	LBB6_169
LBB6_170:                               ##   in Loop: Header=BB6_157 Depth=1
	incq	%rbx
	cmpq	-96(%rbp), %rbx         ## 8-byte Folded Reload
	jne	LBB6_157
## %bb.171:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
LBB6_172:
	leaq	L_str.61(%rip), %rdi
	callq	_puts
	leaq	L_.str.20(%rip), %rdi
	movl	-68(%rbp), %esi         ## 4-byte Reload
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.21(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	-224(%rbp), %esi        ## 4-byte Reload
	xorl	%eax, %eax
	callq	_printf
	movl	-44(%rbp), %esi
	leaq	L_.str.23(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.24(%rip), %rdi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	_printf
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-144(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-120(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	-56(%rbp), %xmm2        ## 8-byte Folded Reload
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	movapd	%xmm2, -144(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movupd	-248(%rbp), %xmm1
	movddup	%xmm3, %xmm3            ## xmm3 = xmm3[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.25(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.26(%rip), %rdi
	movaps	-144(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	LCPI6_3(%rip), %xmm0
	leaq	L_.str.27(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	callq	_fletcher_sum
	leaq	L_.str.28(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	jmp	LBB6_304
LBB6_173:
	movq	$-1, %rbx
LBB6_174:
	imull	%r15d, %esi
	movl	%edi, %eax
	subl	%esi, %eax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx,%rbx,8), %rcx
	addl	%eax, 12(%rcx)
	cvtsi2sdl	%r14d, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -120(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	testl	%r15d, %r15d
	jle	LBB6_324
## %bb.175:
	movslq	%r15d, %r14
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_176:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	leaq	_spmv_csr_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.177:                             ##   in Loop: Header=BB6_176 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	%r14, %rbx
	jl	LBB6_176
## %bb.178:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r15         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_179:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB6_179
## %bb.180:
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_181:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	leaq	_spmv_csr_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.182:                             ##   in Loop: Header=BB6_181 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	%r14, %rbx
	jl	LBB6_181
## %bb.183:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r15         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_184:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r15
	jne	LBB6_184
## %bb.185:
	callq	_clock
	xorl	%ebx, %ebx
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	leaq	-112(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_186:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	leaq	_spmv_csr_wrapper(%rip), %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.187:                             ##   in Loop: Header=BB6_186 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	%r14, %rbx
	jl	LBB6_186
## %bb.188:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_189:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_189
## %bb.190:
	callq	_clock
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -56(%rbp)        ## 8-byte Spill
	movl	-68(%rbp), %ebx         ## 4-byte Reload
LBB6_191:
	movq	-168(%rbp), %r14        ## 8-byte Reload
	leaq	L_str.58(%rip), %rdi
	callq	_puts
	leaq	L_.str.20(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.21(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	-224(%rbp), %esi        ## 4-byte Reload
	xorl	%eax, %eax
	callq	_printf
	movl	-44(%rbp), %esi
	leaq	L_.str.23(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.24(%rip), %rdi
	movl	%r14d, %esi
	xorl	%eax, %eax
	callq	_printf
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-144(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-120(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	-56(%rbp), %xmm2        ## 8-byte Folded Reload
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	movapd	%xmm2, -144(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movupd	-248(%rbp), %xmm1
	movddup	%xmm3, %xmm3            ## xmm3 = xmm3[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.30(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.31(%rip), %rdi
	movaps	-144(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movsd	-56(%rbp), %xmm0        ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	jmp	LBB6_217
LBB6_192:
	movq	$-1, %rsi
LBB6_193:
	imull	%r15d, %edx
	movl	%ebx, %eax
	subl	%edx, %eax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx,%rsi,8), %rcx
	addl	%eax, 8(%rcx)
	cvtsi2sdl	%r14d, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -208(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -152(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)       ## 8-byte Spill
	testl	%r15d, %r15d
	jle	LBB6_325
## %bb.194:
	movslq	%r15d, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	.p2align	4, 0x90
LBB6_195:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%r15d
	jne	LBB6_195
## %bb.196:
	xorl	%ebx, %ebx
	leaq	_spmv_dia_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_197:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.198:                             ##   in Loop: Header=BB6_197 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_197
## %bb.199:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_200:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_200
## %bb.201:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_202:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_202
## %bb.203:
	xorl	%ebx, %ebx
	leaq	_spmv_dia_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_204:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.205:                             ##   in Loop: Header=BB6_204 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_204
## %bb.206:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_207:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_207
## %bb.208:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_209:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_209
## %bb.210:
	xorl	%ebx, %ebx
	leaq	_spmv_dia_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_211:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.212:                             ##   in Loop: Header=BB6_211 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_211
## %bb.213:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_214:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_214
## %bb.215:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-68(%rbp), %r15d        ## 4-byte Reload
LBB6_216:
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	leaq	L_str.55(%rip), %rdi
	callq	_puts
	leaq	L_.str.20(%rip), %rdi
	movl	%r15d, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.21(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	-224(%rbp), %esi        ## 4-byte Reload
	xorl	%eax, %eax
	callq	_printf
	movl	-44(%rbp), %esi
	leaq	L_.str.23(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.24(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	_printf
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-208(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-152(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	-144(%rbp), %xmm2       ## 8-byte Folded Reload
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	movapd	%xmm2, -208(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movupd	-248(%rbp), %xmm1
	movddup	%xmm3, %xmm3            ## xmm3 = xmm3[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.30(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.34(%rip), %rdi
	movaps	-208(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
LBB6_217:
	divsd	LCPI6_3(%rip), %xmm0
	leaq	L_.str.27(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	callq	_fletcher_sum
	leaq	L_.str.32(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	-288(%rbp), %rsp        ## 8-byte Reload
LBB6_218:
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	je	LBB6_220
LBB6_219:
	callq	_fclose
LBB6_220:
	xorl	%edi, %edi
	callq	_pthread_exit
LBB6_221:
	movq	$-1, %rsi
LBB6_222:
	imull	%r15d, %edx
	movl	%ebx, %eax
	subl	%edx, %eax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx,%rsi,8), %rcx
	addl	%eax, 8(%rcx)
	cvtsi2sdl	%r14d, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -208(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -152(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -120(%rbp)       ## 8-byte Spill
	testl	%r15d, %r15d
	jle	LBB6_326
## %bb.223:
	movslq	%r15d, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	.p2align	4, 0x90
LBB6_224:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%r15d
	jne	LBB6_224
## %bb.225:
	xorl	%ebx, %ebx
	leaq	_spmv_ell_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_226:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.227:                             ##   in Loop: Header=BB6_226 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_226
## %bb.228:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_229:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_229
## %bb.230:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_231:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_231
## %bb.232:
	xorl	%ebx, %ebx
	leaq	_spmv_ell_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_233:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.234:                             ##   in Loop: Header=BB6_233 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_233
## %bb.235:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_236:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_236
## %bb.237:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_238:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_238
## %bb.239:
	xorl	%ebx, %ebx
	leaq	_spmv_ell_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_240:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.241:                             ##   in Loop: Header=BB6_240 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_240
## %bb.242:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_243:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_243
## %bb.244:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -144(%rbp)       ## 8-byte Spill
	movl	-68(%rbp), %r15d        ## 4-byte Reload
LBB6_245:
	movq	-168(%rbp), %rbx        ## 8-byte Reload
	leaq	L_str.52(%rip), %rdi
	callq	_puts
	leaq	L_.str.20(%rip), %rdi
	movl	%r15d, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.21(%rip), %rdi
	movl	$3, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.22(%rip), %rdi
	movl	-224(%rbp), %esi        ## 4-byte Reload
	xorl	%eax, %eax
	callq	_printf
	movl	-44(%rbp), %esi
	leaq	L_.str.23(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.24(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	_printf
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-208(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-152(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	-144(%rbp), %xmm2       ## 8-byte Folded Reload
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm3
	movapd	%xmm2, -208(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movupd	-248(%rbp), %xmm1
	movddup	%xmm3, %xmm3            ## xmm3 = xmm3[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.25(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.31(%rip), %rdi
	movaps	-208(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movsd	-144(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	LCPI6_3(%rip), %xmm0
	leaq	L_.str.27(%rip), %rdi
	movb	$1, %al
	callq	_printf
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	callq	_fletcher_sum
	leaq	L_.str.32(%rip), %rdi
	jmp	LBB6_271
LBB6_246:
	movq	$-1, %rsi
LBB6_247:
	imull	%r15d, %edx
	movl	%ebx, %eax
	subl	%edx, %eax
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx,%rsi,8), %rcx
	addl	%eax, 8(%rcx)
	cvtsi2sdl	%r14d, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -168(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movapd	%xmm0, -224(%rbp)       ## 16-byte Spill
	testl	%r15d, %r15d
	jle	LBB6_327
## %bb.248:
	movslq	%r15d, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	%r15d, %ebx
	.p2align	4, 0x90
LBB6_249:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_249
## %bb.250:
	xorl	%ebx, %ebx
	leaq	_spmv_ellii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_251:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.252:                             ##   in Loop: Header=BB6_251 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_251
## %bb.253:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_254:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_254
## %bb.255:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_256:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_256
## %bb.257:
	xorl	%ebx, %ebx
	leaq	_spmv_ellii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_258:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.259:                             ##   in Loop: Header=BB6_258 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_258
## %bb.260:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_261:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_261
## %bb.262:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_263:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_263
## %bb.264:
	xorl	%ebx, %ebx
	leaq	_spmv_ellii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_265:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.266:                             ##   in Loop: Header=BB6_265 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_265
## %bb.267:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_268:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_268
## %bb.269:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm3       ## 16-byte Reload
	divsd	%xmm1, %xmm3
	movsd	%xmm3, -240(%rbp)
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
LBB6_270:
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-144(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-168(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm4
	movapd	%xmm2, -144(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movsd	-248(%rbp), %xmm1       ## xmm1 = mem[0],zero
	unpcklpd	%xmm3, %xmm1    ## xmm1 = xmm1[0],xmm3[0]
	movddup	%xmm4, %xmm3            ## xmm3 = xmm4[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.46(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.41(%rip), %rdi
	movapd	-144(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	callq	_fletcher_sum
	leaq	L_.str.42(%rip), %rdi
LBB6_271:
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	movq	-280(%rbp), %rsp        ## 8-byte Reload
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	jne	LBB6_219
	jmp	LBB6_220
LBB6_272:
	leaq	L_str.50(%rip), %rdi
LBB6_273:
	callq	_puts
LBB6_274:
	testl	%r15d, %r15d
	jle	LBB6_279
## %bb.275:
	movl	%r14d, -340(%rbp)       ## 4-byte Spill
	movabsq	$-4294967296, %rbx      ## imm = 0xFFFFFFFF00000000
	movl	-320(%rbp), %ecx
	movl	-44(%rbp), %eax
	movl	%eax, -144(%rbp)        ## 4-byte Spill
	movl	-316(%rbp), %eax
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	movq	-304(%rbp), %rax
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	movq	-312(%rbp), %rax
	movq	%rax, -232(%rbp)        ## 8-byte Spill
	movq	-288(%rbp), %rax        ## 8-byte Reload
	leal	-1(%rax), %edx
	movl	%edx, -264(%rbp)        ## 4-byte Spill
	movslq	%r15d, %rdx
	movq	%rdx, -184(%rbp)        ## 8-byte Spill
	movl	%ecx, -56(%rbp)         ## 4-byte Spill
	imull	%eax, %ecx
	movl	%ecx, -280(%rbp)        ## 4-byte Spill
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB6_276:                               ## =>This Inner Loop Header: Depth=1
	movl	$64, %edi
	callq	_malloc
	movq	%rax, %rcx
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	%rcx, (%rax,%r15,8)
	testq	%rcx, %rcx
	je	LBB6_306
## %bb.277:                             ##   in Loop: Header=BB6_276 Depth=1
	movl	%r15d, (%rcx)
	movl	-56(%rbp), %esi         ## 4-byte Reload
	movl	%esi, 12(%rcx)
	movl	-144(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 20(%rcx)
	movl	-120(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 16(%rcx)
	movl	%r14d, %eax
	cltd
	idivl	%esi
	movl	%eax, 4(%rcx)
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 40(%rcx)
	movq	-232(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 32(%rcx)
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, 48(%rcx)
	movq	%r13, 56(%rcx)
	addl	-264(%rbp), %eax        ## 4-byte Folded Reload
	movl	%eax, 8(%rcx)
	movl	-224(%rbp), %eax        ## 4-byte Reload
	movl	%eax, 28(%rcx)
	incq	%r15
	movabsq	$4294967296, %rax       ## imm = 0x100000000
	addq	%rax, %rbx
	addl	-280(%rbp), %r14d       ## 4-byte Folded Reload
	cmpq	-184(%rbp), %r15        ## 8-byte Folded Reload
	jl	LBB6_276
## %bb.278:
	sarq	$32, %rbx
	movl	-68(%rbp), %r15d        ## 4-byte Reload
	movl	-340(%rbp), %r14d       ## 4-byte Reload
	jmp	LBB6_280
LBB6_279:
	movq	$-1, %rbx
LBB6_280:
	movq	-288(%rbp), %rax        ## 8-byte Reload
	imull	%r15d, %eax
	subl	%eax, %r14d
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rax
	addl	%r14d, 8(%rax)
	movq	-168(%rbp), %rax        ## 8-byte Reload
	cvtsi2sdl	%eax, %xmm0
	mulsd	LCPI6_0(%rip), %xmm0
	movl	-224(%rbp), %eax        ## 4-byte Reload
	cvtsi2sdl	%eax, %xmm1
	movapd	%xmm0, -144(%rbp)       ## 16-byte Spill
	movsd	%xmm1, -168(%rbp)       ## 8-byte Spill
	mulsd	%xmm1, %xmm0
	movapd	%xmm0, -224(%rbp)       ## 16-byte Spill
	testl	%r15d, %r15d
	jle	LBB6_328
## %bb.281:
	movslq	%r15d, %rax
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	%r15d, %ebx
	.p2align	4, 0x90
LBB6_282:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_282
## %bb.283:
	xorl	%ebx, %ebx
	leaq	_spmv_diaii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_284:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.285:                             ##   in Loop: Header=BB6_284 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_284
## %bb.286:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_287:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_287
## %bb.288:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_289:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_289
## %bb.290:
	xorl	%ebx, %ebx
	leaq	_spmv_diaii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_291:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.292:                             ##   in Loop: Header=BB6_291 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_291
## %bb.293:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_294:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_294
## %bb.295:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -208(%rbp)       ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-112(%rbp), %r14
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	.p2align	4, 0x90
LBB6_296:                               ## =>This Inner Loop Header: Depth=1
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	decl	%ebx
	jne	LBB6_296
## %bb.297:
	xorl	%ebx, %ebx
	leaq	_spmv_diaii_wrapper(%rip), %r14
	movq	%r12, %r15
	.p2align	4, 0x90
LBB6_298:                               ## =>This Inner Loop Header: Depth=1
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%rbx,8), %rcx
	movq	%r15, %rdi
	xorl	%esi, %esi
	movq	%r14, %rdx
	callq	_pthread_create
	testl	%eax, %eax
	jne	LBB6_305
## %bb.299:                             ##   in Loop: Header=BB6_298 Depth=1
	incq	%rbx
	addq	$8, %r15
	cmpq	-56(%rbp), %rbx         ## 8-byte Folded Reload
	jl	LBB6_298
## %bb.300:
	xorl	%ebx, %ebx
	movq	-96(%rbp), %r14         ## 8-byte Reload
	.p2align	4, 0x90
LBB6_301:                               ## =>This Inner Loop Header: Depth=1
	movq	(%r12,%rbx,8), %rdi
	xorl	%esi, %esi
	callq	_pthread_join
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB6_301
## %bb.302:
	leaq	-88(%rbp), %rsi
	xorl	%edi, %edi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm3       ## 16-byte Reload
	divsd	%xmm1, %xmm3
	movsd	%xmm3, -240(%rbp)
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	addsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
LBB6_303:
	movsd	LCPI6_2(%rip), %xmm0    ## xmm0 = mem[0],zero
	movapd	-144(%rbp), %xmm2       ## 16-byte Reload
	mulsd	%xmm0, %xmm2
	mulsd	-168(%rbp), %xmm2       ## 8-byte Folded Reload
	divsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm1
	movapd	%xmm2, %xmm4
	movapd	%xmm2, -144(%rbp)       ## 16-byte Spill
	subsd	-256(%rbp), %xmm1
	mulsd	%xmm1, %xmm1
	xorpd	%xmm2, %xmm2
	addsd	%xmm1, %xmm2
	movsd	-248(%rbp), %xmm1       ## xmm1 = mem[0],zero
	unpcklpd	%xmm3, %xmm1    ## xmm1 = xmm1[0],xmm3[0]
	movddup	%xmm4, %xmm3            ## xmm3 = xmm4[0,0]
	subpd	%xmm1, %xmm3
	mulpd	%xmm3, %xmm3
	addsd	%xmm3, %xmm2
	unpckhpd	%xmm3, %xmm3    ## xmm3 = xmm3[1,1]
	addsd	%xmm2, %xmm3
	divsd	%xmm0, %xmm3
	xorps	%xmm0, %xmm0
	sqrtsd	%xmm3, %xmm0
	leaq	L_.str.40(%rip), %rdi
	movb	$1, %al
	callq	_printf
	leaq	L_.str.41(%rip), %rdi
	movapd	-144(%rbp), %xmm0       ## 16-byte Reload
	movb	$1, %al
	callq	_printf
	movl	-44(%rbp), %esi
	movq	%r13, %rdi
	callq	_fletcher_sum
	leaq	L_.str.42(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.43(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.44(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.45(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
LBB6_304:
	movq	-336(%rbp), %rsp        ## 8-byte Reload
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	-272(%rbp), %rdi        ## 8-byte Reload
	cmpq	(%rax), %rdi
	jne	LBB6_219
	jmp	LBB6_220
LBB6_305:
	leaq	L_str.62(%rip), %rdi
	callq	_puts
	movl	$1, %edi
	callq	_exit
LBB6_306:
	leaq	L_str.63(%rip), %rdi
	callq	_puts
	movl	$1, %edi
	callq	_exit
LBB6_307:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.14(%rip), %rdi
	movl	$16, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_308:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.15(%rip), %rdi
	movl	$21, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_309:
	movl	$1, %edi
	callq	_exit
LBB6_310:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$40, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_311:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.9(%rip), %rdi
	jmp	LBB6_316
LBB6_312:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	movq	(%r15), %rdx
	leaq	L_.str(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
LBB6_313:
	movq	___stderrp@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$41, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%rbx), %rbx
	leaq	-172(%rbp), %rdi
	callq	_mm_typecode_to_str
	leaq	L_.str.4(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
LBB6_314:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.7(%rip), %rdi
	jmp	LBB6_316
LBB6_315:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.8(%rip), %rdi
LBB6_316:
	movl	$34, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_317:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.10(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_318:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.11(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_319:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.12(%rip), %rdi
	movl	$32, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_320:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.13(%rip), %rdi
	movl	$32, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_321:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.36(%rip), %rdi
	movl	$24, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_322:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.37(%rip), %rdi
	movl	$23, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB6_323:
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	leaq	-112(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	leaq	-88(%rbp), %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	xorl	%edi, %edi
	movq	%r14, %rsi
	movq	-168(%rbp), %r14        ## 8-byte Reload
	callq	_clock_gettime
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	jmp	LBB6_172
LBB6_324:
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	leaq	-112(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	callq	_clock
	leaq	-88(%rbp), %r15
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	callq	_clock
	xorl	%edi, %edi
	movq	%r15, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	callq	_clock
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	callq	_clock
	xorl	%edi, %edi
	movq	%r15, %rsi
	movl	-68(%rbp), %ebx         ## 4-byte Reload
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-208(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -56(%rbp)        ## 8-byte Spill
	jmp	LBB6_191
LBB6_325:
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-88(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -144(%rbp)       ## 8-byte Spill
	jmp	LBB6_216
LBB6_326:
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-88(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movsd	-120(%rbp), %xmm0       ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -144(%rbp)       ## 8-byte Spill
	jmp	LBB6_245
LBB6_327:
	movl	%ebx, %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-88(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movapd	-224(%rbp), %xmm3       ## 16-byte Reload
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm3
	movsd	%xmm3, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	jmp	LBB6_270
LBB6_328:
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	leaq	-88(%rbp), %r14
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -256(%rbp)
	xorpd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	movapd	-224(%rbp), %xmm0       ## 16-byte Reload
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -248(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	movsd	%xmm1, -96(%rbp)        ## 8-byte Spill
	movl	-44(%rbp), %edi
	movq	%r13, %rsi
	callq	_zero_arr
	xorl	%edi, %edi
	movq	%r14, %rsi
	callq	_clock_gettime
	movapd	-224(%rbp), %xmm3       ## 16-byte Reload
	movq	-88(%rbp), %rax
	movq	-80(%rbp), %rcx
	subq	-112(%rbp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	subq	-104(%rbp), %rcx
	xorps	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
	divsd	LCPI6_1(%rip), %xmm1
	addsd	%xmm0, %xmm1
	divsd	%xmm1, %xmm3
	movsd	%xmm3, -240(%rbp)
	addsd	-96(%rbp), %xmm1        ## 8-byte Folded Reload
	jmp	LBB6_303
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L6_0_set_77, LBB6_77-LJTI6_0
.set L6_0_set_82, LBB6_82-LJTI6_0
.set L6_0_set_87, LBB6_87-LJTI6_0
.set L6_0_set_92, LBB6_92-LJTI6_0
.set L6_0_set_97, LBB6_97-LJTI6_0
.set L6_0_set_102, LBB6_102-LJTI6_0
LJTI6_0:
	.long	L6_0_set_77
	.long	L6_0_set_82
	.long	L6_0_set_87
	.long	L6_0_set_92
	.long	L6_0_set_97
	.long	L6_0_set_102
	.end_data_region
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"Usage: %s [martix-market-filename] format_num num_workers\n"

L_.str.1:                               ## @.str.1
	.asciz	"r"

L_.str.2:                               ## @.str.2
	.asciz	"Could not process Matrix Market banner.\n"

L_.str.3:                               ## @.str.3
	.asciz	"Sorry, this application does not support "

L_.str.4:                               ## @.str.4
	.asciz	"Market Market type: [%s]\n"

L_.str.5:                               ## @.str.5
	.asciz	"%d %d %lf\n"

L_.str.6:                               ## @.str.6
	.asciz	"%d %d\n"

L_.str.7:                               ## @.str.7
	.asciz	"couldn't allocate row using malloc"

L_.str.8:                               ## @.str.8
	.asciz	"couldn't allocate col using malloc"

L_.str.9:                               ## @.str.9
	.asciz	"couldn't allocate val using malloc"

L_.str.10:                              ## @.str.10
	.asciz	"couldn't allocate row_ptr using malloc"

L_.str.11:                              ## @.str.11
	.asciz	"couldn't allocate colind using malloc"

L_.str.12:                              ## @.str.12
	.asciz	"couldn't allocate x using malloc"

L_.str.13:                              ## @.str.13
	.asciz	"couldn't allocate y using calloc"

L_.str.14:                              ## @.str.14
	.asciz	"bad value : nan\n"

L_.str.15:                              ## @.str.15
	.asciz	"bad value : infinite\n"

L_.str.16:                              ## @.str.16
	.asciz	"bad value : subnormal\n"

L_.str.20:                              ## @.str.20
	.asciz	"Num_threads %d\n"

L_.str.21:                              ## @.str.21
	.asciz	"Outer %d\n"

L_.str.22:                              ## @.str.22
	.asciz	"Inside %d\n"

L_.str.23:                              ## @.str.23
	.asciz	"N %d\n"

L_.str.24:                              ## @.str.24
	.asciz	"NNZ %d\n"

L_.str.25:                              ## @.str.25
	.asciz	"SD %g\n"

L_.str.26:                              ## @.str.26
	.asciz	"MFLOPS_S %g\n"

L_.str.27:                              ## @.str.27
	.asciz	"Time %g\n"

L_.str.28:                              ## @.str.28
	.asciz	"Fletcher_sum y: %d\n"

L_.str.30:                              ## @.str.30
	.asciz	"SD %f\n"

L_.str.31:                              ## @.str.31
	.asciz	"MFLOPS_s %g\n"

L_.str.32:                              ## @.str.32
	.asciz	"Fletcher_sum %d\n"

L_.str.34:                              ## @.str.34
	.asciz	"MFLOPS_s %g,"

L_.str.36:                              ## @.str.36
	.asciz	"pthread attr init error\n"

L_.str.37:                              ## @.str.37
	.asciz	"pthread attr get scope\n"

L_.str.40:                              ## @.str.40
	.asciz	"%f,"

L_.str.41:                              ## @.str.41
	.asciz	"%g,"

L_.str.42:                              ## @.str.42
	.asciz	"%d\n"

L_.str.43:                              ## @.str.43
	.asciz	"L1 data cache misses is %lld\n"

L_.str.44:                              ## @.str.44
	.asciz	"L2 data cache misses is %lld\n"

L_.str.45:                              ## @.str.45
	.asciz	"L3 data cache misses is %lld\n"

L_.str.46:                              ## @.str.46
	.asciz	"%f\n"

L_str.50:                               ## @str.50
	.asciz	"system scope"

L_str.51:                               ## @str.51
	.asciz	"process scope"

L_str.52:                               ## @str.52
	.asciz	"ell"

L_str.55:                               ## @str.55
	.asciz	"dia"

L_str.58:                               ## @str.58
	.asciz	"csr"

L_str.61:                               ## @str.61
	.asciz	"coo"

L_str.62:                               ## @str.62
	.asciz	"Error in pthreads!"

L_str.63:                               ## @str.63
	.asciz	"struct couldn't be allocated"


.subsections_via_symbols
