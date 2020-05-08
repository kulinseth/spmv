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
	pushq	%rbx
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	cmpl	%ecx, %edx
	jge	LBB0_9
## %bb.1:
	testl	%r8d, %r8d
	jle	LBB0_9
## %bb.2:
	movq	32(%rbp), %r14
	movq	24(%rbp), %r10
	movslq	%r8d, %r11
	movslq	%edx, %rdx
	movl	%r8d, %eax
	movslq	%ecx, %r8
	movq	%r11, %rcx
	imulq	%rdx, %rcx
	leaq	(%rsi,%rcx,8), %r15
	shlq	$3, %r11
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_4 Depth 2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB0_4:                                 ##   Parent Loop BB0_3 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movslq	(%rdi,%rcx,4), %rsi
	movslq	%edx, %rbx
	addq	%rsi, %rbx
	testl	%ebx, %ebx
	js	LBB0_7
## %bb.5:                               ##   in Loop: Header=BB0_4 Depth=2
	cmpl	%r9d, %ebx
	jge	LBB0_7
## %bb.6:                               ##   in Loop: Header=BB0_4 Depth=2
	movsd	(%r15,%rcx,8), %xmm0    ## xmm0 = mem[0],zero
	mulsd	(%r10,%rbx,8), %xmm0
	addsd	(%r14,%rdx,8), %xmm0
	movsd	%xmm0, (%r14,%rdx,8)
LBB0_7:                                 ##   in Loop: Header=BB0_4 Depth=2
	incq	%rcx
	cmpq	%rcx, %rax
	jne	LBB0_4
## %bb.8:                               ##   in Loop: Header=BB0_3 Depth=1
	incq	%rdx
	addq	%r11, %r15
	cmpq	%r8, %rdx
	jne	LBB0_3
LBB0_9:
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_spmv_custom            ## -- Begin function spmv_custom
	.p2align	4, 0x90
_spmv_custom:                           ## @spmv_custom
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
	movq	%r9, -72(%rbp)          ## 8-byte Spill
	testl	%ecx, %ecx
	jle	LBB1_15
## %bb.1:
	movq	16(%rbp), %r15
	decl	%edx
	movl	%ecx, %r11d
	leaq	8(%r15), %rax
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	leaq	8(%rsi), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	8(%rax), %rcx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	leaq	16(%rsi), %rcx
	movq	%rcx, -104(%rbp)        ## 8-byte Spill
	leaq	16(%rax), %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	leaq	16(%r15), %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	xorl	%r9d, %r9d
	xorl	%r13d, %r13d
	xorl	%r12d, %r12d
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movq	%r11, -56(%rbp)         ## 8-byte Spill
	movl	%edx, -44(%rbp)         ## 4-byte Spill
	.p2align	4, 0x90
LBB1_2:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_8 Depth 2
                                        ##     Child Loop BB1_13 Depth 2
	movslq	(%rdi,%r13,4), %rbx
	movl	%edx, %eax
	subl	%ebx, %eax
	movl	%ebx, %ecx
	negl	%ecx
	cmovsl	%r9d, %ecx
	cmpl	%eax, %edx
	cmovlel	%edx, %eax
	cmpl	%eax, %ecx
	jg	LBB1_14
## %bb.3:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	%rbx, -80(%rbp)         ## 8-byte Spill
	movl	%ecx, %r10d
	movslq	%eax, %r14
	cmpq	%r10, %r14
	movq	%r10, %r9
	cmovgeq	%r14, %r9
	movslq	%r12d, %rcx
	incq	%r9
	subq	%r10, %r9
	cmpq	$4, %r9
	jae	LBB1_5
## %bb.4:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	%r10, %r8
	movq	%rcx, %r12
	jmp	LBB1_11
	.p2align	4, 0x90
LBB1_5:                                 ##   in Loop: Header=BB1_2 Depth=1
	leaq	(%r15,%r10,8), %r8
	cmpq	%r10, %r14
	movq	%r10, %rdi
	cmovgeq	%r14, %rdi
	movq	-128(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdi,8), %rdx
	leaq	(%rdi,%rcx), %rbx
	subq	%r10, %rbx
	movq	-120(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rbx,8), %r11
	movq	-80(%rbp), %rbx         ## 8-byte Reload
	addq	%rbx, %rdi
	cmpq	%r11, %r8
	leaq	(%rsi,%rcx,8), %r12
	movq	-112(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdi,8), %rdi
	setb	%r11b
	cmpq	%rdx, %r12
	setb	%r12b
	cmpq	%rdi, %r8
	leaq	(%rbx,%r10), %rax
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	leaq	(%rdi,%rax,8), %rdi
	setb	%bl
	cmpq	%rdx, %rdi
	setb	%dl
	testb	%r12b, %r11b
	jne	LBB1_10
## %bb.6:                               ##   in Loop: Header=BB1_2 Depth=1
	andb	%dl, %bl
	jne	LBB1_10
## %bb.7:                               ##   in Loop: Header=BB1_2 Depth=1
	movq	%r9, %r11
	andq	$-4, %r11
	movq	%rax, %rdx
	leaq	(%r11,%r10), %r8
	leaq	(%r11,%rcx), %r12
	movq	-104(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rcx,8), %rcx
	movq	-96(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%rdx,8), %rdi
	movq	-88(%rbp), %rax         ## 8-byte Reload
	leaq	(%rax,%r10,8), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB1_8:                                 ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movupd	-16(%rcx,%rax,8), %xmm0
	movupd	(%rcx,%rax,8), %xmm1
	movupd	-16(%rdi,%rax,8), %xmm2
	mulpd	%xmm0, %xmm2
	movupd	(%rdi,%rax,8), %xmm0
	mulpd	%xmm1, %xmm0
	movupd	-16(%rbx,%rax,8), %xmm1
	addpd	%xmm2, %xmm1
	movupd	(%rbx,%rax,8), %xmm2
	addpd	%xmm0, %xmm2
	movupd	%xmm1, -16(%rbx,%rax,8)
	movupd	%xmm2, (%rbx,%rax,8)
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	LBB1_8
## %bb.9:                               ##   in Loop: Header=BB1_2 Depth=1
	cmpq	%r11, %r9
	movl	-44(%rbp), %edx         ## 4-byte Reload
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movq	-56(%rbp), %r11         ## 8-byte Reload
	movl	$0, %r9d
	jne	LBB1_12
	jmp	LBB1_14
LBB1_10:                                ##   in Loop: Header=BB1_2 Depth=1
	movq	%r10, %r8
	movq	%rcx, %r12
	movl	-44(%rbp), %edx         ## 4-byte Reload
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	movq	-56(%rbp), %r11         ## 8-byte Reload
LBB1_11:                                ##   in Loop: Header=BB1_2 Depth=1
	xorl	%r9d, %r9d
LBB1_12:                                ##   in Loop: Header=BB1_2 Depth=1
	decq	%r8
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rax,%rcx,8), %rax
	.p2align	4, 0x90
LBB1_13:                                ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movsd	(%rsi,%r12,8), %xmm0    ## xmm0 = mem[0],zero
	mulsd	8(%rax,%r8,8), %xmm0
	addsd	8(%r15,%r8,8), %xmm0
	incq	%r12
	movsd	%xmm0, 8(%r15,%r8,8)
	incq	%r8
	cmpq	%r14, %r8
	jl	LBB1_13
LBB1_14:                                ##   in Loop: Header=BB1_2 Depth=1
	incq	%r13
	cmpq	%r11, %r13
	jne	LBB1_2
LBB1_15:
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
