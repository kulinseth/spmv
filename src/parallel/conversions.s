	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_coo_csr                ## -- Begin function coo_csr
	.p2align	4, 0x90
_coo_csr:                               ## @coo_csr
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
                                        ## kill: def $esi killed $esi def $rsi
	testl	%edi, %edi
	jle	LBB0_6
## %bb.1:
	movl	%edi, %r11d
	leaq	-1(%r11), %rbx
	movl	%r11d, %r10d
	andl	$3, %r10d
	cmpq	$3, %rbx
	jae	LBB0_20
## %bb.2:
	xorl	%ebx, %ebx
	testq	%r10, %r10
	jne	LBB0_4
	jmp	LBB0_6
LBB0_20:
	subq	%r10, %r11
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_21:                                ## =>This Inner Loop Header: Depth=1
	movslq	(%rdx,%rbx,4), %rax
	incl	(%r9,%rax,4)
	movslq	4(%rdx,%rbx,4), %rax
	incl	(%r9,%rax,4)
	movslq	8(%rdx,%rbx,4), %rax
	incl	(%r9,%rax,4)
	movslq	12(%rdx,%rbx,4), %rax
	incl	(%r9,%rax,4)
	addq	$4, %rbx
	cmpq	%rbx, %r11
	jne	LBB0_21
## %bb.3:
	testq	%r10, %r10
	je	LBB0_6
LBB0_4:
	leaq	(%rdx,%rbx,4), %r11
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movslq	(%r11,%rbx,4), %rax
	incl	(%r9,%rax,4)
	incq	%rbx
	cmpq	%rbx, %r10
	jne	LBB0_5
LBB0_6:
	testl	%esi, %esi
	jle	LBB0_12
## %bb.7:
	movl	%esi, %r11d
	leaq	-1(%r11), %rax
	movl	%r11d, %r10d
	andl	$3, %r10d
	cmpq	$3, %rax
	jae	LBB0_22
## %bb.8:
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	testq	%r10, %r10
	jne	LBB0_10
	jmp	LBB0_12
LBB0_22:
	subq	%r10, %r11
	xorl	%eax, %eax
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_23:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r9,%rax,4), %r14d
	addl	%ebx, %r14d
	movl	%ebx, (%r9,%rax,4)
	movl	4(%r9,%rax,4), %ebx
	addl	%r14d, %ebx
	movl	%r14d, 4(%r9,%rax,4)
	movl	8(%r9,%rax,4), %r14d
	addl	%ebx, %r14d
	movl	%ebx, 8(%r9,%rax,4)
	movl	12(%r9,%rax,4), %ebx
	addl	%r14d, %ebx
	movl	%r14d, 12(%r9,%rax,4)
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	LBB0_23
## %bb.9:
	testq	%r10, %r10
	je	LBB0_12
LBB0_10:
	leaq	(%r9,%rax,4), %r11
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB0_11:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r11,%rax,4), %r14d
	addl	%ebx, %r14d
	movl	%ebx, (%r11,%rax,4)
	incq	%rax
	movl	%r14d, %ebx
	cmpq	%rax, %r10
	jne	LBB0_11
LBB0_12:
	testl	%edi, %edi
	jle	LBB0_17
## %bb.13:
	movq	%rsi, -64(%rbp)         ## 8-byte Spill
	movq	24(%rbp), %r10
	movq	16(%rbp), %r14
	movl	%edi, %r15d
	movl	%r15d, %eax
	andl	$1, %eax
	movl	%edi, -44(%rbp)         ## 4-byte Spill
	cmpl	$1, %edi
	movq	%rax, -56(%rbp)         ## 8-byte Spill
	jne	LBB0_44
## %bb.14:
	xorl	%ebx, %ebx
	cmpq	$0, -56(%rbp)           ## 8-byte Folded Reload
	movl	-44(%rbp), %edi         ## 4-byte Reload
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	jne	LBB0_16
	jmp	LBB0_17
LBB0_44:
	subq	%rax, %r15
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_45:                                ## =>This Inner Loop Header: Depth=1
	movslq	(%rdx,%rbx,4), %rax
	movl	(%rcx,%rbx,4), %r12d
	movq	(%r8,%rbx,8), %r13
	movslq	(%r9,%rax,4), %r11
	movl	%r12d, (%r14,%r11,4)
	movq	%r13, (%r10,%r11,8)
	incl	(%r9,%rax,4)
	movslq	4(%rdx,%rbx,4), %rax
	movl	4(%rcx,%rbx,4), %r11d
	movq	8(%r8,%rbx,8), %rdi
	movslq	(%r9,%rax,4), %rsi
	movl	%r11d, (%r14,%rsi,4)
	movq	%rdi, (%r10,%rsi,8)
	incl	(%r9,%rax,4)
	addq	$2, %rbx
	cmpq	%rbx, %r15
	jne	LBB0_45
## %bb.15:
	cmpq	$0, -56(%rbp)           ## 8-byte Folded Reload
	movl	-44(%rbp), %edi         ## 4-byte Reload
	movq	-64(%rbp), %rsi         ## 8-byte Reload
	je	LBB0_17
LBB0_16:
	movslq	(%rdx,%rbx,4), %rax
	movl	(%rcx,%rbx,4), %ecx
	movq	(%r8,%rbx,8), %rdx
	movslq	(%r9,%rax,4), %rbx
	movl	%ecx, (%r14,%rbx,4)
	movq	%rdx, (%r10,%rbx,8)
	incl	(%r9,%rax,4)
LBB0_17:
	leal	-1(%rsi), %eax
	testl	%eax, %eax
	jle	LBB0_43
## %bb.18:
	movslq	%eax, %rcx
	cmpl	$7, %eax
	ja	LBB0_24
LBB0_19:
	movl	%esi, %eax
LBB0_41:
	movq	%rcx, %rdx
	.p2align	4, 0x90
LBB0_42:                                ## =>This Inner Loop Header: Depth=1
	cltq
	movl	-8(%r9,%rax,4), %eax
	movl	%eax, (%r9,%rcx,4)
	movl	%ecx, %eax
	decq	%rdx
	movq	%rdx, %rcx
	jg	LBB0_42
LBB0_43:
	movl	$0, (%r9)
	movslq	%esi, %rax
	movl	%edi, (%r9,%rax,4)
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_24:
	leaq	-1(%rcx), %r8
	leal	-2(%rsi), %r10d
	movl	%r10d, %ebx
	subl	%r8d, %ebx
	movl	$4, %edx
	movq	%r8, %rax
	mulq	%rdx
	seto	%dl
	cmpl	%r10d, %ebx
	jg	LBB0_19
## %bb.25:
	shrq	$32, %r8
	jne	LBB0_19
## %bb.26:
	leaq	(%r9,%rcx,4), %rbx
	cmpq	%rbx, %rax
	ja	LBB0_19
