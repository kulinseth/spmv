	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_spmv_diaii             ## -- Begin function spmv_diaii
	.p2align	4, 0x90
_spmv_diaii:                            ## @spmv_diaii
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
	movq	%rsi, -104(%rbp)        ## 8-byte Spill
	testl	%r8d, %r8d
	jle	LBB0_14
## %bb.1:
	movq	32(%rbp), %r14
	movq	24(%rbp), %r10
	movl	16(%rbp), %eax
	movl	%r9d, %r11d
	subl	%eax, %r11d
	decl	%r9d
	movslq	%eax, %rbx
	movl	%r8d, %r8d
	leaq	8(%r14), %rax
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	movq	-104(%rbp), %rax        ## 8-byte Reload
	leaq	8(%rax), %rsi
	movq	%rsi, -144(%rbp)        ## 8-byte Spill
	leaq	8(%r10), %rsi
	movq	%rsi, -136(%rbp)        ## 8-byte Spill
	leaq	16(%rax), %rsi
	movq	%rbx, -160(%rbp)        ## 8-byte Spill
	leaq	(,%rbx,8), %rbx
	movq	%rbx, -168(%rbp)        ## 8-byte Spill
	leaq	16(%r10), %rbx
	movq	%rbx, -128(%rbp)        ## 8-byte Spill
	movq	%rsi, %r10
	leaq	16(%r14), %rsi
	movq	%rsi, -120(%rbp)        ## 8-byte Spill
	xorl	%r15d, %r15d
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movl	%ecx, -52(%rbp)         ## 4-byte Spill
	movl	%edx, -48(%rbp)         ## 4-byte Spill
	movq	%rdi, -88(%rbp)         ## 8-byte Spill
	movl	%r11d, -44(%rbp)        ## 4-byte Spill
	movq	%r8, -72(%rbp)          ## 8-byte Spill
	.p2align	4, 0x90
LBB0_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_9 Depth 2
                                        ##     Child Loop BB0_12 Depth 2
	movslq	(%rdi,%r15,4), %r13
	movl	%r13d, %ebx
	negl	%ebx
	movl	%r9d, %esi
	subl	%r13d, %esi
	movl	%r13d, %eax
	sarl	$31, %eax
	andl	%ebx, %eax
	cmpl	%edx, %eax
	cmovll	%edx, %eax
	cmpl	%esi, %r9d
	cmovlel	%r9d, %esi
	cmpl	%ecx, %esi
	cmovgl	%ecx, %esi
	cmpl	%esi, %eax
	jg	LBB0_13
## %bb.3:                               ##   in Loop: Header=BB0_2 Depth=1
	movq	%r10, -64(%rbp)         ## 8-byte Spill
	movl	%r13d, %ebx
	sarl	$31, %ebx
	andl	%r11d, %ebx
	movslq	%eax, %r10
	movslq	%esi, %r12
	cmpq	%r12, %r10
	movq	%r12, %r8
	cmovgeq	%r10, %r8
	movslq	%ebx, %rsi
	incq	%r8
	subq	%r10, %r8
	cmpq	$4, %r8
	jae	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_2 Depth=1
	movq	%r13, %rbx
	movq	%r10, %r13
	movq	-72(%rbp), %r8          ## 8-byte Reload
	movq	-64(%rbp), %r10         ## 8-byte Reload
	jmp	LBB0_11
	.p2align	4, 0x90
LBB0_5:                                 ##   in Loop: Header=BB0_2 Depth=1
	movq	%r15, %rcx
	imulq	-160(%rbp), %rcx        ## 8-byte Folded Reload
	leaq	(%r14,%r10,8), %rdi
	cmpq	%r12, %r10
	movq	%r12, %rdx
	cmovgeq	%r10, %rdx
	movq	-152(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdx,8), %r11
	leaq	(%rcx,%r10), %rbx
	subq	%rsi, %rbx
	addq	%rdx, %rcx
	movq	%rsi, -80(%rbp)         ## 8-byte Spill
	subq	%rsi, %rcx
	movq	-144(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rcx,8), %rcx
	addq	%r13, %rdx
	cmpq	%rcx, %rdi
	movq	-104(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rbx,8), %rcx
	movq	-136(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdx,8), %rdx
	movq	%r13, %rax
	setb	%r13b
	cmpq	%r11, %rcx
	setb	%bl
	cmpq	%rdx, %rdi
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	leaq	(%rax,%r10), %rax
	movq	24(%rbp), %rcx
	leaq	(%rcx,%rax,8), %rdx
	setb	%cl
	cmpq	%r11, %rdx
	setb	%dl
	testb	%bl, %r13b
	jne	LBB0_6
