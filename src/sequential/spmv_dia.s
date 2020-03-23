	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_dia               ## -- Begin function spmv_dia
	.p2align	4, 0x90
_spmv_dia:                              ## @spmv_dia
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
	movq	%r9, -88(%rbp)          ## 8-byte Spill
	movq	%rsi, -104(%rbp)        ## 8-byte Spill
	testl	%ecx, %ecx
	jle	LBB0_14
## %bb.1:
	movl	%edx, %r11d
	movq	16(%rbp), %rax
	subl	%r8d, %edx
	movl	%edx, -92(%rbp)         ## 4-byte Spill
	addl	$-1, %r11d
	movslq	%r8d, %rdx
	movl	%ecx, %r9d
	leaq	4(%rax), %rcx
	movq	%rcx, -144(%rbp)        ## 8-byte Spill
	movq	-104(%rbp), %rsi        ## 8-byte Reload
	leaq	4(%rsi), %rcx
	movq	%rcx, -136(%rbp)        ## 8-byte Spill
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	leaq	4(%rcx), %rbx
	movq	%rbx, -128(%rbp)        ## 8-byte Spill
	leaq	192(%rsi), %r8
	movq	%rdx, -152(%rbp)        ## 8-byte Spill
	leaq	(,%rdx,4), %r12
	leaq	192(%rcx), %rcx
	movq	%rcx, -120(%rbp)        ## 8-byte Spill
	leaq	192(%rax), %rcx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	xorl	%r13d, %r13d
	movl	%r11d, -44(%rbp)        ## 4-byte Spill
	movq	%rdi, -80(%rbp)         ## 8-byte Spill
	movq	%r9, -64(%rbp)          ## 8-byte Spill
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_9 Depth 2
                                        ##     Child Loop BB0_12 Depth 2
	movslq	(%rdi,%r13,4), %r14
	movl	%r14d, %ebx
	negl	%ebx
	movl	%r11d, %ecx
	subl	%r14d, %ecx
	movl	%r14d, %edx
	sarl	$31, %edx
	andl	%ebx, %edx
	cmpl	%ecx, %r11d
	cmovlel	%r11d, %ecx
	cmpl	%ecx, %edx
	jg	LBB0_13
## %bb.3:                               ##   in Loop: Header=BB0_2 Depth=1
	movl	%r14d, %ebx
	sarl	$31, %ebx
	andl	-92(%rbp), %ebx         ## 4-byte Folded Reload
	movslq	%ebx, %rbx
	movslq	%edx, %r12
	movslq	%ecx, %r15
	cmpq	%r15, %r12
	movq	%r15, %r9
	cmovgeq	%r12, %r9
	addq	$1, %r9
	subq	%r12, %r9
	cmpq	$64, %r9
	jae	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_2 Depth=1
	movq	%r12, %r10
	movq	-64(%rbp), %r9          ## 8-byte Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	jmp	LBB0_11
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_2 Depth=1
	movq	%r13, %rcx
	imulq	-152(%rbp), %rcx        ## 8-byte Folded Reload
	leaq	(%rax,%r12,4), %r10
	cmpq	%r15, %r12
	movq	%r15, %rdi
	cmovgeq	%r12, %rdi
	movq	-144(%rbp), %rdx        ## 8-byte Reload
	leaq	(%rdx,%rdi,4), %r11
	leaq	(%rcx,%r12), %rdx
	subq	%rbx, %rdx
	addq	%rdi, %rcx
	movq	%rbx, -72(%rbp)         ## 8-byte Spill
	subq	%rbx, %rcx
	movq	-136(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%rcx,4), %rcx
	addq	%r14, %rdi
	cmpq	%rcx, %r10
	movq	-104(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%rdx,4), %rcx
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	leaq	(%rdx,%rdi,4), %rdx
	setb	%dil
	cmpq	%r11, %rcx
	setb	%bl
	cmpq	%rdx, %r10
	leaq	(%r14,%r12), %rdx
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	leaq	(%rcx,%rdx,4), %rdx
	setb	%cl
	cmpq	%r11, %rdx
	setb	%r10b
	testb	%bl, %dil
	jne	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_2 Depth=1
	andb	%r10b, %cl
	jne	LBB0_6
## %bb.8:                               ##   in Loop: Header=BB0_2 Depth=1
	movq	%r9, %r11
	andq	$-64, %r11
	leaq	(%r11,%r12), %r10
	movq	-112(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%r12,4), %rdi
	subq	-72(%rbp), %r12         ## 8-byte Folded Reload
	leaq	(%r8,%r12,4), %rcx
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	movq	-160(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rdx,%rbx,4), %rbx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB0_9:                                 ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovups	-192(%rcx,%rdx,4), %zmm0
	vmovups	-128(%rcx,%rdx,4), %zmm1
	vmovups	-64(%rcx,%rdx,4), %zmm2
	vmovups	(%rcx,%rdx,4), %zmm3
	vmulps	-192(%rbx,%rdx,4), %zmm0, %zmm0
	vmulps	-128(%rbx,%rdx,4), %zmm1, %zmm1
	vmulps	-64(%rbx,%rdx,4), %zmm2, %zmm2
	vmulps	(%rbx,%rdx,4), %zmm3, %zmm3
	vaddps	-192(%rdi,%rdx,4), %zmm0, %zmm0
	vaddps	-128(%rdi,%rdx,4), %zmm1, %zmm1
	vaddps	-64(%rdi,%rdx,4), %zmm2, %zmm2
	vaddps	(%rdi,%rdx,4), %zmm3, %zmm3
	vmovups	%zmm0, -192(%rdi,%rdx,4)
	vmovups	%zmm1, -128(%rdi,%rdx,4)
	vmovups	%zmm2, -64(%rdi,%rdx,4)
	vmovups	%zmm3, (%rdi,%rdx,4)
	addq	$64, %rdx
	cmpq	%rdx, %r11
	jne	LBB0_9
## %bb.10:                              ##   in Loop: Header=BB0_2 Depth=1
	cmpq	%r11, %r9
	movl	-44(%rbp), %r11d        ## 4-byte Reload
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movq	-64(%rbp), %r9          ## 8-byte Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	jne	LBB0_11
	jmp	LBB0_13
LBB0_6:                                 ##   in Loop: Header=BB0_2 Depth=1
	movq	%r12, %r10
	movl	-44(%rbp), %r11d        ## 4-byte Reload
	movq	-80(%rbp), %rdi         ## 8-byte Reload
	movq	-64(%rbp), %r9          ## 8-byte Reload
	movq	-56(%rbp), %r12         ## 8-byte Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
LBB0_11:                                ##   in Loop: Header=BB0_2 Depth=1
	addq	$-1, %r10
	shlq	$2, %rbx
	movq	%rsi, %rcx
	subq	%rbx, %rcx
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%r14,4), %rdx
	.p2align	4, 0x90
LBB0_12:                                ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovss	4(%rcx,%r10,4), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmulss	4(%rdx,%r10,4), %xmm0, %xmm0
	vaddss	4(%rax,%r10,4), %xmm0, %xmm0
	vmovss	%xmm0, 4(%rax,%r10,4)
	addq	$1, %r10
	cmpq	%r15, %r10
	jl	LBB0_12
LBB0_13:                                ##   in Loop: Header=BB0_2 Depth=1
	addq	$1, %r13
	addq	%r12, %r8
	addq	%r12, %rsi
	cmpq	%r9, %r13
	jne	LBB0_2
LBB0_14:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
