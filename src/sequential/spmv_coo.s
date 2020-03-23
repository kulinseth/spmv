	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_coo               ## -- Begin function spmv_coo
	.p2align	4, 0x90
_spmv_coo:                              ## @spmv_coo
	.cfi_startproc
## %bb.0:
	testl	%ecx, %ecx
	jle	LBB0_8
## %bb.1:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	16(%rbp), %r11
	movl	%ecx, %r10d
	leaq	-1(%r10), %rcx
	movl	%r10d, %r8d
	andl	$3, %r8d
	cmpq	$3, %rcx
	popq	%rbp
	jae	LBB0_3
## %bb.2:
	xorl	%ecx, %ecx
	testq	%r8, %r8
	jne	LBB0_6
	jmp	LBB0_8
LBB0_3:
	subq	%r8, %r10
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	vmovss	(%rdx,%rcx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	(%rsi,%rcx,4), %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	movslq	(%rdi,%rcx,4), %rax
	vaddss	(%r11,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	vmovss	4(%rdx,%rcx,4), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movslq	4(%rsi,%rcx,4), %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	movslq	4(%rdi,%rcx,4), %rax
	vaddss	(%r11,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	vmovss	8(%rdx,%rcx,4), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	movslq	8(%rsi,%rcx,4), %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	movslq	8(%rdi,%rcx,4), %rax
	vaddss	(%r11,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	vmovss	12(%rdx,%rcx,4), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movslq	12(%rsi,%rcx,4), %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	movslq	12(%rdi,%rcx,4), %rax
	vaddss	(%r11,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	addq	$4, %rcx
	cmpq	%rcx, %r10
	jne	LBB0_4
## %bb.5:
	testq	%r8, %r8
	je	LBB0_8
LBB0_6:
	leaq	(%rdi,%rcx,4), %rdi
	leaq	(%rsi,%rcx,4), %rsi
	leaq	(%rdx,%rcx,4), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB0_7:                                 ## =>This Inner Loop Header: Depth=1
	vmovss	(%rcx,%rdx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	(%rsi,%rdx,4), %rax
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	movslq	(%rdi,%rdx,4), %rax
	vaddss	(%r11,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r11,%rax,4)
	addq	$1, %rdx
	cmpq	%rdx, %r8
	jne	LBB0_7
LBB0_8:
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