## %bb.7:                               ##   in Loop: Header=BB0_2 Depth=1
	andb	%dl, %cl
	jne	LBB0_6
## %bb.8:                               ##   in Loop: Header=BB0_2 Depth=1
	movq	%r8, %r11
	andq	$-4, %r11
	leaq	(%r11,%r10), %r13
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	leaq	(%rcx,%r10,8), %rcx
	subq	-80(%rbp), %r10         ## 8-byte Folded Reload
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	leaq	(%rdx,%r10,8), %rdi
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	leaq	(%rdx,%rax,8), %rdx
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB0_9:                                 ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movupd	-16(%rdi,%r10,8), %xmm0
	movupd	(%rdi,%r10,8), %xmm1
	movupd	-16(%rdx,%r10,8), %xmm2
	mulpd	%xmm0, %xmm2
	movupd	(%rdx,%r10,8), %xmm0
	mulpd	%xmm1, %xmm0
	movupd	-16(%rcx,%r10,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	(%rcx,%r10,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	%xmm1, -16(%rcx,%r10,8)
	movupd	%xmm2, (%rcx,%r10,8)
	addq	$4, %r10
	cmpq	%r10, %r11
	jne	LBB0_9
## %bb.10:                              ##   in Loop: Header=BB0_2 Depth=1
	cmpq	%r11, %r8
	movl	-52(%rbp), %ecx         ## 4-byte Reload
	movl	-48(%rbp), %edx         ## 4-byte Reload
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movl	-44(%rbp), %r11d        ## 4-byte Reload
	movq	-72(%rbp), %r8          ## 8-byte Reload
	movq	-64(%rbp), %r10         ## 8-byte Reload
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	movq	-80(%rbp), %rsi         ## 8-byte Reload
	jne	LBB0_11
	jmp	LBB0_13
LBB0_6:                                 ##   in Loop: Header=BB0_2 Depth=1
	movq	%r10, %r13
	movl	-52(%rbp), %ecx         ## 4-byte Reload
	movl	-48(%rbp), %edx         ## 4-byte Reload
	movq	-88(%rbp), %rdi         ## 8-byte Reload
	movl	-44(%rbp), %r11d        ## 4-byte Reload
	movq	-72(%rbp), %r8          ## 8-byte Reload
	movq	-64(%rbp), %r10         ## 8-byte Reload
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	movq	-80(%rbp), %rsi         ## 8-byte Reload
LBB0_11:                                ##   in Loop: Header=BB0_2 Depth=1
	decq	%r13
	shlq	$3, %rsi
	movq	%rsi, %rax
	movq	-112(%rbp), %rsi        ## 8-byte Reload
	subq	%rax, %rsi
	movq	24(%rbp), %rax
	leaq	(%rax,%rbx,8), %rax
	.p2align	4, 0x90
LBB0_12:                                ##   Parent Loop BB0_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	8(%rsi,%r13,8), %xmm0   ## xmm0 = mem[0],zero
	mulsd	8(%rax,%r13,8), %xmm0
	addsd	8(%r14,%r13,8), %xmm0
	movsd	%xmm0, 8(%r14,%r13,8)
	incq	%r13
	cmpq	%r12, %r13
	jl	LBB0_12
LBB0_13:                                ##   in Loop: Header=BB0_2 Depth=1
	incq	%r15
	movq	-168(%rbp), %rax        ## 8-byte Reload
	addq	%rax, %r10
	addq	%rax, -112(%rbp)        ## 8-byte Folded Spill
	cmpq	%r8, %r15
	jne	LBB0_2
LBB0_14:
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
