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
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r15
	movl	%esi, %r12d
	testl	%edi, %edi
	jle	LBB0_6
## %bb.1:
	movl	%edi, %esi
	leaq	-1(%rsi), %rbx
	movl	%esi, %r9d
	andl	$7, %r9d
	cmpq	$7, %rbx
	jae	LBB0_21
## %bb.2:
	xorl	%ebx, %ebx
	testq	%r9, %r9
	jne	LBB0_4
	jmp	LBB0_6
LBB0_21:
	subq	%r9, %rsi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_22:                                ## =>This Inner Loop Header: Depth=1
	movslq	(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	4(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	8(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	12(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	16(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	20(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	24(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	movslq	28(%rdx,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	addq	$8, %rbx
	cmpq	%rbx, %rsi
	jne	LBB0_22
## %bb.3:
	testq	%r9, %r9
	je	LBB0_6
LBB0_4:
	leaq	(%rdx,%rbx,4), %rsi
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movslq	(%rsi,%rbx,4), %rax
	addl	$1, (%r15,%rax,4)
	addq	$1, %rbx
	cmpq	%rbx, %r9
	jne	LBB0_5
LBB0_6:
	testl	%r12d, %r12d
	jle	LBB0_12
## %bb.7:
	movl	%r12d, %r10d
	leaq	-1(%r10), %rax
	movl	%r10d, %r9d
	andl	$7, %r9d
	cmpq	$7, %rax
	jae	LBB0_23
## %bb.8:
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	testq	%r9, %r9
	jne	LBB0_10
	jmp	LBB0_12
LBB0_23:
	subq	%r9, %r10
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB0_24:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r15,%rbx,4), %esi
	addl	%eax, %esi
	movl	%eax, (%r15,%rbx,4)
	movl	4(%r15,%rbx,4), %eax
	addl	%esi, %eax
	movl	%esi, 4(%r15,%rbx,4)
	movl	8(%r15,%rbx,4), %esi
	addl	%eax, %esi
	movl	%eax, 8(%r15,%rbx,4)
	movl	12(%r15,%rbx,4), %eax
	addl	%esi, %eax
	movl	%esi, 12(%r15,%rbx,4)
	movl	16(%r15,%rbx,4), %esi
	addl	%eax, %esi
	movl	%eax, 16(%r15,%rbx,4)
	movl	20(%r15,%rbx,4), %eax
	addl	%esi, %eax
	movl	%esi, 20(%r15,%rbx,4)
	movl	24(%r15,%rbx,4), %esi
	addl	%eax, %esi
	movl	%eax, 24(%r15,%rbx,4)
	movl	28(%r15,%rbx,4), %eax
	addl	%esi, %eax
	movl	%esi, 28(%r15,%rbx,4)
	addq	$8, %rbx
	cmpq	%rbx, %r10
	jne	LBB0_24
## %bb.9:
	testq	%r9, %r9
	je	LBB0_12
LBB0_10:
	leaq	(%r15,%rbx,4), %r10
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_11:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r10,%rbx,4), %esi
	addl	%eax, %esi
	movl	%eax, (%r10,%rbx,4)
	addq	$1, %rbx
	movl	%esi, %eax
	cmpq	%rbx, %r9
	jne	LBB0_11
LBB0_12:
	testl	%edi, %edi
	jle	LBB0_18
## %bb.13:
	movl	%edi, %eax
	movq	%r12, -48(%rbp)         ## 8-byte Spill
	movq	24(%rbp), %r10
	movl	%edi, %r11d
	leaq	-1(%r11), %rbx
	movl	%r11d, %r9d
	andl	$3, %r9d
	cmpq	$3, %rbx
	jae	LBB0_49
## %bb.14:
	xorl	%ebx, %ebx
	movq	16(%rbp), %r13
	testq	%r9, %r9
	movq	-48(%rbp), %r12         ## 8-byte Reload
	jne	LBB0_16
	jmp	LBB0_18
LBB0_49:
	subq	%r9, %r11
	xorl	%ebx, %ebx
	movq	16(%rbp), %r13
	.p2align	4, 0x90
LBB0_50:                                ## =>This Inner Loop Header: Depth=1
	movslq	(%rdx,%rbx,4), %rax
	movl	(%rcx,%rbx,4), %r12d
	movl	(%r8,%rbx,4), %r14d
	movslq	(%r15,%rax,4), %rsi
	movl	%r12d, (%r13,%rsi,4)
	movl	%r14d, (%r10,%rsi,4)
	addl	$1, (%r15,%rax,4)
	movslq	4(%rdx,%rbx,4), %rax
	movl	4(%rcx,%rbx,4), %r12d
	movl	4(%r8,%rbx,4), %r14d
	movslq	(%r15,%rax,4), %rsi
	movl	%r12d, (%r13,%rsi,4)
	movl	%r14d, (%r10,%rsi,4)
	addl	$1, (%r15,%rax,4)
	movslq	8(%rdx,%rbx,4), %rax
	movl	8(%rcx,%rbx,4), %r12d
	movl	8(%r8,%rbx,4), %r14d
	movslq	(%r15,%rax,4), %rsi
	movl	%r12d, (%r13,%rsi,4)
	movl	%r14d, (%r10,%rsi,4)
	addl	$1, (%r15,%rax,4)
	movslq	12(%rdx,%rbx,4), %rax
	movl	12(%rcx,%rbx,4), %r12d
	movl	12(%r8,%rbx,4), %r14d
	movslq	(%r15,%rax,4), %rsi
	movl	%r12d, (%r13,%rsi,4)
	movl	%r14d, (%r10,%rsi,4)
	addl	$1, (%r15,%rax,4)
	addq	$4, %rbx
	cmpq	%rbx, %r11
	jne	LBB0_50
## %bb.15:
	testq	%r9, %r9
	movq	-48(%rbp), %r12         ## 8-byte Reload
	je	LBB0_18
LBB0_16:
	leaq	(%r8,%rbx,4), %r8
	leaq	(%rcx,%rbx,4), %r11
	leaq	(%rdx,%rbx,4), %r14
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_17:                                ## =>This Inner Loop Header: Depth=1
	movslq	(%r14,%rbx,4), %rax
	movl	(%r11,%rbx,4), %esi
	movl	(%r8,%rbx,4), %ecx
	movslq	(%r15,%rax,4), %rdx
	movl	%esi, (%r13,%rdx,4)
	movl	%ecx, (%r10,%rdx,4)
	addl	$1, (%r15,%rax,4)
	addq	$1, %rbx
	cmpq	%rbx, %r9
	jne	LBB0_17
LBB0_18:
	leal	-1(%r12), %eax
	testl	%eax, %eax
	jle	LBB0_44
## %bb.19:
	movslq	%eax, %rsi
	cmpl	$63, %eax
	ja	LBB0_25
LBB0_20:
	movl	%r12d, %eax
LBB0_42:
	movq	%rsi, %rcx
	.p2align	4, 0x90
LBB0_43:                                ## =>This Inner Loop Header: Depth=1
	cltq
	movl	-8(%r15,%rax,4), %eax
	movl	%eax, (%r15,%rsi,4)
	movl	%esi, %eax
	addq	$-1, %rcx
	movq	%rcx, %rsi
	jg	LBB0_43
LBB0_44:
	movl	$0, (%r15)
	movslq	%r12d, %r13
	movl	%edi, (%r15,%r13,4)
	leaq	(,%r13,4), %rdi
	vzeroupper
	callq	_malloc
	testq	%rax, %rax
	je	LBB0_51
## %bb.45:
	movq	%rax, %r14
	testl	%r12d, %r12d
	jle	LBB0_47
## %bb.46:
	movl	%r12d, %edx
	shlq	$2, %rdx
	movq	%r14, %rdi
	movl	$255, %esi
	callq	_memset
LBB0_47:
	movq	%r12, %rbx
	movl	$4, %esi
	movq	%r13, %rdi
	callq	_calloc
	testq	%rax, %rax
	je	LBB0_48
## %bb.53:
	movq	%rax, %r12
	movl	$4, %esi
	movq	%r13, %rdi
	callq	_calloc
	testq	%rax, %rax
	je	LBB0_56
## %bb.54:
	testl	%ebx, %ebx
	jle	LBB0_70
## %bb.55:
	movl	(%r15), %r11d
	movl	%ebx, %r9d
	movq	16(%rbp), %rcx
	leaq	4(%rcx), %rcx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	xorl	%r10d, %r10d
	.p2align	4, 0x90
LBB0_58:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_65 Depth 2
	movq	%r10, %rdi
	movl	%r11d, %edx
	leaq	1(%r10), %r10
	movl	4(%r15,%rdi,4), %r11d
	movl	%r11d, %ecx
	subl	%edx, %ecx
	movslq	%ecx, %rcx
	addl	$1, (%rax,%rcx,4)
	movl	%r11d, %esi
	subl	%edx, %esi
	jle	LBB0_57
## %bb.59:                              ##   in Loop: Header=BB0_58 Depth=1
	movslq	%r11d, %r8
	movslq	%edx, %r13
	movq	%r13, %rdx
	notq	%rdx
	testb	$1, %sil
	je	LBB0_63
## %bb.60:                              ##   in Loop: Header=BB0_58 Depth=1
	movq	16(%rbp), %rcx
	movl	(%rcx,%r13,4), %ecx
	movl	%ecx, %esi
	sarl	$31, %esi
	shrl	$28, %esi
	addl	%ecx, %esi
	sarl	$4, %esi
	movslq	%esi, %rsi
	movl	(%r14,%rsi,4), %ecx
	testl	%ecx, %ecx
	js	LBB0_62
## %bb.61:                              ##   in Loop: Header=BB0_58 Depth=1
	movl	%edi, %ebx
	subl	%ecx, %ebx
	movslq	%ebx, %rcx
	addl	$1, (%r12,%rcx,4)
LBB0_62:                                ##   in Loop: Header=BB0_58 Depth=1
	movl	%edi, (%r14,%rsi,4)
	addq	$1, %r13
LBB0_63:                                ##   in Loop: Header=BB0_58 Depth=1
	addq	%r8, %rdx
	je	LBB0_57
## %bb.64:                              ##   in Loop: Header=BB0_58 Depth=1
	subq	%r13, %r8
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	leaq	(%rcx,%r13,4), %r13
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB0_65:                                ##   Parent Loop BB0_58 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-4(%r13,%rdx,4), %ecx
	movl	%ecx, %ebx
	sarl	$31, %ebx
	shrl	$28, %ebx
	addl	%ecx, %ebx
	sarl	$4, %ebx
	movslq	%ebx, %rcx
	movl	(%r14,%rcx,4), %ebx
	testl	%ebx, %ebx
	js	LBB0_67
## %bb.66:                              ##   in Loop: Header=BB0_65 Depth=2
	movl	%edi, %esi
	subl	%ebx, %esi
	movslq	%esi, %rsi
	addl	$1, (%r12,%rsi,4)
LBB0_67:                                ##   in Loop: Header=BB0_65 Depth=2
	movl	%edi, (%r14,%rcx,4)
	movl	(%r13,%rdx,4), %ecx
	movl	%ecx, %esi
	sarl	$31, %esi
	shrl	$28, %esi
	addl	%ecx, %esi
	sarl	$4, %esi
	movslq	%esi, %rcx
	movl	(%r14,%rcx,4), %ebx
	testl	%ebx, %ebx
	js	LBB0_69
## %bb.68:                              ##   in Loop: Header=BB0_65 Depth=2
	movl	%edi, %esi
	subl	%ebx, %esi
	movslq	%esi, %rsi
	addl	$1, (%r12,%rsi,4)
LBB0_69:                                ##   in Loop: Header=BB0_65 Depth=2
	movl	%edi, (%r14,%rcx,4)
	addq	$2, %rdx
	cmpq	%rdx, %r8
	jne	LBB0_65
LBB0_57:                                ##   in Loop: Header=BB0_58 Depth=1
	cmpq	%r9, %r10
	jne	LBB0_58
LBB0_70:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_25:
	leaq	-1(%rsi), %rcx
	leal	-2(%r12), %r8d
	movl	%r8d, %ebx
	subl	%ecx, %ebx
	movl	$4, %edx
	movq	%rcx, %rax
	mulq	%rdx
	seto	%dl
	cmpl	%r8d, %ebx
	jg	LBB0_20
## %bb.26:
	shrq	$32, %rcx
	jne	LBB0_20
## %bb.27:
	leaq	(%r15,%rsi,4), %rcx
	cmpq	%rcx, %rax
	ja	LBB0_20
## %bb.28:
	testb	%dl, %dl
	jne	LBB0_20
## %bb.29:
	movslq	%r12d, %r10
	leaq	(%r15,%r10,4), %rcx
	addq	$-8, %rcx
	cmpq	%rcx, %rax
	ja	LBB0_20
## %bb.30:
	testb	%dl, %dl
	jne	LBB0_20
## %bb.31:
	leaq	4(%r15), %rax
	leaq	(%r15,%r10,4), %rcx
	addq	$-4, %rcx
	cmpq	%rcx, %rax
	jae	LBB0_33
## %bb.32:
	leaq	(%r15,%rsi,4), %rax
	addq	$4, %rax
	leaq	-1(%r10), %rcx
	subq	%rsi, %rcx
	leaq	(%r15,%rcx,4), %rcx
	cmpq	%rax, %rcx
	jb	LBB0_20
LBB0_33:
	movq	%rsi, %r8
	andq	$-64, %r8
	leaq	-64(%r8), %rax
	movq	%rax, %rcx
	shrq	$6, %rcx
	addq	$1, %rcx
	movl	%ecx, %r9d
	andl	$1, %r9d
	testq	%rax, %rax
	je	LBB0_34
## %bb.35:
	leaq	(%r15,%rsi,4), %rax
	addq	$-60, %rax
	leal	-66(%r12), %r11d
	addq	$-2, %r10
	movl	$1, %ebx
	subq	%rcx, %rbx
	leaq	(%r9,%rbx), %rcx
	addq	$-1, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB0_36:                                ## =>This Inner Loop Header: Depth=1
	leal	(%r10,%rbx), %edx
	movslq	%edx, %rdx
	vmovups	-252(%r15,%rdx,4), %zmm0
	vmovups	-188(%r15,%rdx,4), %zmm1
	vmovups	-124(%r15,%rdx,4), %zmm2
	vmovups	-60(%r15,%rdx,4), %zmm3
	vmovups	%zmm3, (%rax,%rbx,4)
	vmovups	%zmm2, -64(%rax,%rbx,4)
	vmovups	%zmm1, -128(%rax,%rbx,4)
	vmovups	%zmm0, -192(%rax,%rbx,4)
	leal	(%r11,%rbx), %edx
	movslq	%edx, %rdx
	vmovups	-252(%r15,%rdx,4), %zmm0
	vmovups	-188(%r15,%rdx,4), %zmm1
	vmovups	-124(%r15,%rdx,4), %zmm2
	vmovups	-60(%r15,%rdx,4), %zmm3
	vmovups	%zmm3, -256(%rax,%rbx,4)
	vmovups	%zmm2, -320(%rax,%rbx,4)
	vmovups	%zmm1, -384(%rax,%rbx,4)
	vmovups	%zmm0, -448(%rax,%rbx,4)
	addq	$-128, %rbx
	addq	$2, %rcx
	jne	LBB0_36
## %bb.37:
	negq	%rbx
	testq	%r9, %r9
	je	LBB0_40
LBB0_39:
	movq	%rsi, %rax
	subq	%rbx, %rax
	movl	%r12d, %ecx
	subl	%ebx, %ecx
	movslq	%ecx, %rcx
	vmovups	-260(%r15,%rcx,4), %zmm0
	vmovups	-196(%r15,%rcx,4), %zmm1
	vmovups	-132(%r15,%rcx,4), %zmm2
	vmovups	-68(%r15,%rcx,4), %zmm3
	vmovups	%zmm3, -60(%r15,%rax,4)
	vmovups	%zmm2, -124(%r15,%rax,4)
	vmovups	%zmm1, -188(%r15,%rax,4)
	vmovups	%zmm0, -252(%r15,%rax,4)
LBB0_40:
	cmpq	%rsi, %r8
	je	LBB0_44
## %bb.41:
	subq	%r8, %rsi
	movl	%r12d, %eax
	subl	%r8d, %eax
	jmp	LBB0_42
LBB0_34:
	xorl	%ebx, %ebx
	testq	%r9, %r9
	jne	LBB0_39
	jmp	LBB0_40
LBB0_51:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str(%rip), %rdi
	movl	$40, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB0_48:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.1(%rip), %rdi
	movl	$45, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB0_56:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.2(%rip), %rdi
	movl	$36, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
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
	subq	$136, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %r15d
	movq	%r8, -96(%rbp)          ## 8-byte Spill
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	movq	%rdx, %r12
	movq	%rsi, %r13
	movq	%rdi, %r14
	movq	16(%rbp), %r8
	testl	%r9d, %r9d
	jle	LBB1_3
## %bb.1:
	movl	(%r14), %ebx
	movl	%r15d, %r9d
	cmpl	$64, %r15d
	jae	LBB1_4
## %bb.2:
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	LBB1_11
LBB1_3:
	xorl	%ecx, %ecx
	jmp	LBB1_13
LBB1_4:
	movl	%r9d, %edx
	andl	$-64, %edx
	vpbroadcastd	%ebx, %zmm0
	leaq	-64(%rdx), %rsi
	movq	%rsi, %rax
	shrq	$6, %rax
	addq	$1, %rax
	movl	%eax, %edi
	andl	$1, %edi
	testq	%rsi, %rsi
	je	LBB1_78
## %bb.5:
	movl	$1, %esi
	subq	%rax, %rsi
	leaq	(%rdi,%rsi), %rax
	addq	$-1, %rax
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%esi, %esi
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	.p2align	4, 0x90
LBB1_6:                                 ## =>This Inner Loop Header: Depth=1
	vmovdqu64	4(%r14,%rsi,4), %zmm5
	vmovdqu64	68(%r14,%rsi,4), %zmm6
	vmovdqu64	132(%r14,%rsi,4), %zmm7
	vmovdqu64	196(%r14,%rsi,4), %zmm8
	valignd	$15, %zmm0, %zmm5, %zmm0 ## zmm0 = zmm0[15],zmm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm5, %zmm6, %zmm9 ## zmm9 = zmm5[15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm6, %zmm7, %zmm10 ## zmm10 = zmm6[15],zmm7[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm7, %zmm8, %zmm11 ## zmm11 = zmm7[15],zmm8[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	vpsubd	%zmm0, %zmm5, %zmm0
	vpmaxsd	%zmm0, %zmm1, %zmm1
	vpsubd	%zmm9, %zmm6, %zmm0
	vpmaxsd	%zmm0, %zmm2, %zmm2
	vpsubd	%zmm10, %zmm7, %zmm0
	vpmaxsd	%zmm0, %zmm3, %zmm3
	vpsubd	%zmm11, %zmm8, %zmm0
	vpmaxsd	%zmm0, %zmm4, %zmm4
	vmovdqu64	260(%r14,%rsi,4), %zmm5
	vmovdqu64	324(%r14,%rsi,4), %zmm6
	vmovdqu64	388(%r14,%rsi,4), %zmm7
	vmovdqu64	452(%r14,%rsi,4), %zmm0
	valignd	$15, %zmm8, %zmm5, %zmm8 ## zmm8 = zmm8[15],zmm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm5, %zmm6, %zmm9 ## zmm9 = zmm5[15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm6, %zmm7, %zmm10 ## zmm10 = zmm6[15],zmm7[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm7, %zmm0, %zmm11 ## zmm11 = zmm7[15],zmm0[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	vpsubd	%zmm8, %zmm5, %zmm5
	vpmaxsd	%zmm5, %zmm1, %zmm1
	vpsubd	%zmm9, %zmm6, %zmm5
	vpmaxsd	%zmm5, %zmm2, %zmm2
	vpsubd	%zmm10, %zmm7, %zmm5
	vpmaxsd	%zmm5, %zmm3, %zmm3
	vpsubd	%zmm11, %zmm0, %zmm5
	vpmaxsd	%zmm5, %zmm4, %zmm4
	subq	$-128, %rsi
	addq	$2, %rax
	jne	LBB1_6
## %bb.7:
	testq	%rdi, %rdi
	je	LBB1_9
LBB1_8:
	shlq	$2, %rsi
	orq	$4, %rsi
	vmovdqu64	(%r14,%rsi), %zmm5
	vmovdqu64	64(%r14,%rsi), %zmm6
	vmovdqu64	128(%r14,%rsi), %zmm7
	vmovdqu64	192(%r14,%rsi), %zmm8
	valignd	$15, %zmm0, %zmm5, %zmm0 ## zmm0 = zmm0[15],zmm5[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm5, %zmm6, %zmm9 ## zmm9 = zmm5[15],zmm6[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm6, %zmm7, %zmm10 ## zmm10 = zmm6[15],zmm7[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	valignd	$15, %zmm7, %zmm8, %zmm11 ## zmm11 = zmm7[15],zmm8[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]
	vpsubd	%zmm0, %zmm5, %zmm0
	vpmaxsd	%zmm0, %zmm1, %zmm1
	vpsubd	%zmm9, %zmm6, %zmm0
	vpmaxsd	%zmm0, %zmm2, %zmm2
	vpsubd	%zmm10, %zmm7, %zmm0
	vpmaxsd	%zmm0, %zmm3, %zmm3
	vpsubd	%zmm11, %zmm8, %zmm0
	vpmaxsd	%zmm0, %zmm4, %zmm4
	vmovdqa64	%zmm8, %zmm0
LBB1_9:
	vpmaxsd	%zmm2, %zmm1, %zmm1
	vpmaxsd	%zmm3, %zmm1, %zmm1
	vpmaxsd	%zmm4, %zmm1, %zmm1
	vextracti64x4	$1, %zmm1, %ymm2
	vpmaxsd	%zmm2, %zmm1, %zmm1
	vextracti128	$1, %ymm1, %xmm2
	vpmaxsd	%zmm2, %zmm1, %zmm1
	vpshufd	$78, %xmm1, %xmm2       ## xmm2 = xmm1[2,3,0,1]
	vpmaxsd	%zmm2, %zmm1, %zmm1
	vpshufd	$229, %xmm1, %xmm2      ## xmm2 = xmm1[1,1,2,3]
	vpmaxsd	%zmm2, %zmm1, %zmm1
	vmovd	%xmm1, %ecx
	cmpq	%r9, %rdx
	je	LBB1_13
## %bb.10:
	vextracti32x4	$3, %zmm0, %xmm0
	vpextrd	$3, %xmm0, %ebx
LBB1_11:
	subq	%rdx, %r9
	leaq	(%r14,%rdx,4), %rdx
	addq	$4, %rdx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB1_12:                                ## =>This Inner Loop Header: Depth=1
	movl	(%rdx,%rsi,4), %eax
	movl	%eax, %edi
	subl	%ebx, %edi
	cmpl	%edi, %ecx
	cmovll	%edi, %ecx
	addq	$1, %rsi
	movl	%eax, %ebx
	cmpq	%rsi, %r9
	jne	LBB1_12
LBB1_13:
	movl	%ecx, (%r8)
	movslq	%r15d, %rdx
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	movslq	%ecx, %rbx
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	imulq	%rdx, %rbx
	movl	$4, %esi
	movq	%rbx, %rdi
	vzeroupper
	callq	_calloc
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB1_80
## %bb.14:
	movl	%r15d, -44(%rbp)        ## 4-byte Spill
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB1_81
## %bb.15:
	cmpl	$0, -80(%rbp)           ## 4-byte Folded Reload
	jle	LBB1_24
## %bb.16:
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	jle	LBB1_40
## %bb.17:
	movl	-44(%rbp), %edx         ## 4-byte Reload
	shlq	$2, %rdx
	movq	%rax, %rdi
	movl	$255, %esi
	movq	%rdx, -64(%rbp)         ## 8-byte Spill
	callq	_memset
	cmpl	$1, -80(%rbp)           ## 4-byte Folded Reload
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	je	LBB1_24
## %bb.18:
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movl	%ecx, %eax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	leaq	-2(%rax), %rax
	leal	-1(%rcx), %ecx
	andl	$7, %ecx
	movq	%rcx, -112(%rbp)        ## 8-byte Spill
	movl	$1, %ebx
	cmpq	$7, %rax
	jb	LBB1_21
## %bb.19:
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	movq	%rcx, %rax
	shlq	$5, %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	leaq	(%rcx,%rcx,8), %rax
	leaq	(%rax,%rax,2), %rax
	addq	%rcx, %rax
	movq	%rax, -168(%rbp)        ## 8-byte Spill
	leaq	(,%rcx,8), %rax
	movq	%rax, -160(%rbp)        ## 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, -152(%rbp)        ## 8-byte Spill
	leaq	(,%rcx,4), %rax
	leaq	(%rax,%rax,4), %rsi
	movq	%rsi, -136(%rbp)        ## 8-byte Spill
	shlq	$4, %rcx
	movq	%rcx, -128(%rbp)        ## 8-byte Spill
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movq	-104(%rbp), %rax        ## 8-byte Reload
	subq	-112(%rbp), %rax        ## 8-byte Folded Reload
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	movl	$1, %ebx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB1_20:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, -176(%rbp)        ## 8-byte Spill
	movq	(%rdx), %rdi
	addq	-144(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rbx         ## 8-byte Reload
	movq	%rbx, %rdx
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-160(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	%rbx, %rdx
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-120(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	%rbx, %rdx
	movq	-176(%rbp), %rbx        ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-128(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-136(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-152(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-168(%rbp), %rdi        ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rdi
	addq	-88(%rbp), %rdi         ## 8-byte Folded Reload
	addq	%r15, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	addq	$8, %rbx
	addq	-88(%rbp), %r15         ## 8-byte Folded Reload
	cmpq	%rbx, -104(%rbp)        ## 8-byte Folded Reload
	jne	LBB1_20
LBB1_21:
	movq	-112(%rbp), %r15        ## 8-byte Reload
	testl	%r15d, %r15d
	je	LBB1_24
## %bb.22:
	movq	-72(%rbp), %rax         ## 8-byte Reload
	imulq	%rax, %rbx
	shlq	$2, %rbx
	leaq	(,%rax,4), %rax
	movq	%rax, -88(%rbp)         ## 8-byte Spill
	negq	%r15
	.p2align	4, 0x90
LBB1_23:                                ## =>This Inner Loop Header: Depth=1
	movq	(%rdx), %rdi
	addq	%rbx, %rdi
	movl	$255, %esi
	movq	-64(%rbp), %rdx         ## 8-byte Reload
	callq	_memset
	movq	-56(%rbp), %rdx         ## 8-byte Reload
	addq	-88(%rbp), %rbx         ## 8-byte Folded Reload
	incq	%r15
	jne	LBB1_23
LBB1_24:
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	jle	LBB1_40
## %bb.25:
	movl	(%r14), %edx
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movl	%eax, %r9d
	movl	%r9d, %ecx
	andl	$1, %ecx
	cmpl	$1, %eax
	movq	%rcx, -64(%rbp)         ## 8-byte Spill
	jne	LBB1_27
## %bb.26:
	xorl	%r15d, %r15d
	cmpq	$0, -64(%rbp)           ## 8-byte Folded Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	je	LBB1_40
LBB1_37:
	cmpl	4(%r14,%r15,4), %edx
	jge	LBB1_40
## %bb.38:
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rcx
	movslq	%edx, %rdx
	movq	%r15, %rsi
	.p2align	4, 0x90
LBB1_39:                                ## =>This Inner Loop Header: Depth=1
	movl	(%r12,%rdx,4), %edi
	movl	%edi, (%rax,%rsi,4)
	movl	(%r13,%rdx,4), %edi
	movl	%edi, (%rcx,%rsi,4)
	addq	$1, %rdx
	movslq	4(%r14,%r15,4), %rdi
	addq	%rbx, %rsi
	cmpq	%rdi, %rdx
	jl	LBB1_39
	jmp	LBB1_40
LBB1_27:
	subq	%rcx, %r9
	movq	-72(%rbp), %rax         ## 8-byte Reload
	leaq	(,%rax,4), %rsi
	movl	$4, %r10d
	xorl	%r8d, %r8d
	xorl	%r15d, %r15d
	movq	-56(%rbp), %r11         ## 8-byte Reload
	.p2align	4, 0x90
LBB1_28:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_30 Depth 2
                                        ##     Child Loop BB1_34 Depth 2
	movq	%r15, %rax
	orq	$1, %rax
	movl	(%r14,%rax,4), %ecx
	cmpl	%ecx, %edx
	jge	LBB1_32
## %bb.29:                              ##   in Loop: Header=BB1_28 Depth=1
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rbx
	movq	(%r11), %rdi
	movslq	%edx, %rdx
	movq	%r8, %r11
	.p2align	4, 0x90
LBB1_30:                                ##   Parent Loop BB1_28 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r12,%rdx,4), %ecx
	movl	%ecx, (%rbx,%r11)
	movl	(%r13,%rdx,4), %ecx
	movl	%ecx, (%rdi,%r11)
	addq	$1, %rdx
	movslq	(%r14,%rax,4), %rcx
	addq	%rsi, %r11
	cmpq	%rcx, %rdx
	jl	LBB1_30
## %bb.31:                              ##   in Loop: Header=BB1_28 Depth=1
	movq	-56(%rbp), %r11         ## 8-byte Reload
LBB1_32:                                ##   in Loop: Header=BB1_28 Depth=1
	movl	8(%r14,%r15,4), %edx
	cmpl	%edx, %ecx
	jge	LBB1_35
## %bb.33:                              ##   in Loop: Header=BB1_28 Depth=1
	movq	-96(%rbp), %rax         ## 8-byte Reload
	movq	(%rax), %rax
	movq	(%r11), %rdi
	movslq	%ecx, %rcx
	movq	%r10, %rbx
	.p2align	4, 0x90
LBB1_34:                                ##   Parent Loop BB1_28 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r12,%rcx,4), %edx
	movl	%edx, (%rax,%rbx)
	movl	(%r13,%rcx,4), %edx
	movl	%edx, (%rdi,%rbx)
	addq	$1, %rcx
	movslq	8(%r14,%r15,4), %rdx
	addq	%rsi, %rbx
	cmpq	%rdx, %rcx
	jl	LBB1_34
LBB1_35:                                ##   in Loop: Header=BB1_28 Depth=1
	addq	$2, %r15
	addq	$8, %r8
	addq	$8, %r10
	addq	$-2, %r9
	jne	LBB1_28
## %bb.36:
	cmpq	$0, -64(%rbp)           ## 8-byte Folded Reload
	movq	-72(%rbp), %rbx         ## 8-byte Reload
	jne	LBB1_37
LBB1_40:
	leaq	(,%rbx,4), %r14
	movq	%r14, %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB1_79
## %bb.41:
	movq	%rax, %r12
	movl	24(%rbp), %ebx
	movl	-44(%rbp), %eax         ## 4-byte Reload
	testl	%eax, %eax
	jle	LBB1_43
## %bb.42:
	movl	%eax, %edx
	shlq	$2, %rdx
	movq	%r12, %rdi
	movl	$255, %esi
	callq	_memset
LBB1_43:
	movslq	%ebx, %rdi
	movl	$4, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB1_79
## %bb.44:
	cmpl	$0, -80(%rbp)           ## 4-byte Folded Reload
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	jle	LBB1_58
## %bb.45:
	cmpl	$0, -44(%rbp)           ## 4-byte Folded Reload
	jle	LBB1_58
## %bb.46:
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %r13
	movl	-44(%rbp), %r8d         ## 4-byte Reload
	movl	-80(%rbp), %r9d         ## 4-byte Reload
	xorl	%r10d, %r10d
	xorl	%r11d, %r11d
	.p2align	4, 0x90
LBB1_47:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_48 Depth 2
	movq	%r11, %r15
	imulq	%rdx, %r15
	movq	%r8, %rdi
	movq	%r10, %rsi
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB1_48:                                ##   Parent Loop BB1_47 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r13,%rsi,4), %ebx
	cmpl	$-1, %ebx
	je	LBB1_56
## %bb.49:                              ##   in Loop: Header=BB1_48 Depth=2
	movl	%ebx, %ecx
	sarl	$31, %ecx
	shrl	$28, %ecx
	addl	%ebx, %ecx
	sarl	$4, %ecx
	movslq	%ecx, %rbx
	movl	(%r12,%rbx,4), %ecx
	cmpl	$-1, %ecx
	je	LBB1_52
## %bb.50:                              ##   in Loop: Header=BB1_48 Depth=2
	notl	%ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	cmpq	%rcx, %rsi
	jl	LBB1_54
## %bb.53:                              ##   in Loop: Header=BB1_48 Depth=2
	addl	$1, (%rax,%rcx,4)
LBB1_54:                                ##   in Loop: Header=BB1_48 Depth=2
	movl	%esi, %ecx
	jmp	LBB1_55
	.p2align	4, 0x90
LBB1_52:                                ##   in Loop: Header=BB1_48 Depth=2
	leaq	(%rdx,%r15), %rcx
LBB1_55:                                ##   in Loop: Header=BB1_48 Depth=2
	movl	%ecx, (%r12,%rbx,4)
LBB1_56:                                ##   in Loop: Header=BB1_48 Depth=2
	addq	$1, %rdx
	addq	$1, %rsi
	addq	$-1, %rdi
	jne	LBB1_48
## %bb.57:                              ##   in Loop: Header=BB1_47 Depth=1
	addq	$1, %r11
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	addq	%rdx, %r10
	cmpq	%r9, %r11
	jne	LBB1_47
LBB1_58:
	movq	-80(%rbp), %rdx         ## 8-byte Reload
	testl	%edx, %edx
	movl	-44(%rbp), %eax         ## 4-byte Reload
	jle	LBB1_77
## %bb.59:
	testl	%eax, %eax
	jle	LBB1_77
## %bb.60:
	movq	-56(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %r10
	movl	%eax, %r15d
	movl	%edx, %r8d
	movl	%r15d, %esi
	andl	$3, %esi
	leaq	-1(%r15), %r9
	subq	%rsi, %r15
	xorl	%r11d, %r11d
	leaq	12(%r10), %rdx
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB1_61:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_62 Depth 2
                                        ##     Child Loop BB1_73 Depth 2
	xorl	%eax, %eax
	cmpq	$3, %r9
	jb	LBB1_71
	.p2align	4, 0x90
LBB1_62:                                ##   Parent Loop BB1_61 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-12(%rdx,%rax,4), %ecx
	cmpl	$-1, %ecx
	je	LBB1_67
## %bb.63:                              ##   in Loop: Header=BB1_62 Depth=2
	movl	-8(%rdx,%rax,4), %edi
	cmpl	$-1, %edi
	je	LBB1_68
LBB1_64:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	-4(%rdx,%rax,4), %ecx
	cmpl	$-1, %ecx
	je	LBB1_69
LBB1_65:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	(%rdx,%rax,4), %edi
	cmpl	$-1, %edi
	je	LBB1_70
LBB1_66:                                ##   in Loop: Header=BB1_62 Depth=2
	addq	$4, %rax
	cmpq	%rax, %r15
	jne	LBB1_62
	jmp	LBB1_71
	.p2align	4, 0x90
LBB1_67:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	%edi, -12(%rdx,%rax,4)
	movl	%edi, %ecx
	movl	-8(%rdx,%rax,4), %edi
	cmpl	$-1, %edi
	jne	LBB1_64
LBB1_68:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	%ecx, -8(%rdx,%rax,4)
	movl	%ecx, %edi
	movl	-4(%rdx,%rax,4), %ecx
	cmpl	$-1, %ecx
	jne	LBB1_65
LBB1_69:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	%edi, -4(%rdx,%rax,4)
	movl	%edi, %ecx
	movl	(%rdx,%rax,4), %edi
	cmpl	$-1, %edi
	jne	LBB1_66
LBB1_70:                                ##   in Loop: Header=BB1_62 Depth=2
	movl	%ecx, (%rdx,%rax,4)
	movl	%ecx, %edi
	addq	$4, %rax
	cmpq	%rax, %r15
	jne	LBB1_62
	.p2align	4, 0x90
LBB1_71:                                ##   in Loop: Header=BB1_61 Depth=1
	movl	%edi, %ebx
	testq	%rsi, %rsi
	je	LBB1_76
## %bb.72:                              ##   in Loop: Header=BB1_61 Depth=1
	leaq	(%r10,%rax,4), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB1_73:                                ##   Parent Loop BB1_61 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%rax,%rcx,4), %ebx
	cmpl	$-1, %ebx
	je	LBB1_75
## %bb.74:                              ##   in Loop: Header=BB1_73 Depth=2
	addq	$1, %rcx
	movl	%ebx, %edi
	cmpq	%rcx, %rsi
	jne	LBB1_73
	jmp	LBB1_76
	.p2align	4, 0x90
LBB1_75:                                ##   in Loop: Header=BB1_73 Depth=2
	movl	%edi, (%rax,%rcx,4)
	movl	%edi, %ebx
	addq	$1, %rcx
	movl	%ebx, %edi
	cmpq	%rcx, %rsi
	jne	LBB1_73
LBB1_76:                                ##   in Loop: Header=BB1_61 Depth=1
	addq	$1, %r11
	addq	%r14, %rdx
	addq	%r14, %r10
	movl	%ebx, %edi
	cmpq	%r8, %r11
	jne	LBB1_61
LBB1_77:
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_78:
	vpxor	%xmm1, %xmm1, %xmm1
	xorl	%esi, %esi
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	vpxor	%xmm4, %xmm4, %xmm4
	testq	%rdi, %rdi
	jne	LBB1_8
	jmp	LBB1_9
LBB1_79:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.5(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_80:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB1_81:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.4(%rip), %rdi
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
	subq	$72, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%r9d, %ebx
	movq	%r8, %r15
	movq	%rcx, -96(%rbp)         ## 8-byte Spill
	movq	%rdx, -72(%rbp)         ## 8-byte Spill
	movq	%rsi, %r12
	movq	%rdi, -64(%rbp)         ## 8-byte Spill
	movq	24(%rbp), %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	16(%rbp), %rax
	movq	%rax, -104(%rbp)        ## 8-byte Spill
	leal	-1(%rbx,%rbx), %eax
	movl	%eax, -84(%rbp)         ## 4-byte Spill
	movslq	%eax, %rdi
	movl	$4, %esi
	callq	_calloc
	testq	%rax, %rax
	je	LBB2_1
## %bb.3:
	movq	%rax, %r14
	movq	%r15, -80(%rbp)         ## 8-byte Spill
	callq	_clock
	testl	%ebx, %ebx
	movq	%rbx, -56(%rbp)         ## 8-byte Spill
	jle	LBB2_4
## %bb.7:
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movl	(%rax), %r10d
	movl	%ebx, %r8d
	xorl	%r9d, %r9d
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB2_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_12 Depth 2
                                        ##     Child Loop BB2_14 Depth 2
	movq	%r9, %rsi
	movl	%r10d, %edx
	leaq	1(%r9), %r9
	movq	-64(%rbp), %rax         ## 8-byte Reload
	movl	4(%rax,%rsi,4), %r10d
	cmpl	%r10d, %edx
	jge	LBB2_8
## %bb.10:                              ##   in Loop: Header=BB2_9 Depth=1
	movslq	%r10d, %rdi
	notl	%esi
	addl	-56(%rbp), %esi         ## 4-byte Folded Reload
	movslq	%edx, %rax
	movl	%r10d, %ecx
	subl	%edx, %ecx
	movq	%rax, %r11
	notq	%r11
	addq	%rdi, %r11
	andq	$3, %rcx
	je	LBB2_13
## %bb.11:                              ##   in Loop: Header=BB2_9 Depth=1
	negq	%rcx
	.p2align	4, 0x90
LBB2_12:                                ##   Parent Loop BB2_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r12,%rax,4), %ebx
	addl	%esi, %ebx
	movslq	%ebx, %rbx
	movl	(%r14,%rbx,4), %edx
	leal	1(%rdx), %r13d
	movl	%r13d, (%r14,%rbx,4)
	cmpl	$1, %edx
	adcl	$0, %r15d
	addq	$1, %rax
	incq	%rcx
	jne	LBB2_12
LBB2_13:                                ##   in Loop: Header=BB2_9 Depth=1
	cmpq	$3, %r11
	jb	LBB2_8
	.p2align	4, 0x90
LBB2_14:                                ##   Parent Loop BB2_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	(%r12,%rax,4), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, (%r14,%rcx,4)
	cmpl	$1, %edx
	adcl	$0, %r15d
	movl	4(%r12,%rax,4), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, (%r14,%rcx,4)
	cmpl	$1, %edx
	adcl	$0, %r15d
	movl	8(%r12,%rax,4), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, (%r14,%rcx,4)
	cmpl	$1, %edx
	adcl	$0, %r15d
	movl	12(%r12,%rax,4), %ecx
	addl	%esi, %ecx
	movslq	%ecx, %rcx
	movl	(%r14,%rcx,4), %edx
	leal	1(%rdx), %ebx
	movl	%ebx, (%r14,%rcx,4)
	cmpl	$1, %edx
	adcl	$0, %r15d
	addq	$4, %rax
	cmpq	%rdi, %rax
	jl	LBB2_14
LBB2_8:                                 ##   in Loop: Header=BB2_9 Depth=1
	cmpq	%r8, %r9
	jne	LBB2_9
	jmp	LBB2_5
LBB2_4:
	xorl	%r15d, %r15d
LBB2_5:
	movq	-104(%rbp), %rax        ## 8-byte Reload
	movl	%r15d, (%rax)
	movslq	%r15d, %r13
	leaq	(,%r13,4), %rdi
	callq	_malloc
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB2_6
## %bb.15:
	movl	-84(%rbp), %ecx         ## 4-byte Reload
	movl	%ecx, %r8d
	shrl	$31, %r8d
	addl	%ecx, %r8d
	sarl	%r8d
	negl	%r8d
	movl	%r8d, %edi
	negl	%edi
	cmovll	%r8d, %edi
	testl	%ecx, %ecx
	jle	LBB2_27
## %bb.16:
	cmpl	$1, %ecx
	jne	LBB2_18
## %bb.17:
	xorl	%edx, %edx
	xorl	%esi, %esi
	cmpl	$0, (%r14,%rdx,4)
	jne	LBB2_26
	jmp	LBB2_27
LBB2_18:
	movl	%edi, %r11d
	movl	%ecx, %r9d
	movl	%r8d, %r10d
	movl	%r8d, %edi
	notl	%edi
	addq	$-1, %r9
	xorl	%edx, %edx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_19:                                ## =>This Inner Loop Header: Depth=1
	cmpl	$0, (%r14,%rdx,4)
	je	LBB2_21
## %bb.20:                              ##   in Loop: Header=BB2_19 Depth=1
	leaq	(%r10,%rdx), %rbx
	movslq	%esi, %rcx
	addl	$1, %esi
	movl	%ebx, (%rax,%rcx,4)
	leal	1(%rdi), %ecx
	testl	%ebx, %ebx
	cmovnsl	%ebx, %ecx
	cmpl	%ecx, %r11d
	cmovgl	%ecx, %r11d
LBB2_21:                                ##   in Loop: Header=BB2_19 Depth=1
	cmpl	$0, 4(%r14,%rdx,4)
	je	LBB2_23
## %bb.22:                              ##   in Loop: Header=BB2_19 Depth=1
	leaq	(%r10,%rdx), %rcx
	addq	$1, %rcx
	movslq	%esi, %rbx
	addl	$1, %esi
	movl	%ecx, (%rax,%rbx,4)
	testl	%ecx, %ecx
	cmovsl	%edi, %ecx
	cmpl	%ecx, %r11d
	cmovlel	%r11d, %ecx
	movl	%ecx, %r11d
LBB2_23:                                ##   in Loop: Header=BB2_19 Depth=1
	addq	$2, %rdx
	addl	$-2, %edi
	cmpq	%rdx, %r9
	jne	LBB2_19
## %bb.24:
	addl	%edx, %r8d
	movl	%r11d, %edi
	cmpl	$0, (%r14,%rdx,4)
	je	LBB2_27
LBB2_26:
	movslq	%esi, %rcx
	movl	%r8d, (%rax,%rcx,4)
	movl	%r8d, %eax
	negl	%eax
	cmovll	%r8d, %eax
	cmpl	%eax, %edi
	cmovgl	%eax, %edi
LBB2_27:
	movq	-56(%rbp), %rbx         ## 8-byte Reload
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	%ebx, %eax
	movl	%edi, -48(%rbp)         ## 4-byte Spill
	subl	%edi, %eax
	movl	%eax, (%rcx)
	movslq	%eax, %rdi
	imulq	%r13, %rdi
	movl	$4, %esi
	callq	_calloc
	movq	-80(%rbp), %rcx         ## 8-byte Reload
	movq	%rax, (%rcx)
	testq	%rax, %rax
	je	LBB2_48
## %bb.28:
	testl	%ebx, %ebx
	movq	-72(%rbp), %r8          ## 8-byte Reload
	movl	-48(%rbp), %esi         ## 4-byte Reload
	jle	LBB2_33
## %bb.29:
	testl	%r15d, %r15d
	jle	LBB2_33
## %bb.30:
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx), %r10d
	movl	%ebx, %ecx
	movq	%rcx, -80(%rbp)         ## 8-byte Spill
	movslq	%ebx, %rdx
	shlq	$2, %rdx
	movslq	%esi, %rcx
	shlq	$2, %rcx
	subq	%rcx, %rdx
	xorl	%r15d, %r15d
	.p2align	4, 0x90
LBB2_31:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_36 Depth 2
                                        ##     Child Loop BB2_41 Depth 2
                                        ##       Child Loop BB2_42 Depth 3
                                        ##       Child Loop BB2_45 Depth 3
	movl	%r10d, %esi
	leaq	1(%r15), %rcx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	movq	-64(%rbp), %rcx         ## 8-byte Reload
	movl	4(%rcx,%r15,4), %r10d
	cmpl	%r10d, %esi
	jge	LBB2_32
## %bb.34:                              ##   in Loop: Header=BB2_31 Depth=1
	movslq	%r10d, %r11
	movslq	%esi, %r14
	movq	-96(%rbp), %rcx         ## 8-byte Reload
	movq	(%rcx), %rcx
	movl	%r10d, %edi
	subl	%esi, %edi
	movq	%r14, %r9
	notq	%r9
	testb	$1, %dil
	je	LBB2_40
## %bb.35:                              ##   in Loop: Header=BB2_31 Depth=1
	movl	(%r12,%r14,4), %ebx
	subl	%r15d, %ebx
	movq	%rax, %rdi
	xorl	%r8d, %r8d
	.p2align	4, 0x90
LBB2_36:                                ##   Parent Loop BB2_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	cmpl	(%rcx,%r8,4), %ebx
	je	LBB2_38
## %bb.37:                              ##   in Loop: Header=BB2_36 Depth=2
	addq	$1, %r8
	addq	%rdx, %rdi
	cmpq	%r13, %r8
	jl	LBB2_36
	jmp	LBB2_39
LBB2_38:                                ##   in Loop: Header=BB2_31 Depth=1
	sarl	$31, %ebx
	andl	-48(%rbp), %ebx         ## 4-byte Folded Reload
	movq	-72(%rbp), %rsi         ## 8-byte Reload
	movl	(%rsi,%r14,4), %r8d
	movslq	%ebx, %rbx
	shlq	$2, %rbx
	subq	%rbx, %rdi
	movl	%r8d, (%rdi)
LBB2_39:                                ##   in Loop: Header=BB2_31 Depth=1
	addq	$1, %r14
	movq	-72(%rbp), %r8          ## 8-byte Reload
LBB2_40:                                ##   in Loop: Header=BB2_31 Depth=1
	addq	%r11, %r9
	movl	-48(%rbp), %r9d         ## 4-byte Reload
	je	LBB2_32
	.p2align	4, 0x90
LBB2_41:                                ##   Parent Loop BB2_31 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_42 Depth 3
                                        ##       Child Loop BB2_45 Depth 3
	movl	(%r12,%r14,4), %ebx
	subl	%r15d, %ebx
	movq	%rax, %rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_42:                                ##   Parent Loop BB2_31 Depth=1
                                        ##     Parent Loop BB2_41 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	(%rcx,%rsi,4), %ebx
	je	LBB2_43
## %bb.47:                              ##   in Loop: Header=BB2_42 Depth=3
	addq	$1, %rsi
	addq	%rdx, %rdi
	cmpq	%r13, %rsi
	jl	LBB2_42
	jmp	LBB2_44
	.p2align	4, 0x90
LBB2_43:                                ##   in Loop: Header=BB2_41 Depth=2
	sarl	$31, %ebx
	andl	%r9d, %ebx
	movl	(%r8,%r14,4), %esi
	movslq	%ebx, %rbx
	shlq	$2, %rbx
	subq	%rbx, %rdi
	movl	%esi, (%rdi)
LBB2_44:                                ##   in Loop: Header=BB2_41 Depth=2
	movl	4(%r12,%r14,4), %ebx
	subl	%r15d, %ebx
	movq	%rax, %rdi
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB2_45:                                ##   Parent Loop BB2_31 Depth=1
                                        ##     Parent Loop BB2_41 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	cmpl	(%rcx,%rsi,4), %ebx
	je	LBB2_49
## %bb.46:                              ##   in Loop: Header=BB2_45 Depth=3
	addq	$1, %rsi
	addq	%rdx, %rdi
	cmpq	%r13, %rsi
	jl	LBB2_45
## %bb.50:                              ##   in Loop: Header=BB2_41 Depth=2
	addq	$2, %r14
	cmpq	%r11, %r14
	jl	LBB2_41
	jmp	LBB2_32
	.p2align	4, 0x90
LBB2_49:                                ##   in Loop: Header=BB2_41 Depth=2
	sarl	$31, %ebx
	andl	%r9d, %ebx
	movl	4(%r8,%r14,4), %esi
	movslq	%ebx, %rbx
	shlq	$2, %rbx
	subq	%rbx, %rdi
	movl	%esi, (%rdi)
	addq	$2, %r14
	cmpq	%r11, %r14
	jl	LBB2_41
	.p2align	4, 0x90
LBB2_32:                                ##   in Loop: Header=BB2_31 Depth=1
	addq	$4, %rax
	movq	-56(%rbp), %r15         ## 8-byte Reload
	cmpq	-80(%rbp), %r15         ## 8-byte Folded Reload
	jne	LBB2_31
LBB2_33:
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	jmp	_clock                  ## TAILCALL
LBB2_1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.6(%rip), %rdi
	movl	$35, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB2_6:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.7(%rip), %rdi
	movl	$39, %esi
	movl	$1, %edx
	callq	_fwrite
	movl	$1, %edi
	callq	_exit
LBB2_48:
	movq	___stderrp@GOTPCREL(%rip), %r14
	movq	(%r14), %rcx
	leaq	L_.str.8(%rip), %rdi
	movl	$37, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edi
	callq	_strerror
	leaq	L_.str.9(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	(%r14), %rbx
	callq	___error
	movl	(%rax), %edx
	leaq	L_.str.10(%rip), %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %edi
	callq	_exit
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"couldn't allocate last_used using malloc"

L_.str.1:                               ## @.str.1
	.asciz	"couldn't allocate reuse_distance using malloc"

L_.str.2:                               ## @.str.2
	.asciz	"couldn't allocate elems using calloc"

L_.str.3:                               ## @.str.3
	.asciz	"couldn't allocate ell_data using calloc"

L_.str.4:                               ## @.str.4
	.asciz	"couldn't allocate indices using malloc"

L_.str.5:                               ## @.str.5
	.asciz	"couldn't allocate x used using malloc"

L_.str.6:                               ## @.str.6
	.asciz	"couldn't allocate ind using calloc\n"

L_.str.7:                               ## @.str.7
	.asciz	"couldn't allocate *offset using malloc\n"

L_.str.8:                               ## @.str.8
	.asciz	"couldn't allocate *data using calloc\n"

L_.str.9:                               ## @.str.9
	.asciz	"%s\n"

L_.str.10:                              ## @.str.10
	.asciz	"%d\n"


.subsections_via_symbols
