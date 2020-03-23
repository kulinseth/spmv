	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_csr               ## -- Begin function spmv_csr
	.p2align	4, 0x90
_spmv_csr:                              ## @spmv_csr
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
	testl	%ecx, %ecx
	jle	LBB0_9
## %bb.1:
	movl	(%rdi), %r14d
	movl	%ecx, %r10d
	xorl	%r11d, %r11d
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_5 Depth 2
                                        ##     Child Loop BB0_7 Depth 2
	movq	%r11, %r15
	movl	%r14d, %ebx
	vmovss	(%r9,%r11,4), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	leaq	1(%r11), %r11
	movl	4(%rdi,%r15,4), %r14d
	cmpl	%r14d, %ebx
	jge	LBB0_8
## %bb.3:                               ##   in Loop: Header=BB0_2 Depth=1
	movslq	%r14d, %r13
	movslq	%ebx, %rax
	movl	%r14d, %ecx
	subl	%ebx, %ecx
	movq	%rax, %r12
	notq	%r12
	addq	%r13, %r12
	andq	$7, %rcx
	je	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_2 Depth=1
	negq	%rcx
	.p2align	4, 0x90
LBB0_5:                                 ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovss	(%rdx,%rax,4), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movslq	(%rsi,%rax,4), %rbx
	vmulss	(%r8,%rbx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$1, %rax
	incq	%rcx
	jne	LBB0_5
LBB0_6:                                 ##   in Loop: Header=BB0_2 Depth=1
	cmpq	$7, %r12
	jb	LBB0_8
	.p2align	4, 0x90
LBB0_7:                                 ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovss	(%rdx,%rax,4), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	movslq	(%rsi,%rax,4), %rcx
	vmovss	4(%rdx,%rax,4), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	movslq	4(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	8(%rdx,%rax,4), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	movslq	8(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	12(%rdx,%rax,4), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movslq	12(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	16(%rdx,%rax,4), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movslq	16(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	20(%rdx,%rax,4), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movslq	20(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	24(%rdx,%rax,4), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movslq	24(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	28(%rdx,%rax,4), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movslq	28(%rsi,%rax,4), %rcx
	vmulss	(%r8,%rcx,4), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	addq	$8, %rax
	cmpq	%r13, %rax
	jl	LBB0_7
LBB0_8:                                 ##   in Loop: Header=BB0_2 Depth=1
	vmovss	%xmm0, (%r9,%r15,4)
	cmpq	%r10, %r11
	jne	LBB0_2
LBB0_9:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_csr4              ## -- Begin function spmv_csr4
	.p2align	4, 0x90
_spmv_csr4:                             ## @spmv_csr4
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

.subsections_via_symbols
