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
	movq	%rsi, -56(%rbp)         ## 8-byte Spill
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	testl	%ecx, %ecx
	jle	LBB0_11
## %bb.1:
	testl	%edx, %edx
	jle	LBB0_11
## %bb.2:
	movslq	%edx, %rsi
	movl	%edx, %r12d
	movl	%ecx, %eax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	movl	%r12d, %edx
	andl	$3, %edx
	movq	-48(%rbp), %rax         ## 8-byte Reload
	leaq	12(%rax), %rax
	movq	%rsi, -96(%rbp)         ## 8-byte Spill
	leaq	(,%rsi,4), %rcx
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	leaq	12(%rcx), %rcx
	leaq	-1(%r12), %rsi
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	subq	%rdx, %r12
	movq	%rdx, -80(%rbp)         ## 8-byte Spill
	leaq	(,%rdx,4), %rbx
	xorl	%r13d, %r13d
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_6 Depth 2
                                        ##     Child Loop BB0_9 Depth 2
	cmpq	$3, -64(%rbp)           ## 8-byte Folded Reload
	jae	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	xorl	%esi, %esi
	cmpq	$0, -80(%rbp)           ## 8-byte Folded Reload
	jne	LBB0_8
	jmp	LBB0_10
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=1
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB0_6:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovss	-12(%rcx,%rsi,4), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	movslq	-12(%rax,%rsi,4), %rdi
	vmulss	(%r8,%rdi,4), %xmm0, %xmm0
	vaddss	(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r9,%rsi,4)
	vmovss	-8(%rcx,%rsi,4), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movslq	-8(%rax,%rsi,4), %rdi
	vmulss	(%r8,%rdi,4), %xmm0, %xmm0
	vaddss	4(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	%xmm0, 4(%r9,%rsi,4)
	vmovss	-4(%rcx,%rsi,4), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	movslq	-4(%rax,%rsi,4), %rdi
	vmulss	(%r8,%rdi,4), %xmm0, %xmm0
	vaddss	8(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	%xmm0, 8(%r9,%rsi,4)
	vmovss	(%rcx,%rsi,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	movslq	(%rax,%rsi,4), %rdi
	vmulss	(%r8,%rdi,4), %xmm0, %xmm0
	vaddss	12(%r9,%rsi,4), %xmm0, %xmm0
	vmovss	%xmm0, 12(%r9,%rsi,4)
	addq	$4, %rsi
	cmpq	%rsi, %r12
	jne	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_3 Depth=1
	cmpq	$0, -80(%rbp)           ## 8-byte Folded Reload
	je	LBB0_10
LBB0_8:                                 ##   in Loop: Header=BB0_3 Depth=1
	leaq	(%r9,%rsi,4), %rdi
	addq	%r13, %rsi
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%rsi,4), %r11
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%rsi,4), %rsi
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB0_9:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovss	(%rsi,%r15), %xmm0      ## xmm0 = mem[0],zero,zero,zero
	movslq	(%r11,%r15), %r14
	vmulss	(%r8,%r14,4), %xmm0, %xmm0
	vaddss	(%rdi,%r15), %xmm0, %xmm0
	vmovss	%xmm0, (%rdi,%r15)
	addq	$4, %r15
	cmpq	%r15, %rbx
	jne	LBB0_9
LBB0_10:                                ##   in Loop: Header=BB0_3 Depth=1
	addq	$1, %r10
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	addq	%rdx, %rax
	addq	%rdx, %rcx
	addq	-96(%rbp), %r13         ## 8-byte Folded Reload
	cmpq	-88(%rbp), %r10         ## 8-byte Folded Reload
	jne	LBB0_3
LBB0_11:
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