## %bb.27:
	testb	%dl, %dl
	jne	LBB0_19
## %bb.28:
	movslq	%esi, %r11
	leaq	-8(%r9,%r11,4), %rbx
	cmpq	%rbx, %rax
	ja	LBB0_19
## %bb.29:
	testb	%dl, %dl
	jne	LBB0_19
## %bb.30:
	leaq	4(%r9), %rax
	leaq	-4(%r9,%r11,4), %rdx
	cmpq	%rdx, %rax
	jae	LBB0_32
## %bb.31:
	leaq	4(%r9,%rcx,4), %rax
	leaq	-1(%r11), %rdx
	subq	%rcx, %rdx
	leaq	(%r9,%rdx,4), %rdx
	cmpq	%rax, %rdx
	jb	LBB0_19
LBB0_32:
	movq	%rcx, %r8
	andq	$-8, %r8
	leaq	-8(%r8), %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	incq	%rax
	movl	%eax, %r10d
	andl	$1, %r10d
	testq	%rdx, %rdx
	je	LBB0_33
## %bb.34:
	leaq	-12(%r9,%rcx,4), %r15
	leal	-10(%rsi), %r14d
	addq	$-2, %r11
	movl	$1, %ebx
	subq	%rax, %rbx
	leaq	-1(%r10,%rbx), %rbx
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB0_35:                                ## =>This Inner Loop Header: Depth=1
	leal	(%r11,%rax), %edx
	movslq	%edx, %rdx
	movups	-28(%r9,%rdx,4), %xmm0
	movups	-12(%r9,%rdx,4), %xmm1
	movups	%xmm1, (%r15,%rax,4)
	movups	%xmm0, -16(%r15,%rax,4)
	leal	(%r14,%rax), %edx
	movslq	%edx, %rdx
	movups	-28(%r9,%rdx,4), %xmm0
	movups	-12(%r9,%rdx,4), %xmm1
	movups	%xmm1, -32(%r15,%rax,4)
	movups	%xmm0, -48(%r15,%rax,4)
	addq	$-16, %rax
	addq	$2, %rbx
	jne	LBB0_35
## %bb.36:
	negq	%rax
	testq	%r10, %r10
	je	LBB0_39
LBB0_38:
	movq	%rcx, %rdx
	subq	%rax, %rdx
	movl	%esi, %ebx
	subl	%eax, %ebx
	movslq	%ebx, %rax
	movups	-36(%r9,%rax,4), %xmm0
	movups	-20(%r9,%rax,4), %xmm1
	movups	%xmm1, -12(%r9,%rdx,4)
	movups	%xmm0, -28(%r9,%rdx,4)
LBB0_39:
	cmpq	%rcx, %r8
	je	LBB0_43
## %bb.40:
	subq	%r8, %rcx
	movl	%esi, %eax
	subl	%r8d, %eax
	jmp	LBB0_41
LBB0_33:
	xorl	%eax, %eax
	testq	%r10, %r10
	jne	LBB0_38
	jmp	LBB0_39
	.cfi_endproc
                                        ## -- End function
	.globl	_csr_ell                ## -- Begin function csr_ell
	.p2align	4, 0x90
_csr_ell:                               ## @csr_ell
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
	subq	$120, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r8, %r12
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	movq	%rdx, -144(%rbp)        ## 8-byte Spill
	movq	%rsi, -136(%rbp)        ## 8-byte Spill
	movq	%rdi, %r15
	movq	16(%rbp), %r8
	testl	%r9d, %r9d
	jle	LBB1_1
## %bb.2:
	movl	(%r15), %ebx
	movl	%r9d, %ecx
	cmpl	$8, %r9d
	jae	LBB1_4
## %bb.3:
	xorl	%edx, %edx
	xorl	%r14d, %r14d
	jmp	LBB1_12
LBB1_1:
	xorl	%r14d, %r14d
	jmp	LBB1_14
