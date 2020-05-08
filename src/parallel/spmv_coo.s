	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_coo               ## -- Begin function spmv_coo
	.p2align	4, 0x90
_spmv_coo:                              ## @spmv_coo
	.cfi_startproc
## %bb.0:
	testl	%ecx, %ecx
	jle	LBB0_7
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	16(%rbp), %r11
	movl	%ecx, %r10d
	movl	%r10d, %r8d
	andl	$1, %r8d
	cmpl	$1, %ecx
	popq	%rbp
	jne	LBB0_3
## %bb.2:
	xorl	%ecx, %ecx
	testq	%r8, %r8
	jne	LBB0_6
	jmp	LBB0_7
LBB0_3:
	subq	%r8, %r10
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	movsd	(%rdx,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movslq	(%rsi,%rcx,4), %rax
	mulsd	(%r9,%rax,8), %xmm0
	movslq	(%rdi,%rcx,4), %rax
	addsd	(%r11,%rax,8), %xmm0
	movsd	%xmm0, (%r11,%rax,8)
	movsd	8(%rdx,%rcx,8), %xmm0   ## xmm0 = mem[0],zero
	movslq	4(%rsi,%rcx,4), %rax
	mulsd	(%r9,%rax,8), %xmm0
	movslq	4(%rdi,%rcx,4), %rax
	addsd	(%r11,%rax,8), %xmm0
	movsd	%xmm0, (%r11,%rax,8)
	addq	$2, %rcx
	cmpq	%rcx, %r10
	jne	LBB0_4
## %bb.5:
	testq	%r8, %r8
	je	LBB0_7
LBB0_6:
	movsd	(%rdx,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	movslq	(%rsi,%rcx,4), %rax
	mulsd	(%r9,%rax,8), %xmm0
	movslq	(%rdi,%rcx,4), %rax
	addsd	(%r11,%rax,8), %xmm0
	movsd	%xmm0, (%r11,%rax,8)
LBB0_7:
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
