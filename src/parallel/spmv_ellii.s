	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_ellii             ## -- Begin function spmv_ellii
	.p2align	4, 0x90
_spmv_ellii:                            ## @spmv_ellii
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rsi, -48(%rbp)         ## 8-byte Spill
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	testl	%r8d, %r8d
	jle	LBB0_13
## %bb.1:
	cmpl	%ecx, %edx
	jge	LBB0_13
## %bb.2:
	movq	24(%rbp), %rax
	movq	16(%rbp), %r10
	movslq	%r9d, %rsi
	movslq	%edx, %r15
	movslq	%ecx, %rcx
	movl	%r8d, %edx
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	%rcx, %rdx
	subq	%r15, %rdx
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
	movq	%r15, %r14
	notq	%r14
	leaq	1(%r15), %rdx
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	movq	%rcx, %r12
	negq	%r12
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	leaq	8(%rdx), %rbx
	leaq	(,%rsi,8), %r13
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	leaq	(,%rsi,4), %r9
	xorl	%r8d, %r8d
	movq	-56(%rbp), %rdi         ## 8-byte Reload
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_7 Depth 2
	movq	%r15, %rdx
	testb	$1, -80(%rbp)           ## 1-byte Folded Reload
	je	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	movq	%r8, %rsi
	imulq	-72(%rbp), %rsi         ## 8-byte Folded Reload
	addq	%r15, %rsi
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movslq	(%rdx,%rsi,4), %r11
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	testq	%r11, %r11
	js	LBB0_6
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movsd	(%rdx,%rsi,8), %xmm0    ## xmm0 = mem[0],zero
	mulsd	(%r10,%r11,8), %xmm0
	addsd	(%rax,%r15,8), %xmm0
	movsd	%xmm0, (%rax,%r15,8)
	movq	-64(%rbp), %rdx         ## 8-byte Reload
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=1
	cmpq	%r12, %r14
	je	LBB0_12
	.p2align	4, 0x90
LBB0_7:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	(%rdi,%rdx,4), %rsi
	testq	%rsi, %rsi
	js	LBB0_9
## %bb.8:                               ##   in Loop: Header=BB0_7 Depth=2
	movsd	-8(%rbx,%rdx,8), %xmm0  ## xmm0 = mem[0],zero
	mulsd	(%r10,%rsi,8), %xmm0
	addsd	(%rax,%rdx,8), %xmm0
	movsd	%xmm0, (%rax,%rdx,8)
LBB0_9:                                 ##   in Loop: Header=BB0_7 Depth=2
	movslq	4(%rdi,%rdx,4), %rsi
	testq	%rsi, %rsi
	js	LBB0_11
## %bb.10:                              ##   in Loop: Header=BB0_7 Depth=2
	movsd	(%rbx,%rdx,8), %xmm0    ## xmm0 = mem[0],zero
	mulsd	(%r10,%rsi,8), %xmm0
	addsd	8(%rax,%rdx,8), %xmm0
	movsd	%xmm0, 8(%rax,%rdx,8)
LBB0_11:                                ##   in Loop: Header=BB0_7 Depth=2
	addq	$2, %rdx
	cmpq	%rdx, %rcx
	jne	LBB0_7
LBB0_12:                                ##   in Loop: Header=BB0_3 Depth=1
	incq	%r8
	addq	%r13, %rbx
	addq	%r9, %rdi
	cmpq	-88(%rbp), %r8          ## 8-byte Folded Reload
	jne	LBB0_3
LBB0_13:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
