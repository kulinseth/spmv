	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_ell               ## -- Begin function spmv_ell
	.p2align	4, 0x90
_spmv_ell:                              ## @spmv_ell
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
	cmpl	%ecx, %edx
	jge	LBB0_7
## %bb.1:
	testl	%r8d, %r8d
	jle	LBB0_7
## %bb.2:
	movq	24(%rbp), %r10
	movq	16(%rbp), %r9
	movslq	%r8d, %rax
	movslq	%edx, %rdx
	movslq	%ecx, %r8
	movq	%rax, %rcx
	imulq	%rdx, %rcx
	leaq	(%rsi,%rcx,8), %rsi
	leaq	(,%rax,8), %r11
	leaq	(%rdi,%rcx,4), %rdi
	leaq	(,%rax,4), %r14
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	(%rdi,%rbx,4), %rcx
	testq	%rcx, %rcx
	js	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=2
	movsd	(%rsi,%rbx,8), %xmm0    ## xmm0 = mem[0],zero
	mulsd	(%r9,%rcx,8), %xmm0
	addsd	(%r10,%rdx,8), %xmm0
	movsd	%xmm0, (%r10,%rdx,8)
	incq	%rbx
	cmpq	%rax, %rbx
	jl	LBB0_4
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	incq	%rdx
	addq	%r11, %rsi
	addq	%r14, %rdi
	cmpq	%r8, %rdx
	jne	LBB0_3
LBB0_7:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