LBB1_4:
	movl	%ecx, %edx
	andl	$-8, %edx
	movd	%ebx, %xmm0
	pshufd	$36, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,2,0]
	leaq	-8(%rdx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	incq	%rax
	movl	%eax, %esi
	andl	$1, %esi
	testq	%rdi, %rdi
	je	LBB1_5
## %bb.6:
	movl	$1, %edi
	movl	$1, %ebx
	subq	%rax, %rbx
	leaq	-1(%rsi,%rbx), %rax
	pxor	%xmm3, %xmm3
	movdqa	%xmm0, %xmm4
	pxor	%xmm2, %xmm2
	.p2align	4, 0x90
LBB1_7:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	(%r15,%rdi,4), %xmm5
	movdqu	16(%r15,%rdi,4), %xmm6
	movdqu	32(%r15,%rdi,4), %xmm1
	movdqu	48(%r15,%rdi,4), %xmm0
	movdqa	%xmm5, %xmm7
	palignr	$12, %xmm4, %xmm7       ## xmm7 = xmm4[12,13,14,15],xmm7[0,1,2,3,4,5,6,7,8,9,10,11]
	movdqa	%xmm6, %xmm4
	palignr	$12, %xmm5, %xmm4       ## xmm4 = xmm5[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm7, %xmm5
	pmaxsd	%xmm3, %xmm5
	movdqa	%xmm1, %xmm3
	palignr	$12, %xmm6, %xmm3       ## xmm3 = xmm6[12,13,14,15],xmm3[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm4, %xmm6
	pmaxsd	%xmm2, %xmm6
	movdqa	%xmm0, %xmm4
	palignr	$12, %xmm1, %xmm4       ## xmm4 = xmm1[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm3, %xmm1
	pmaxsd	%xmm5, %xmm1
	movdqa	%xmm0, %xmm2
	psubd	%xmm4, %xmm2
	pmaxsd	%xmm6, %xmm2
	addq	$16, %rdi
	movdqa	%xmm0, %xmm4
	movdqa	%xmm1, %xmm3
	addq	$2, %rax
	jne	LBB1_7
## %bb.8:
	testq	%rsi, %rsi
	je	LBB1_10
LBB1_9:
	movdqu	(%r15,%rdi,4), %xmm3
	movdqu	16(%r15,%rdi,4), %xmm4
	movdqa	%xmm3, %xmm5
	palignr	$12, %xmm0, %xmm5       ## xmm5 = xmm0[12,13,14,15],xmm5[0,1,2,3,4,5,6,7,8,9,10,11]
	movdqa	%xmm4, %xmm6
	movdqa	%xmm4, %xmm0
	palignr	$12, %xmm3, %xmm4       ## xmm4 = xmm3[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm5, %xmm3
	pmaxsd	%xmm3, %xmm1
	psubd	%xmm4, %xmm6
	pmaxsd	%xmm6, %xmm2
LBB1_10:
	pmaxsd	%xmm2, %xmm1
	pshufd	$78, %xmm1, %xmm2       ## xmm2 = xmm1[2,3,0,1]
	pmaxsd	%xmm1, %xmm2
	pshufd	$229, %xmm2, %xmm1      ## xmm1 = xmm2[1,1,2,3]
	pmaxsd	%xmm2, %xmm1
	movd	%xmm1, %r14d
	cmpq	%rcx, %rdx
	je	LBB1_14
## %bb.11:
	pextrd	$3, %xmm0, %ebx
LBB1_12:
	subq	%rdx, %rcx
	leaq	4(%r15,%rdx,4), %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB1_13:                                ## =>This Inner Loop Header: Depth=1
	movl	(%rdx,%rsi,4), %eax
	movl	%eax, %edi
	subl	%ebx, %edi
	cmpl	%edi, %r14d
	cmovll	%edi, %r14d
	incq	%rsi
	movl	%eax, %ebx
	cmpq	%rsi, %rcx
	jne	LBB1_13
LBB1_14:
	movl	%r14d, (%r8)
	movl	%r9d, -52(%rbp)         ## 4-byte Spill
	movslq	%r9d, %rax
	movslq	%r14d, %rbx
	movq	%rbx, -152(%rbp)        ## 8-byte Spill
	movq	%rax, -72(%rbp)         ## 8-byte Spill
	imulq	%rax, %rbx
	movl	$8, %esi
	movq	%rbx, %rdi
	callq	_calloc
	movq	%rax, (%r12)
	testq	%rax, %rax
	je	LBB1_15
## %bb.17:
	movq	%r12, -104(%rbp)        ## 8-byte Spill
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_calloc
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	LBB1_35
## %bb.18:
	testl	%r14d, %r14d
	jle	LBB1_27
## %bb.19:
	movl	-52(%rbp), %ecx         ## 4-byte Reload
	testl	%ecx, %ecx
	jle	LBB1_34
## %bb.20:
	movl	%ecx, %edx
	shlq	$2, %rdx
	movq	%rax, %rdi
	movl	$255, %esi
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	callq	_memset
	cmpl	$1, %r14d
	je	LBB1_27
## %bb.21:
	movl	%r14d, %eax
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	leaq	-2(%rax), %rax
	decl	%r14d
	andl	$3, %r14d
	movl	$1, %r13d
	cmpq	$3, %rax
	jb	LBB1_24
## %bb.22:
	movq	-72(%rbp), %rax         ## 8-byte Reload
	movq	%rax, %rcx
	shlq	$4, %rcx
	leaq	(,%rax,4), %rdx
	leaq	(%rdx,%rdx,2), %rsi
	movq	%rsi, -96(%rbp)         ## 8-byte Spill
	leaq	(,%rax,8), %rbx
	subq	%r14, -80(%rbp)         ## 8-byte Folded Spill
	movl	$1, %r13d
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	movq	%rcx, -88(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB1_23:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, -120(%rbp)        ## 8-byte Spill
	movq	%rdx, -128(%rbp)        ## 8-byte Spill
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	%rdx, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %r12         ## 8-byte Reload
	movq	%r12, %rdx
	callq	_memset
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	%rbx, %rdi
	movl	$255, %esi
	movq	%r12, %rdx
	callq	_memset
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	addq	%rbx, %rdi
	movl	$255, %esi
	movq	%r12, %rdx
	callq	_memset
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	movq	-88(%rbp), %r12         ## 8-byte Reload
	addq	%r12, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-128(%rbp), %rdx        ## 8-byte Reload
	addq	$4, %r13
	movq	-112(%rbp), %rax        ## 8-byte Reload
	addq	%rax, %r12
	movq	%r12, -88(%rbp)         ## 8-byte Spill
	addq	%rax, %rbx
	movq	%rbx, -96(%rbp)         ## 8-byte Spill
	movq	-120(%rbp), %rbx        ## 8-byte Reload
	addq	%rax, %rbx
	addq	%rax, %rdx
	cmpq	%r13, -80(%rbp)         ## 8-byte Folded Reload
	jne	LBB1_23
LBB1_24:
	testl	%r14d, %r14d
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	movq	-72(%rbp), %r12         ## 8-byte Reload
	je	LBB1_27
## %bb.25:
	imulq	%r12, %r13
	shlq	$2, %r13
	shlq	$2, %r12
	negq	%r14
	.p2align	4, 0x90
LBB1_26:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rbx), %rdi
	addq	%r13, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	addq	%r12, %r13
	incq	%r14
	jne	LBB1_26
LBB1_27:
	movl	-52(%rbp), %eax         ## 4-byte Reload
	testl	%eax, %eax
	movq	-104(%rbp), %r13        ## 8-byte Reload
	jle	LBB1_34
## %bb.28:
	movl	(%r15), %edi
	movl	%eax, %r8d
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	.p2align	4, 0x90
LBB1_30:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_32 Depth 2
	movq	%r9, %r11
	incq	%r9
	movl	4(%r15,%r11,4), %edx
	cmpl	%edx, %edi
	jge	LBB1_29
## %bb.31:                              ##   in Loop: Header=BB1_30 Depth=1
	movslq	%edi, %rdi
	movq	-144(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdi,8), %r14
	movq	-136(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%rdi,4), %r12
	leaq	(,%r10,8), %rcx
	addq	(%r13), %rcx
	leaq	(,%r10,4), %rsi
	addq	(%rbx), %rsi
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB1_32:                                ##   Parent Loop BB1_30 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	(%r14,%rax,8), %rdx
	movq	%rdx, (%rcx,%rax,8)
	movl	(%r12,%rax,4), %edx
	movl	%edx, (%rsi,%rax,4)
	movslq	4(%r15,%r11,4), %rdx
	leaq	1(%rdi,%rax), %rbx
	incq	%rax
	cmpq	%rdx, %rbx
	jl	LBB1_32
## %bb.33:                              ##   in Loop: Header=BB1_30 Depth=1
	movq	-48(%rbp), %rbx         ## 8-byte Reload
LBB1_29:                                ##   in Loop: Header=BB1_30 Depth=1
	addq	-152(%rbp), %r10        ## 8-byte Folded Reload
	movl	%edx, %edi
	cmpq	%r8, %r9
	jne	LBB1_30
LBB1_34:
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_5:
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm2, %xmm2
	testq	%rsi, %rsi
	jne	LBB1_9
	jmp	LBB1_10
LBB1_15:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_35:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.1(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_csr_dia                ## -- Begin function csr_dia
	.p2align	4, 0x90
_csr_dia:                               ## @csr_dia
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
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r12d
	movq	%r8, %r13
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	leal	-1(%r12,%r12), %eax
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB2_6
## %bb.1:
	movq	%rax, %r14
	movq	%r13, -80(%rbp)         ## 8-byte Spill
	movq	%rbx, -88(%rbp)         ## 8-byte Spill
	testl	%r12d, %r12d
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	jle	LBB2_2
## %bb.5:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movl	(%rax), %r9d
	movl	%r12d, %r10d
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB2_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_13 Depth 2
	movq	%r11, %rdi
	movl	%r9d, %eax
	incq	%r11
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	4(%rcx,%rdi,4), %r9d
	cmpl	%r9d, %eax
	jge	LBB2_8
## %bb.10:                              ##   in Loop: Header=BB2_9 Depth=1
	movslq	%r9d, %rcx
	notl	%edi
	addl	%r12d, %edi
	movslq	%eax, %rdx
	movl	%r9d, %ebx
	subl	%eax, %ebx
	movq	%rdx, %rax
	notq	%rax
	testb	$1, %bl
	je	LBB2_12
## %bb.11:                              ##   in Loop: Header=BB2_9 Depth=1
	movl	(%r15,%rdx,4), %ebx
	addl	%edi, %ebx
	movslq	%ebx, %rbx
	movl	(%r14,%rbx,4), %r12d
	leal	1(%r12), %r8d
	movl	%r8d, (%r14,%rbx,4)
	cmpl	$1, %r12d
	movq	-56(%rbp), %r12         ## 8-byte Reload
	adcl	$0, %r13d
	incq	%rdx
LBB2_12:                                ##   in Loop: Header=BB2_9 Depth=1
	addq	%rcx, %rax
	je	LBB2_8
	.p2align	4, 0x90
LBB2_13:                                ##   Parent Loop BB2_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r15,%rdx,4), %eax
	addl	%edi, %eax
	cltq
	movl	(%r14,%rax,4), %ebx
	leal	1(%rbx), %esi
	cmpl	$1, %ebx
	adcl	$0, %r13d
	movl	%esi, (%r14,%rax,4)
	movl	4(%r15,%rdx,4), %eax
	addl	%edi, %eax
	cltq
	movl	(%r14,%rax,4), %esi
	leal	1(%rsi), %ebx
	movl	%ebx, (%r14,%rax,4)
	cmpl	$1, %esi
	adcl	$0, %r13d
	addq	$2, %rdx
	cmpq	%rcx, %rdx
	jl	LBB2_13
LBB2_8:                                 ##   in Loop: Header=BB2_9 Depth=1
	cmpq	%r10, %r11
	jne	LBB2_9
	jmp	LBB2_3
LBB2_2:
	xorl	%r13d, %r13d
LBB2_3:
	movq	16(%rbp), %rax
	movl	%r13d, (%rax)
	movq	24(%rbp), %rax
	movl	%r12d, (%rax)
	movq	%r12, %rbx
	movslq	%r13d, %r12
	leaq	(,%r12,4), %rdi
	callq	_malloc
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB2_4
## %bb.14:
	movslq	%ebx, %rdi
	imulq	%r12, %rdi
	movl	-60(%rbp), %ecx         ## 4-byte Reload
	testl	%ecx, %ecx
	jle	LBB2_26
## %bb.15:
	movl	%ecx, %r8d
	shrl	$31, %r8d
	addl	%ecx, %r8d
	sarl	%r8d
	negl	%r8d
	cmpl	$1, %ecx
	jne	LBB2_17
## %bb.16:
	xorl	%edx, %edx
	xorl	%esi, %esi
	cmpl	$0, (%r14,%rdx,4)
	jne	LBB2_25
	jmp	LBB2_26
LBB2_17:
	movl	%ecx, %r9d
	movl	%r8d, %r10d
	decq	%r9
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_18:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r14,%rdx,4)
	je	LBB2_20
## %bb.19:                              ##   in Loop: Header=BB2_18 Depth=1
	leaq	(%r10,%rdx), %rbx
	movslq	%esi, %rcx
	incl	%esi
	movl	%ebx, (%rax,%rcx,4)
LBB2_20:                                ##   in Loop: Header=BB2_18 Depth=1
	cmpl	$0, 4(%r14,%rdx,4)
	je	LBB2_22
## %bb.21:                              ##   in Loop: Header=BB2_18 Depth=1
	leal	1(%r10,%rdx), %ecx
	movslq	%esi, %rbx
	incl	%esi
	movl	%ecx, (%rax,%rbx,4)
LBB2_22:                                ##   in Loop: Header=BB2_18 Depth=1
	addq	$2, %rdx
	cmpq	%rdx, %r9
	jne	LBB2_18
## %bb.23:
	addl	%edx, %r8d
	cmpl	$0, (%r14,%rdx,4)
	je	LBB2_26
LBB2_25:
	movslq	%esi, %rcx
	movl	%r8d, (%rax,%rcx,4)
LBB2_26:
	movl	$8, %esi
	callq	_calloc
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB2_39
## %bb.27:
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB2_32
## %bb.28:
	testl	%r13d, %r13d
	jle	LBB2_32
## %bb.29:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx), %ecx
	movl	-56(%rbp), %r8d         ## 4-byte Reload
	leaq	(,%r12,8), %r9
	xorl	%r14d, %r14d
	movq	-88(%rbp), %r13         ## 8-byte Reload
	.p2align	4, 0x90
LBB2_30:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_34 Depth 2
                                        ##       Child Loop BB2_35 Depth 3
	leaq	1(%r14), %r10
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movl	4(%rdx,%r14,4), %r11d
	cmpl	%r11d, %ecx
	jge	LBB2_31
## %bb.33:                              ##   in Loop: Header=BB2_30 Depth=1
	movslq	%r11d, %rdx
	movslq	%ecx, %rdi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rcx
	.p2align	4, 0x90
LBB2_34:                                ##   Parent Loop BB2_30 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_35 Depth 3
	movl	(%r15,%rdi,4), %ebx
	subl	%r14d, %ebx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_35:                                ##   Parent Loop BB2_30 Depth=1
                                        ##     Parent Loop BB2_34 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	(%rcx,%rsi,4), %ebx
	je	LBB2_36
## %bb.38:                              ##   in Loop: Header=BB2_35 Depth=3
	incq	%rsi
	cmpq	%r12, %rsi
	jl	LBB2_35
## %bb.37:                              ##   in Loop: Header=BB2_34 Depth=2
	incq	%rdi
	cmpq	%rdx, %rdi
	jl	LBB2_34
	jmp	LBB2_31
	.p2align	4, 0x90
LBB2_36:                                ##   in Loop: Header=BB2_34 Depth=2
	movq	(%r13,%rdi,8), %rbx
	movq	%rbx, (%rax,%rsi,8)
	incq	%rdi
	cmpq	%rdx, %rdi
	jl	LBB2_34
LBB2_31:                                ##   in Loop: Header=BB2_30 Depth=1
	addq	%r9, %rax
	movl	%r11d, %ecx
	movq	%r10, %r14
	cmpq	%r8, %r10
	jne	LBB2_30
LBB2_32:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB2_6:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$35, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB2_4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB2_39:
	movq	___stderrp@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	leaq	L_.str.4(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edi
	callq	_strerror
	leaq	L_.str.5(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edx
	leaq	L_.str.6(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_csr_diaii              ## -- Begin function csr_diaii
	.p2align	4, 0x90
_csr_diaii:                             ## @csr_diaii
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
	subq	$56, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r12d
	movq	%r8, %r13
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	movq	%rdx, %rbx
	movq	%rsi, %r15
	movq	%rdi, -48(%rbp)         ## 8-byte Spill
	leal	-1(%r12,%r12), %eax
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB3_6
## %bb.1:
	movq	%rax, %r14
	movq	%r13, -88(%rbp)         ## 8-byte Spill
	movq	%rbx, -96(%rbp)         ## 8-byte Spill
	movq	16(%rbp), %r9
	testl	%r12d, %r12d
	movq	%r15, -80(%rbp)         ## 8-byte Spill
	movq	%r12, -56(%rbp)         ## 8-byte Spill
	jle	LBB3_2
## %bb.5:
	movq	-48(%rbp), %rax         ## 8-byte Reload
	movl	(%rax), %r8d
	movl	%r12d, %r10d
	xorl	%r11d, %r11d
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB3_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_13 Depth 2
	movq	%r11, %rdi
	movl	%r8d, %eax
	incq	%r11
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	4(%rcx,%rdi,4), %r8d
	cmpl	%r8d, %eax
	jge	LBB3_8
## %bb.10:                              ##   in Loop: Header=BB3_9 Depth=1
	movslq	%r8d, %rcx
	notl	%edi
	addl	%r12d, %edi
	movslq	%eax, %rdx
	movl	%r8d, %ebx
	subl	%eax, %ebx
	movq	%rdx, %rax
	notq	%rax
	testb	$1, %bl
	je	LBB3_12
## %bb.11:                              ##   in Loop: Header=BB3_9 Depth=1
	movl	(%r15,%rdx,4), %ebx
	addl	%edi, %ebx
	movslq	%ebx, %r12
	movl	(%r14,%r12,4), %r15d
	leal	1(%r15), %ebx
	movl	%ebx, (%r14,%r12,4)
	movq	-56(%rbp), %r12         ## 8-byte Reload
	cmpl	$1, %r15d
	movq	-80(%rbp), %r15         ## 8-byte Reload
	adcl	$0, %r13d
	incq	%rdx
LBB3_12:                                ##   in Loop: Header=BB3_9 Depth=1
	addq	%rcx, %rax
	je	LBB3_8
	.p2align	4, 0x90
LBB3_13:                                ##   Parent Loop BB3_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r15,%rdx,4), %eax
	addl	%edi, %eax
	cltq
	movl	(%r14,%rax,4), %ebx
	leal	1(%rbx), %esi
	cmpl	$1, %ebx
	adcl	$0, %r13d
	movl	%esi, (%r14,%rax,4)
	movl	4(%r15,%rdx,4), %eax
	addl	%edi, %eax
	cltq
	movl	(%r14,%rax,4), %esi
	leal	1(%rsi), %ebx
	movl	%ebx, (%r14,%rax,4)
	cmpl	$1, %esi
	adcl	$0, %r13d
	addq	$2, %rdx
	cmpq	%rcx, %rdx
	jl	LBB3_13
LBB3_8:                                 ##   in Loop: Header=BB3_9 Depth=1
	cmpq	%r10, %r11
	jne	LBB3_9
	jmp	LBB3_3
LBB3_2:
	xorl	%r13d, %r13d
LBB3_3:
	movl	%r13d, (%r9)
	movq	24(%rbp), %rax
	movl	%r12d, (%rax)
	movq	%r12, %rbx
	movslq	%r13d, %r12
	leaq	(,%r12,4), %rdi
	callq	_malloc
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB3_4
## %bb.14:
	movslq	%ebx, %r15
	movq	%r12, %rdi
	imulq	%r15, %rdi
	movl	-60(%rbp), %ecx         ## 4-byte Reload
	testl	%ecx, %ecx
	jle	LBB3_26
## %bb.15:
	movl	%ecx, %r8d
	shrl	$31, %r8d
	addl	%ecx, %r8d
	sarl	%r8d
	negl	%r8d
	cmpl	$1, %ecx
	jne	LBB3_17
## %bb.16:
	xorl	%edx, %edx
	xorl	%esi, %esi
	cmpl	$0, (%r14,%rdx,4)
	jne	LBB3_25
	jmp	LBB3_26
LBB3_17:
	movl	%ecx, %r9d
	movl	%r8d, %r10d
	decq	%r9
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB3_18:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r14,%rdx,4)
	je	LBB3_20
## %bb.19:                              ##   in Loop: Header=BB3_18 Depth=1
	leaq	(%r10,%rdx), %rbx
	movslq	%esi, %rcx
	incl	%esi
	movl	%ebx, (%rax,%rcx,4)
LBB3_20:                                ##   in Loop: Header=BB3_18 Depth=1
	cmpl	$0, 4(%r14,%rdx,4)
	je	LBB3_22
## %bb.21:                              ##   in Loop: Header=BB3_18 Depth=1
	leal	1(%r10,%rdx), %ecx
	movslq	%esi, %rbx
	incl	%esi
	movl	%ecx, (%rax,%rbx,4)
LBB3_22:                                ##   in Loop: Header=BB3_18 Depth=1
	addq	$2, %rdx
	cmpq	%rdx, %r9
	jne	LBB3_18
## %bb.23:
	addl	%edx, %r8d
	cmpl	$0, (%r14,%rdx,4)
	je	LBB3_26
LBB3_25:
	movslq	%esi, %rcx
	movl	%r8d, (%rax,%rcx,4)
LBB3_26:
	movl	$8, %esi
	callq	_calloc
	movq	-88(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB3_39
## %bb.27:
	cmpl	$0, -56(%rbp)           ## 4-byte Folded Reload
	jle	LBB3_32
## %bb.28:
	testl	%r13d, %r13d
	jle	LBB3_32
## %bb.29:
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx), %esi
	movl	-56(%rbp), %r8d         ## 4-byte Reload
	shlq	$3, %r15
	xorl	%r14d, %r14d
	movq	-96(%rbp), %r13         ## 8-byte Reload
	.p2align	4, 0x90
LBB3_30:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_34 Depth 2
                                        ##       Child Loop BB3_35 Depth 3
	leaq	1(%r14), %r9
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	4(%rcx,%r14,4), %r10d
	cmpl	%r10d, %esi
	jge	LBB3_31
## %bb.33:                              ##   in Loop: Header=BB3_30 Depth=1
	movslq	%r10d, %r11
	movslq	%esi, %rsi
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rdi
	.p2align	4, 0x90
LBB3_34:                                ##   Parent Loop BB3_30 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB3_35 Depth 3
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx,%rsi,4), %ebx
	subl	%r14d, %ebx
	movq	%rax, %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB3_35:                                ##   Parent Loop BB3_30 Depth=1
                                        ##     Parent Loop BB3_34 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	(%rdi,%rdx,4), %ebx
	je	LBB3_36
## %bb.38:                              ##   in Loop: Header=BB3_35 Depth=3
	incq	%rdx
	addq	%r15, %rcx
	cmpq	%r12, %rdx
	jl	LBB3_35
## %bb.37:                              ##   in Loop: Header=BB3_34 Depth=2
	incq	%rsi
	cmpq	%r11, %rsi
	jl	LBB3_34
	jmp	LBB3_31
	.p2align	4, 0x90
LBB3_36:                                ##   in Loop: Header=BB3_34 Depth=2
	movq	(%r13,%rsi,8), %rdx
	movq	%rdx, (%rcx)
	incq	%rsi
	cmpq	%r11, %rsi
	jl	LBB3_34
LBB3_31:                                ##   in Loop: Header=BB3_30 Depth=1
	addq	$8, %rax
	movl	%r10d, %esi
	movq	%r9, %r14
	cmpq	%r8, %r9
	jne	LBB3_30
LBB3_32:
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_6:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$35, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB3_4:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB3_39:
	movq	___stderrp@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	leaq	L_.str.4(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edi
	callq	_strerror
	leaq	L_.str.5(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edx
	leaq	L_.str.6(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_csr_ellii              ## -- Begin function csr_ellii
	.p2align	4, 0x90
_csr_ellii:                             ## @csr_ellii
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
	subq	$120, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, -88(%rbp)         ## 8-byte Spill
	movq	%rsi, -80(%rbp)         ## 8-byte Spill
	movq	%rdi, %r13
	movq	16(%rbp), %r11
	testl	%r9d, %r9d
	movq	%r8, -96(%rbp)          ## 8-byte Spill
	jle	LBB4_1
## %bb.2:
	movl	(%r13), %edx
	movl	%r9d, %r10d
	cmpl	$8, %r9d
	jae	LBB4_4
## %bb.3:
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	jmp	LBB4_13
LBB4_1:
	movq	%rcx, %r15
	xorl	%eax, %eax
	jmp	LBB4_15
LBB4_4:
	movl	%r10d, %ebx
	andl	$-8, %ebx
	movd	%edx, %xmm0
	pshufd	$36, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,2,0]
	leaq	-8(%rbx), %rdi
	movq	%rdi, %rax
	shrq	$3, %rax
	incq	%rax
	movl	%eax, %edx
	andl	$1, %edx
	testq	%rdi, %rdi
	je	LBB4_5
## %bb.6:
	movl	$1, %edi
	movl	$1, %esi
	subq	%rax, %rsi
	leaq	-1(%rdx,%rsi), %rax
	pxor	%xmm3, %xmm3
	movdqa	%xmm0, %xmm4
	pxor	%xmm2, %xmm2
	.p2align	4, 0x90
LBB4_7:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	(%r13,%rdi,4), %xmm5
	movdqu	16(%r13,%rdi,4), %xmm6
	movdqu	32(%r13,%rdi,4), %xmm1
	movdqu	48(%r13,%rdi,4), %xmm0
	movdqa	%xmm5, %xmm7
	palignr	$12, %xmm4, %xmm7       ## xmm7 = xmm4[12,13,14,15],xmm7[0,1,2,3,4,5,6,7,8,9,10,11]
	movdqa	%xmm6, %xmm4
	palignr	$12, %xmm5, %xmm4       ## xmm4 = xmm5[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm7, %xmm5
	pmaxsd	%xmm3, %xmm5
	movdqa	%xmm1, %xmm3
	palignr	$12, %xmm6, %xmm3       ## xmm3 = xmm6[12,13,14,15],xmm3[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm4, %xmm6
	pmaxsd	%xmm2, %xmm6
	movdqa	%xmm0, %xmm4
	palignr	$12, %xmm1, %xmm4       ## xmm4 = xmm1[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm3, %xmm1
	pmaxsd	%xmm5, %xmm1
	movdqa	%xmm0, %xmm2
	psubd	%xmm4, %xmm2
	pmaxsd	%xmm6, %xmm2
	addq	$16, %rdi
	movdqa	%xmm0, %xmm4
	movdqa	%xmm1, %xmm3
	addq	$2, %rax
	jne	LBB4_7
## %bb.8:
	testq	%rdx, %rdx
	je	LBB4_10
LBB4_9:
	movdqu	(%r13,%rdi,4), %xmm3
	movdqu	16(%r13,%rdi,4), %xmm4
	movdqa	%xmm3, %xmm5
	palignr	$12, %xmm0, %xmm5       ## xmm5 = xmm0[12,13,14,15],xmm5[0,1,2,3,4,5,6,7,8,9,10,11]
	movdqa	%xmm4, %xmm6
	movdqa	%xmm4, %xmm0
	palignr	$12, %xmm3, %xmm4       ## xmm4 = xmm3[12,13,14,15],xmm4[0,1,2,3,4,5,6,7,8,9,10,11]
	psubd	%xmm5, %xmm3
	pmaxsd	%xmm3, %xmm1
	psubd	%xmm4, %xmm6
	pmaxsd	%xmm6, %xmm2
LBB4_10:
	pmaxsd	%xmm2, %xmm1
	pshufd	$78, %xmm1, %xmm2       ## xmm2 = xmm1[2,3,0,1]
	pmaxsd	%xmm1, %xmm2
	pshufd	$229, %xmm2, %xmm1      ## xmm1 = xmm2[1,1,2,3]
	pmaxsd	%xmm2, %xmm1
	movd	%xmm1, %eax
	cmpq	%r10, %rbx
	jne	LBB4_12
## %bb.11:
	movq	%rcx, %r15
	jmp	LBB4_15
LBB4_12:
	pextrd	$3, %xmm0, %edx
LBB4_13:
	movq	%rcx, %r15
	subq	%rbx, %r10
	leaq	4(%r13,%rbx,4), %rcx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB4_14:                                ## =>This Inner Loop Header: Depth=1
	movl	(%rcx,%rdi,4), %ebx
	movl	%ebx, %esi
	subl	%edx, %esi
	cmpl	%esi, %eax
	cmovll	%esi, %eax
	incq	%rdi
	movl	%ebx, %edx
	cmpq	%rdi, %r10
	jne	LBB4_14
LBB4_15:
	movl	%eax, (%r11)
	movl	%r9d, %ebx
	movslq	%r9d, %rcx
	movslq	%eax, %r14
	movq	%rcx, -72(%rbp)         ## 8-byte Spill
	imulq	%rcx, %r14
	movl	$8, %esi
	movq	%r14, %rdi
	callq	_calloc
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB4_16
## %bb.18:
	movl	$4, %esi
	movq	%r14, %rdi
	callq	_calloc
	movq	%rax, (%r15)
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	testq	%rax, %rax
	je	LBB4_21
## %bb.19:
	testl	%ebx, %ebx
	jle	LBB4_31
## %bb.20:
	movl	(%r13), %r10d
	movl	%ebx, %r9d
	movq	-88(%rbp), %rax         ## 8-byte Reload
	leaq	8(%rax), %rax
	movq	%rax, -112(%rbp)        ## 8-byte Spill
	movq	-80(%rbp), %rax         ## 8-byte Reload
	leaq	4(%rax), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	leaq	(%rbx,%rcx,4), %rdi
	leaq	(,%rcx,8), %rsi
	xorl	%r14d, %r14d
	movq	%r13, -128(%rbp)        ## 8-byte Spill
	movq	%r9, -120(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB4_26:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_30 Depth 2
	movq	%r14, %rdx
	movl	%r10d, %eax
	incq	%r14
	movl	4(%r13,%rdx,4), %r10d
	cmpl	%r10d, %eax
	jge	LBB4_25
## %bb.27:                              ##   in Loop: Header=BB4_26 Depth=1
	movslq	%r10d, %r12
	movq	-96(%rbp), %r8          ## 8-byte Reload
	movq	(%r8), %r15
	movslq	%eax, %r8
	movl	%r10d, %r11d
	subl	%eax, %r11d
	movq	%r8, %rax
	notq	%rax
	andl	$1, %r11d
	movq	%r12, -48(%rbp)         ## 8-byte Spill
	addq	%r12, %rax
	movq	%r15, -152(%rbp)        ## 8-byte Spill
	jne	LBB4_29
## %bb.28:                              ##   in Loop: Header=BB4_26 Depth=1
	xorl	%r15d, %r15d
	testq	%r11, %r11
	jne	LBB4_24
	jmp	LBB4_25
	.p2align	4, 0x90
LBB4_29:                                ##   in Loop: Header=BB4_26 Depth=1
	movq	%r14, -144(%rbp)        ## 8-byte Spill
	movl	%r10d, -52(%rbp)        ## 4-byte Spill
	movq	-112(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%r8,8), %r13
	movq	-104(%rbp), %rax        ## 8-byte Reload
	leaq	(%rax,%r8,4), %r10
	leaq	(%r15,%rcx,8), %rax
	movq	%rdx, -136(%rbp)        ## 8-byte Spill
	leaq	(%r15,%rdx,8), %r12
	movq	%r11, %r9
	subq	-48(%rbp), %r9          ## 8-byte Folded Reload
	movq	%r8, -48(%rbp)          ## 8-byte Spill
	addq	%r8, %r9
	xorl	%r8d, %r8d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB4_30:                                ##   Parent Loop BB4_26 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-8(%r13,%r15,8), %r14
	movq	%r14, (%r12,%r8,2)
	movl	-4(%r10,%r15,4), %edx
	movl	%edx, (%rbx,%r8)
	movq	(%r13,%r15,8), %rdx
	movq	%rdx, (%rax,%r8,2)
	movl	(%r10,%r15,4), %edx
	movl	%edx, (%rdi,%r8)
	addq	$2, %r15
	addq	%rsi, %r8
	movq	%r9, %rdx
	addq	%r15, %rdx
	jne	LBB4_30
## %bb.22:                              ##   in Loop: Header=BB4_26 Depth=1
	movq	-48(%rbp), %r8          ## 8-byte Reload
	addq	%r15, %r8
	movq	-128(%rbp), %r13        ## 8-byte Reload
	movq	-120(%rbp), %r9         ## 8-byte Reload
	movl	-52(%rbp), %r10d        ## 4-byte Reload
	movq	-144(%rbp), %r14        ## 8-byte Reload
	movq	-136(%rbp), %rdx        ## 8-byte Reload
	testq	%r11, %r11
	je	LBB4_25
LBB4_24:                                ##   in Loop: Header=BB4_26 Depth=1
	movq	-88(%rbp), %rax         ## 8-byte Reload
	movq	(%rax,%r8,8), %rax
	imulq	-72(%rbp), %r15         ## 8-byte Folded Reload
	addq	%rdx, %r15
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	movq	%rax, (%rdx,%r15,8)
	movq	-80(%rbp), %rax         ## 8-byte Reload
	movl	(%rax,%r8,4), %eax
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	movl	%eax, (%rdx,%r15,4)
LBB4_25:                                ##   in Loop: Header=BB4_26 Depth=1
	addq	$4, %rdi
	incq	%rcx
	addq	$4, %rbx
	cmpq	%r9, %r14
	jne	LBB4_26
LBB4_31:
	addq	$120, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB4_5:
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	pxor	%xmm2, %xmm2
	testq	%rdx, %rdx
	jne	LBB4_9
	jmp	LBB4_10
LBB4_16:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB4_21:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.1(%rip), %rdi
	movl	$38, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.globl	_csr_custom             ## -- Begin function csr_custom
	.p2align	4, 0x90
_csr_custom:                            ## @csr_custom
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
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movq	%r8, %r12
	movq	%rcx, %r15
	movq	%rdx, -104(%rbp)        ## 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, -56(%rbp)         ## 8-byte Spill
	movq	24(%rbp), %rax
	movq	%rax, -96(%rbp)         ## 8-byte Spill
	movq	16(%rbp), %rax
	movq	%rax, -64(%rbp)         ## 8-byte Spill
	leal	-1(%rbx,%rbx), %eax
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB5_1
## %bb.3:
	movq	%rax, %r14
	movq	%r12, -72(%rbp)         ## 8-byte Spill
	movq	%r15, -88(%rbp)         ## 8-byte Spill
	callq	_clock
	testl	%ebx, %ebx
	movq	%rbx, -48(%rbp)         ## 8-byte Spill
	jle	LBB5_4
## %bb.8:
	movq	%rbx, %r10
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	(%rax), %r15d
	movl	%r10d, %r8d
	xorl	%r9d, %r9d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB5_10:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_14 Depth 2
	movq	%r9, %rsi
	movl	%r15d, %edx
	incq	%r9
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	4(%rax,%rsi,4), %r15d
	cmpl	%r15d, %edx
	jge	LBB5_9
## %bb.11:                              ##   in Loop: Header=BB5_10 Depth=1
	movslq	%r15d, %rdi
	notl	%esi
	addl	%r10d, %esi
	movslq	%edx, %rax
	movl	%r15d, %ebx
	subl	%edx, %ebx
	movq	%rax, %rdx
	notq	%rdx
	testb	$1, %bl
	je	LBB5_13
## %bb.12:                              ##   in Loop: Header=BB5_10 Depth=1
	movl	(%r13,%rax,4), %ebx
	addl	%esi, %ebx
	movslq	%ebx, %r11
	movl	(%r14,%r11,4), %r10d
	leal	1(%r10), %ebx
	movl	%ebx, (%r14,%r11,4)
	cmpl	$1, %r10d
	movq	-48(%rbp), %r10         ## 8-byte Reload
	adcl	$0, %r12d
	incq	%rax
LBB5_13:                                ##   in Loop: Header=BB5_10 Depth=1
	addq	%rdi, %rdx
	je	LBB5_9
	.p2align	4, 0x90
LBB5_14:                                ##   Parent Loop BB5_10 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r13,%rax,4), %edx
	addl	%esi, %edx
	movslq	%edx, %rdx
	movl	(%r14,%rdx,4), %ebx
	leal	1(%rbx), %ecx
	cmpl	$1, %ebx
	adcl	$0, %r12d
	movl	%ecx, (%r14,%rdx,4)
	movl	4(%r13,%rax,4), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, (%r14,%rcx,4)
	cmpl	$1, %edx
	adcl	$0, %r12d
	addq	$2, %rax
	cmpq	%rdi, %rax
	jl	LBB5_14
LBB5_9:                                 ##   in Loop: Header=BB5_10 Depth=1
	cmpq	%r8, %r9
	jne	LBB5_10
	jmp	LBB5_5
LBB5_4:
	xorl	%r12d, %r12d
LBB5_5:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movl	%r12d, (%rax)
	movslq	%r12d, %r15
	leaq	(,%r15,4), %rdi
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	callq	_malloc
	movq	-88(%rbp), %rbx         ## 8-byte Reload
	movq	%rax, (%rbx)
	movq	-64(%rbp), %rdi         ## 8-byte Reload
	callq	_malloc
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB5_7
## %bb.6:
	movq	(%rbx), %r8
	testq	%r8, %r8
	je	LBB5_7
## %bb.15:
	xorl	%r11d, %r11d
	movl	-76(%rbp), %ecx         ## 4-byte Reload
	testl	%ecx, %ecx
	jle	LBB5_16
## %bb.17:
	movl	%ecx, %edx
	shrl	$31, %edx
	addl	%ecx, %edx
	sarl	%edx
	movl	%edx, %r9d
	negl	%r9d
	movl	%ecx, %r10d
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB5_18:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r14,%rcx,4)
	je	LBB5_20
## %bb.19:                              ##   in Loop: Header=BB5_18 Depth=1
	leaq	(%r9,%rcx), %rbx
	movslq	%r11d, %rsi
	movl	%edi, (%rax,%rsi,4)
	movl	%ebx, (%r8,%rsi,4)
	testl	%ebx, %ebx
	cmovsl	%edx, %ebx
	leal	1(%rsi), %r11d
	movq	-48(%rbp), %rsi         ## 8-byte Reload
                                        ## kill: def $esi killed $esi killed $rsi
	subl	%ebx, %esi
	movslq	%esi, %rsi
	addq	%rsi, %rdi
LBB5_20:                                ##   in Loop: Header=BB5_18 Depth=1
	incq	%rcx
	decl	%edx
	cmpq	%rcx, %r10
	jne	LBB5_18
	jmp	LBB5_21
LBB5_16:
	xorl	%edi, %edi
LBB5_21:
	movl	$8, %esi
	callq	_calloc
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB5_34
## %bb.22:
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	testl	%edx, %edx
	jle	LBB5_27
## %bb.23:
	testl	%r12d, %r12d
	jle	LBB5_27
## %bb.24:
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx), %ecx
	movl	%edx, %edx
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	xorl	%r11d, %r11d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB5_25:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_29 Depth 2
                                        ##       Child Loop BB5_30 Depth 3
	leaq	1(%r12), %rdx
	movq	%rdx, -48(%rbp)         ## 8-byte Spill
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	movl	4(%rdx,%r12,4), %r10d
	cmpl	%r10d, %ecx
	jge	LBB5_26
## %bb.28:                              ##   in Loop: Header=BB5_25 Depth=1
	movslq	%r10d, %r14
	movslq	%ecx, %rcx
	movq	-88(%rbp), %rdx         ## 8-byte Reload
	movq	(%rdx), %rdx
	.p2align	4, 0x90
LBB5_29:                                ##   Parent Loop BB5_25 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB5_30 Depth 3
	movl	(%r13,%rcx,4), %ebx
	subl	%r12d, %ebx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB5_30:                                ##   Parent Loop BB5_25 Depth=1
                                        ##     Parent Loop BB5_29 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	(%rdx,%rdi,4), %ebx
	je	LBB5_31
## %bb.33:                              ##   in Loop: Header=BB5_30 Depth=3
	incq	%rdi
	cmpq	%r15, %rdi
	jl	LBB5_30
## %bb.32:                              ##   in Loop: Header=BB5_29 Depth=2
	incq	%rcx
	cmpq	%r14, %rcx
	jl	LBB5_29
	jmp	LBB5_26
	.p2align	4, 0x90
LBB5_31:                                ##   in Loop: Header=BB5_29 Depth=2
	negl	%ebx
	cmovsl	%r11d, %ebx
	movl	%r12d, %esi
	subl	%ebx, %esi
	movq	-104(%rbp), %rbx        ## 8-byte Reload
	movq	(%rbx,%rcx,8), %r9
	movq	-96(%rbp), %rbx         ## 8-byte Reload
	movq	(%rbx), %r8
	movslq	(%r8,%rdi,4), %rdi
	movslq	%esi, %rsi
	addq	%rdi, %rsi
	movq	%r9, (%rax,%rsi,8)
	incq	%rcx
	cmpq	%r14, %rcx
	jl	LBB5_29
LBB5_26:                                ##   in Loop: Header=BB5_25 Depth=1
	movl	%r10d, %ecx
	movq	-48(%rbp), %rdx         ## 8-byte Reload
	movq	%rdx, %r12
	cmpq	-72(%rbp), %rdx         ## 8-byte Folded Reload
	jne	LBB5_25
LBB5_27:
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_clock                  ## TAILCALL
LBB5_7:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB5_1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$35, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB5_34:
	movq	___stderrp@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	leaq	L_.str.4(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edi
	callq	_strerror
	leaq	L_.str.5(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edx
	leaq	L_.str.6(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"couldn't allocate ell_data using malloc"

L_.str.1:                               ## @.str.1
	.asciz	"couldn't allocate indices using malloc"

L_.str.2:                               ## @.str.2
	.asciz	"couldn't allocate ind using calloc\n"

L_.str.3:                               ## @.str.3
	.asciz	"couldn't allocate *offset using malloc\n"

L_.str.4:                               ## @.str.4
	.asciz	"couldn't allocate *data using calloc\n"

L_.str.5:                               ## @.str.5
	.asciz	"%s\n"

L_.str.6:                               ## @.str.6
	.asciz	"%d\n"


.subsections_via_symbols
