	.file	"conversions.c"
	.text
	.p2align 4,,15
	.globl	coo_csr
	.type	coo_csr, @function
coo_csr:
.LFB35:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%r9, %rbx
	movq	40(%rsp), %r10
	movq	32(%rsp), %r9
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %esi
	movq	%rdx, %rax
	leaq	4(%rdx,%rsi,4), %rdi
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	(%rax), %rsi
	addq	$4, %rax
	addl	$1, (%rbx,%rsi,4)
	cmpq	%rdi, %rax
	jne	.L3
	testl	%ebp, %ebp
	jle	.L10
.L9:
	xorl	%eax, %eax
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%rbx,%rax,4), %edi
	movl	%esi, (%rbx,%rax,4)
	addq	$1, %rax
	addl	%edi, %esi
	cmpl	%eax, %ebp
	jg	.L5
	testl	%r12d, %r12d
	jle	.L6
.L10:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movslq	(%rdx,%rax,4), %rsi
	movl	(%rcx,%rax,4), %r11d
	movsd	(%r8,%rax,8), %xmm0
	addq	$1, %rax
	leaq	(%rbx,%rsi,4), %rsi
	movslq	(%rsi), %rdi
	movl	%r11d, (%r9,%rdi,4)
	movsd	%xmm0, (%r10,%rdi,8)
	addl	$1, (%rsi)
	cmpl	%eax, %r12d
	jg	.L7
.L6:
	leal	-1(%rbp), %edi
	testl	%edi, %edi
	jle	.L8
	leal	-2(%rbp), %edx
	movslq	%edi, %rdi
	leaq	0(,%rdi,4), %rax
	movq	%rdx, %rdi
	leaq	4(,%rdx,4), %rdx
	negq	%rdi
	salq	$2, %rdi
	leaq	-4(%rax,%rdi), %rsi
	addq	%rax, %rdi
	addq	%rbx, %rsi
	addq	%rbx, %rdi
	call	memmove
.L8:
	movl	$0, (%rbx)
	movl	%r12d, (%rbx,%rbp,4)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	testl	%ebp, %ebp
	jg	.L9
	jmp	.L6
	.cfi_endproc
.LFE35:
	.size	coo_csr, .-coo_csr
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"couldn't allocate ell_data using malloc"
	.align 8
.LC1:
	.string	"couldn't allocate indices using malloc"
	.text
	.p2align 4,,15
	.globl	csr_ell
	.type	csr_ell, @function
csr_ell:
.LFB36:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movslq	%r9d, %rax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rax, %r15
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rax, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rsi, 32(%rsp)
	movq	%rdx, 40(%rsp)
	testl	%eax, %eax
	jle	.L33
	leal	-1(%rax), %eax
	movl	%eax, 8(%rsp)
	cmpl	$2, %eax
	jbe	.L34
	movl	%ebx, %edx
	movq	%rdi, %rax
	pxor	%xmm2, %xmm2
	shrl	$2, %edx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L21:
	movdqu	4(%rax), %xmm0
	movdqu	(%rax), %xmm4
	addq	$16, %rax
	psubd	%xmm4, %xmm0
	movdqa	%xmm0, %xmm1
	pcmpgtd	%xmm2, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	movdqa	%xmm1, %xmm2
	por	%xmm0, %xmm2
	cmpq	%rdx, %rax
	jne	.L21
	movdqa	%xmm2, %xmm0
	movl	%ebx, %eax
	psrldq	$8, %xmm0
	andl	$-4, %eax
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm3
	pcmpgtd	%xmm2, %xmm1
	movdqa	%xmm1, %xmm0
	pand	%xmm1, %xmm3
	pandn	%xmm2, %xmm0
	por	%xmm3, %xmm0
	movdqa	%xmm0, %xmm2
	psrldq	$4, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	por	%xmm2, %xmm1
	movd	%xmm1, %ebp
	cmpl	%ebx, %eax
	je	.L22
.L20:
	movslq	%eax, %rdx
	movl	8(%rsp), %r10d
	leal	1(%rax), %ecx
	salq	$2, %rdx
	leaq	(%r14,%rdx), %rdi
	cmpl	%r10d, %ecx
	jge	.L35
	cmpl	%ebx, %eax
	jge	.L35
	movl	4(%r14,%rdx), %esi
	movl	%esi, %ecx
	subl	(%rdi), %ecx
	movl	8(%r14,%rdx), %edi
	cmpl	%ebp, %ecx
	cmovge	%ecx, %ebp
	movl	%edi, %ecx
	subl	%esi, %ecx
	leal	3(%rax), %esi
	cmpl	%ebp, %ecx
	cmovge	%ecx, %ebp
	leal	2(%rax), %ecx
	cmpl	%esi, %r10d
	jg	.L47
.L23:
	movslq	%ecx, %rax
	addq	$1, %rax
	leaq	0(,%rax,4), %rsi
	movl	(%r14,%rax,4), %edx
	subl	-4(%r14,%rsi), %edx
	cmpl	%edx, %ebp
	cmovl	%edx, %ebp
	leal	1(%rcx), %edx
	cmpl	%edx, %ebx
	jle	.L22
	movl	4(%r14,%rsi), %edx
	subl	(%r14,%rax,4), %edx
	cmpl	%edx, %ebp
	cmovl	%edx, %ebp
	addl	$2, %ecx
	cmpl	%ebx, %ecx
	jge	.L22
	movl	8(%r14,%rsi), %eax
	subl	4(%r14,%rsi), %eax
	cmpl	%eax, %ebp
	cmovl	%eax, %ebp
.L22:
	movslq	%ebp, %rdx
	imulq	%r15, %rdx
.L19:
	movq	112(%rsp), %rax
	movq	%rdx, %rdi
	movl	$8, %esi
	movq	%rdx, 8(%rsp)
	movl	%ebp, (%rax)
	call	calloc
	movq	8(%rsp), %rdx
	testq	%rax, %rax
	movq	%rax, 16(%rsp)
	movq	%rax, (%r12)
	je	.L48
	movl	$4, %esi
	movq	%rdx, %rdi
	call	calloc
	movq	%rax, %r8
	movq	%rax, 24(%rsp)
	movq	%rax, 0(%r13)
	testq	%rax, %rax
	je	.L25
	testl	%ebp, %ebp
	jle	.L26
	testl	%ebx, %ebx
	jle	.L18
	movq	%r15, %rax
	salq	$2, %rax
	movq	%rax, %r13
	leal	-1(%rbx), %eax
	xorl	%ebx, %ebx
	movl	%eax, 8(%rsp)
	leaq	4(,%rax,4), %rax
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%r8, %rdi
	movq	%r15, %rdx
	movl	$255, %esi
	addl	$1, %ebx
	call	memset
	movq	%rax, %r8
	addq	%r13, %r8
	cmpl	%ebp, %ebx
	jne	.L28
.L29:
	movl	8(%rsp), %eax
	xorl	%ebx, %ebx
	leaq	4(%r14,%rax,4), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L31:
	movl	(%r14), %ecx
	movl	4(%r14), %eax
	cmpl	%eax, %ecx
	jge	.L32
	subl	%ecx, %eax
	movslq	%ebx, %r11
	movslq	%ecx, %r15
	leal	-1(%rax), %r8d
	movq	16(%rsp), %rax
	movq	%r11, %r12
	leaq	1(%r8), %r13
	leaq	(%rax,%r11,8), %rdi
	movq	40(%rsp), %rax
	leaq	0(,%r13,8), %rdx
	leaq	(%rax,%r15,8), %rsi
	call	memcpy
	movq	24(%rsp), %rax
	leaq	0(,%r13,4), %rdx
	leaq	(%rax,%r12,4), %rdi
	movq	32(%rsp), %rax
	leaq	(%rax,%r15,4), %rsi
	call	memcpy
.L32:
	addq	$4, %r14
	addl	%ebp, %ebx
	cmpq	8(%rsp), %r14
	jne	.L31
.L18:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L47:
	.cfi_restore_state
	movl	12(%r14,%rdx), %esi
	movl	%esi, %ecx
	subl	%edi, %ecx
	movl	16(%r14,%rdx), %edi
	cmpl	%ebp, %ecx
	cmovge	%ecx, %ebp
	movl	%edi, %ecx
	subl	%esi, %ecx
	leal	5(%rax), %esi
	cmpl	%ebp, %ecx
	cmovge	%ecx, %ebp
	leal	4(%rax), %ecx
	cmpl	%esi, %r10d
	jle	.L23
	movl	20(%r14,%rdx), %esi
	movl	24(%r14,%rdx), %edx
	movl	%esi, %ecx
	subl	%edi, %ecx
	cmpl	%ebp, %ecx
	cmovge	%ecx, %ebp
	subl	%esi, %edx
	leal	6(%rax), %ecx
	cmpl	%ebp, %edx
	cmovge	%edx, %ebp
	jmp	.L23
.L26:
	leal	-1(%rbx), %eax
	movl	%eax, 8(%rsp)
	testl	%ebx, %ebx
	jg	.L29
	jmp	.L18
.L33:
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	jmp	.L19
.L34:
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	jmp	.L20
.L35:
	movl	%eax, %ecx
	jmp	.L23
.L48:
	movl	$.LC0, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L25:
	movl	$.LC1, %edi
	movl	$38, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE36:
	.size	csr_ell, .-csr_ell
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"couldn't allocate ind using calloc\n"
	.align 8
.LC3:
	.string	"couldn't allocate *offset using malloc\n"
	.align 8
.LC4:
	.string	"couldn't allocate *data using calloc\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"%s\n"
.LC6:
	.string	"%d\n"
	.text
	.p2align 4,,15
	.globl	csr_dia
	.type	csr_dia, @function
csr_dia:
.LFB37:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%r9,%r9), %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	movslq	%eax, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	movl	$4, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movl	%r9d, (%rsp)
	movl	%eax, 36(%rsp)
	call	calloc
	testq	%rax, %rax
	je	.L50
	movq	%rax, %r15
	movslq	(%rsp), %rax
	movq	%rax, %r9
	movq	%rax, 8(%rsp)
	testl	%eax, %eax
	jle	.L92
	leal	-1(%rax), %r11d
	xorl	%r10d, %r10d
	leaq	4(%rbp), %rbx
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L56:
	movl	(%r12,%r10,4), %edi
	movl	4(%r12,%r10,4), %eax
	movl	%r10d, %ecx
	cmpl	%eax, %edi
	jge	.L53
	subl	$1, %eax
	movslq	%edi, %rsi
	subl	%edi, %eax
	leaq	0(%rbp,%rsi,4), %rdx
	addq	%rsi, %rax
	leaq	(%rbx,%rax,4), %rsi
	.p2align 4,,10
	.p2align 3
.L55:
	movl	(%rdx), %eax
	addl	%r9d, %eax
	subl	%ecx, %eax
	cltq
	leaq	-4(%r15,%rax,4), %rdi
	movl	(%rdi), %eax
	cmpl	$1, %eax
	leal	1(%rax), %r8d
	adcl	$0, %r14d
	addq	$4, %rdx
	movl	%r8d, (%rdi)
	cmpq	%rdx, %rsi
	jne	.L55
.L53:
	leaq	1(%r10), %rax
	cmpq	%r10, %r11
	je	.L93
	movq	%rax, %r10
	jmp	.L56
.L93:
	movq	8(%rsp), %rdx
	movslq	%r14d, %rax
	movq	%rax, (%rsp)
	leaq	0(,%rax,4), %rdi
	imulq	%rax, %rdx
.L52:
	movq	112(%rsp), %rax
	movq	%rdx, 40(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%r14d, (%rax)
	movq	120(%rsp), %rax
	movl	%r9d, (%rax)
	call	malloc
	movl	8(%rsp), %r9d
	movq	40(%rsp), %rdx
	movq	%rax, %rbx
	movq	16(%rsp), %rax
	testq	%rbx, %rbx
	movq	%rbx, (%rax)
	je	.L94
	movl	36(%rsp), %edi
	xorl	%ecx, %ecx
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	negl	%eax
	leal	(%rdi,%rax), %esi
	testl	%edi, %edi
	jle	.L63
	.p2align 4,,10
	.p2align 3
.L62:
	movl	(%r15), %edi
	testl	%edi, %edi
	je	.L61
	movslq	%ecx, %rdi
	addl	$1, %ecx
	movl	%eax, (%rbx,%rdi,4)
.L61:
	addl	$1, %eax
	addq	$4, %r15
	cmpl	%esi, %eax
	jne	.L62
.L63:
	movl	$8, %esi
	movq	%rdx, %rdi
	movl	%r9d, 8(%rsp)
	call	calloc
	movl	8(%rsp), %r9d
	movq	%rax, %r15
	movq	24(%rsp), %rax
	testq	%r15, %r15
	movq	%r15, (%rax)
	je	.L95
	testl	%r9d, %r9d
	jle	.L49
	leal	-1(%r9), %eax
	leal	-1(%r14), %r8d
	xorl	%r11d, %r11d
	movq	%rax, 8(%rsp)
	addq	$1, %r8
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L66:
	movslq	(%r12,%rax,4), %rdi
	movl	4(%r12,%rax,4), %r9d
	movl	%eax, %r10d
	cmpl	%r9d, %edi
	jge	.L74
	.p2align 4,,10
	.p2align 3
.L73:
	movl	0(%rbp,%rdi,4), %esi
	testl	%r14d, %r14d
	je	.L68
	subl	%r10d, %esi
	movl	$1, %edx
	cmpl	(%rbx), %esi
	jne	.L71
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L72:
	leaq	1(%rdx), %rcx
	cmpl	%esi, -4(%rbx,%rcx,4)
	je	.L97
	movq	%rcx, %rdx
.L71:
	cmpq	%rdx, %r8
	jne	.L72
.L68:
	addq	$1, %rdi
	cmpl	%edi, %r9d
	jg	.L73
.L74:
	leaq	1(%rax), %rdx
	addq	(%rsp), %r11
	cmpq	8(%rsp), %rax
	je	.L49
	movq	%rdx, %rax
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L97:
	addq	%r11, %rdx
.L69:
	movsd	0(%r13,%rdi,8), %xmm0
	addq	$1, %rdi
	movsd	%xmm0, (%r15,%rdx,8)
	cmpl	%edi, %r9d
	jg	.L73
	jmp	.L74
.L96:
	movq	%r11, %rdx
	jmp	.L69
.L49:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L92:
	.cfi_restore_state
	xorl	%edx, %edx
	xorl	%edi, %edi
	movq	$0, (%rsp)
	xorl	%r14d, %r14d
	jmp	.L52
.L94:
	movl	$.LC3, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L50:
	movl	$.LC2, %edi
	movl	$35, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L95:
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	call	__errno_location
	movl	(%rax), %edi
	movq	%rax, %rbx
	call	strerror
	movq	stderr(%rip), %rdi
	movl	$.LC5, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movq	stderr(%rip), %rdi
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE37:
	.size	csr_dia, .-csr_dia
	.p2align 4,,15
	.globl	csr_diaii
	.type	csr_diaii, @function
csr_diaii:
.LFB38:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%r9,%r9), %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%r9d, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	movl	$4, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 8(%rsp)
	movslq	%eax, %rdi
	movq	120(%rsp), %r15
	movq	%rcx, 16(%rsp)
	movq	%r8, 24(%rsp)
	movl	%eax, 36(%rsp)
	call	calloc
	testq	%rax, %rax
	je	.L99
	movq	%rax, %r8
	movslq	%r14d, %rax
	xorl	%edx, %edx
	xorl	%edi, %edi
	movq	%rax, (%rsp)
	xorl	%ebp, %ebp
	testl	%r14d, %r14d
	jle	.L101
	movq	%r13, 40(%rsp)
	movq	8(%rsp), %r13
	leal	-1(%r14), %ebx
	xorl	%ebp, %ebp
	xorl	%r10d, %r10d
	leaq	4(%r12), %r11
	.p2align 4,,10
	.p2align 3
.L105:
	movl	0(%r13,%r10,4), %esi
	movl	4(%r13,%r10,4), %edx
	movl	%r10d, %edi
	cmpl	%edx, %esi
	jge	.L102
	subl	$1, %edx
	movslq	%esi, %rcx
	subl	%esi, %edx
	leaq	(%r12,%rcx,4), %rax
	addq	%rcx, %rdx
	leaq	(%r11,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L104:
	movl	(%rax), %edx
	addl	%r14d, %edx
	subl	%edi, %edx
	movslq	%edx, %rdx
	leaq	-4(%r8,%rdx,4), %rcx
	movl	(%rcx), %edx
	cmpl	$1, %edx
	leal	1(%rdx), %esi
	adcl	$0, %ebp
	addq	$4, %rax
	movl	%esi, (%rcx)
	cmpq	%rax, %r9
	jne	.L104
.L102:
	leaq	1(%r10), %rax
	cmpq	%r10, %rbx
	je	.L144
	movq	%rax, %r10
	jmp	.L105
.L144:
	movslq	%ebp, %rdx
	movq	40(%rsp), %r13
	leaq	0(,%rdx,4), %rdi
	imulq	(%rsp), %rdx
.L101:
	movq	112(%rsp), %rax
	movq	%rdx, 40(%rsp)
	movq	%r8, (%rsp)
	movl	%ebp, (%rax)
	movl	%r14d, (%r15)
	call	malloc
	movq	(%rsp), %r8
	movq	40(%rsp), %rdx
	movq	%rax, %rbx
	movq	16(%rsp), %rax
	testq	%rbx, %rbx
	movq	%rbx, (%rax)
	je	.L145
	movl	36(%rsp), %edi
	xorl	%ecx, %ecx
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	negl	%eax
	leal	(%rdi,%rax), %esi
	testl	%edi, %edi
	jle	.L112
	.p2align 4,,10
	.p2align 3
.L111:
	movl	(%r8), %edi
	testl	%edi, %edi
	je	.L110
	movslq	%ecx, %rdi
	addl	$1, %ecx
	movl	%eax, (%rbx,%rdi,4)
.L110:
	addl	$1, %eax
	addq	$4, %r8
	cmpl	%esi, %eax
	jne	.L111
.L112:
	movq	%rdx, %rdi
	movl	$8, %esi
	call	calloc
	movq	24(%rsp), %rdi
	movq	%rax, %rdx
	movq	%rax, (%rdi)
	testq	%rax, %rax
	je	.L146
	leal	-1(%r14), %eax
	xorl	%r10d, %r10d
	movq	%rax, 16(%rsp)
	testl	%r14d, %r14d
	jle	.L98
	leal	-1(%rbp), %esi
	movl	%r14d, (%rsp)
	movq	%rdx, %r14
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L115:
	movq	8(%rsp), %rdi
	movl	%r10d, %r11d
	movl	(%rdi,%r10,4), %eax
	movl	4(%rdi,%r10,4), %r9d
	movslq	%eax, %rdi
	cmpl	%r9d, %eax
	jge	.L124
	.p2align 4,,10
	.p2align 3
.L123:
	movl	(%r12,%rdi,4), %edx
	testl	%ebp, %ebp
	je	.L117
	subl	%r11d, %edx
	movl	$1, %eax
	cmpl	%edx, (%rbx)
	jne	.L120
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L122:
	leaq	1(%rax), %rcx
	cmpl	%edx, -4(%rbx,%rcx,4)
	je	.L118
	movq	%rcx, %rax
.L120:
	cmpq	%rax, %rsi
	jne	.L122
.L117:
	addq	$1, %rdi
	cmpl	%edi, %r9d
	jg	.L123
.L124:
	leaq	1(%r10), %rax
	cmpq	16(%rsp), %r10
	je	.L98
	movq	%rax, %r10
	jmp	.L115
.L147:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L118:
	movslq	(%r15), %rcx
	movl	(%rsp), %r8d
	movsd	0(%r13,%rdi,8), %xmm0
	subl	%ecx, %r8d
	testl	%edx, %edx
	movl	$0, %edx
	movslq	%r8d, %r8
	cmovns	%rdx, %r8
	imulq	%rcx, %rax
	addq	$1, %rdi
	addq	%r10, %rax
	subq	%r8, %rax
	movsd	%xmm0, (%r14,%rax,8)
	cmpl	%edi, %r9d
	jg	.L123
	jmp	.L124
.L98:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L99:
	.cfi_restore_state
	movl	$.LC2, %edi
	movl	$35, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L146:
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	call	__errno_location
	movl	(%rax), %edi
	movq	%rax, %rbx
	call	strerror
	movq	stderr(%rip), %rdi
	movl	$.LC5, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movq	stderr(%rip), %rdi
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	call	fprintf
	movl	$1, %edi
	call	exit
.L145:
	movl	$.LC3, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	csr_diaii, .-csr_diaii
	.p2align 4,,15
	.globl	csr_ellii
	.type	csr_ellii, @function
csr_ellii:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movslq	%r9d, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%rdi, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movl	%ebp, 52(%rsp)
	testl	%ebp, %ebp
	jle	.L165
	leal	-1(%rbp), %ecx
	movq	%rbp, %rsi
	cmpl	$2, %ecx
	jbe	.L166
	shrl	$2, %esi
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	movl	%esi, %edx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L151:
	movdqu	4(%rax), %xmm2
	movdqu	(%rax), %xmm3
	addq	$16, %rax
	psubd	%xmm3, %xmm2
	movdqa	%xmm2, %xmm1
	pcmpgtd	%xmm0, %xmm1
	pand	%xmm1, %xmm2
	pandn	%xmm0, %xmm1
	movdqa	%xmm1, %xmm0
	por	%xmm2, %xmm0
	cmpq	%rdx, %rax
	jne	.L151
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm1
	movl	52(%rsp), %edi
	psrldq	$8, %xmm2
	pcmpgtd	%xmm2, %xmm1
	movl	%edi, %edx
	andl	$-4, %edx
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm1, %xmm0
	movdqa	%xmm0, %xmm2
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm2
	pcmpgtd	%xmm2, %xmm1
	pand	%xmm1, %xmm0
	pandn	%xmm2, %xmm1
	por	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpl	%edx, %edi
	je	.L152
.L150:
	movslq	%edx, %rsi
	movq	40(%rsp), %r14
	leal	1(%rdx), %edi
	salq	$2, %rsi
	leaq	(%r14,%rsi), %r8
	cmpl	%edi, %ecx
	jle	.L167
	cmpl	%edx, 52(%rsp)
	jle	.L167
	movl	4(%r14,%rsi), %r9d
	movl	%r9d, %edi
	subl	(%r8), %edi
	movl	8(%r14,%rsi), %r8d
	cmpl	%eax, %edi
	cmovge	%edi, %eax
	movl	%r8d, %edi
	subl	%r9d, %edi
	leal	3(%rdx), %r9d
	cmpl	%eax, %edi
	cmovge	%edi, %eax
	leal	2(%rdx), %edi
	cmpl	%r9d, %ecx
	jg	.L179
.L153:
	movslq	%edi, %rdx
	movq	40(%rsp), %r14
	movl	52(%rsp), %r11d
	addq	$1, %rdx
	leaq	0(,%rdx,4), %rsi
	movl	(%r14,%rdx,4), %ecx
	subl	-4(%r14,%rsi), %ecx
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	leal	1(%rdi), %ecx
	cmpl	%ecx, %r11d
	jle	.L152
	movl	4(%r14,%rsi), %ecx
	subl	(%r14,%rdx,4), %ecx
	cmpl	%ecx, %eax
	cmovl	%ecx, %eax
	addl	$2, %edi
	cmpl	%edi, %r11d
	jle	.L152
	movl	8(%r14,%rsi), %edx
	subl	4(%r14,%rsi), %edx
	cmpl	%edx, %eax
	cmovl	%edx, %eax
.L152:
	movslq	%eax, %r13
	imulq	%rbp, %r13
.L149:
	movq	144(%rsp), %rdx
	movl	$8, %esi
	movq	%r13, %rdi
	movl	%eax, (%rdx)
	call	calloc
	movq	%rax, 64(%rsp)
	movq	%rax, (%r12)
	testq	%rax, %rax
	je	.L180
	movl	$4, %esi
	movq	%r13, %rdi
	call	calloc
	movq	%rax, 72(%rsp)
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L155
	movl	52(%rsp), %eax
	testl	%eax, %eax
	jle	.L148
	movq	64(%rsp), %rax
	movq	%rbp, %r12
	movq	%rbp, %r10
	xorl	%r14d, %r14d
	leaq	0(,%rbp,8), %r11
	salq	$2, %rbp
	salq	$5, %r12
	movq	%rax, (%rsp)
	movq	72(%rsp), %rax
	salq	$4, %r10
	movq	%rbp, 16(%rsp)
	movq	%rax, 8(%rsp)
	movl	52(%rsp), %eax
	subl	$1, %eax
	movq	%rax, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L158:
	movq	40(%rsp), %rax
	movl	%r14d, 28(%rsp)
	movl	(%rax,%r14,4), %r9d
	movl	4(%rax,%r14,4), %r13d
	cmpl	%r13d, %r9d
	jge	.L163
	movl	%r13d, %ebx
	leal	-1(%r13), %eax
	subl	%r9d, %ebx
	subl	%r9d, %eax
	movl	%ebx, 48(%rsp)
	cmpl	$2, %eax
	jbe	.L169
	movq	32(%rsp), %rax
	movslq	%r9d, %rdx
	movq	8(%rsp), %rcx
	shrl	$2, %ebx
	leaq	(%r15,%rdx,4), %r8
	salq	$5, %rbx
	movq	16(%rsp), %rbp
	leaq	(%rax,%rdx,8), %rax
	movq	(%rsp), %rdx
	leaq	(%r11,%rcx), %rsi
	addq	%rax, %rbx
	leaq	(%r10,%rdx), %rdi
	.p2align 4,,10
	.p2align 3
.L161:
	movupd	(%rax), %xmm1
	movupd	16(%rax), %xmm0
	addq	$32, %rax
	addq	$16, %r8
	movlpd	%xmm1, (%rdx)
	movhpd	%xmm1, (%rdx,%r11)
	addq	%r12, %rdx
	movlpd	%xmm0, (%rdi)
	movhpd	%xmm0, (%rdi,%r11)
	movdqu	-16(%r8), %xmm0
	addq	%r12, %rdi
	pshufd	$85, %xmm0, %xmm1
	movd	%xmm0, (%rcx)
	movd	%xmm1, (%rcx,%rbp)
	movdqa	%xmm0, %xmm1
	addq	%r10, %rcx
	punpckhdq	%xmm0, %xmm1
	pshufd	$255, %xmm0, %xmm0
	movd	%xmm1, (%rsi)
	movd	%xmm0, (%rsi,%rbp)
	addq	%r10, %rsi
	cmpq	%rbx, %rax
	jne	.L161
	movl	48(%rsp), %esi
	movq	%rbp, 16(%rsp)
	movl	%esi, %eax
	andl	$-4, %eax
	addl	%eax, %r9d
	cmpl	%esi, %eax
	je	.L163
.L160:
	movl	52(%rsp), %edi
	movl	28(%rsp), %esi
	movslq	%r9d, %rcx
	movq	32(%rsp), %rbx
	movq	64(%rsp), %r8
	imull	%edi, %eax
	movq	72(%rsp), %rbp
	movsd	(%rbx,%rcx,8), %xmm0
	movl	(%r15,%rcx,4), %ecx
	leal	(%rsi,%rax), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%r8,%rdx,8)
	movl	%ecx, 0(%rbp,%rdx,4)
	leal	1(%r9), %edx
	cmpl	%edx, %r13d
	jle	.L163
	movslq	%edx, %rdx
	addl	%edi, %eax
	addl	$2, %r9d
	movsd	(%rbx,%rdx,8), %xmm0
	leal	(%rsi,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	movsd	%xmm0, (%r8,%rcx,8)
	movl	%edx, 0(%rbp,%rcx,4)
	cmpl	%r9d, %r13d
	jle	.L163
	movslq	%r9d, %r9
	addl	%edi, %eax
	addl	%esi, %eax
	movl	(%r15,%r9,4), %edx
	movsd	(%rbx,%r9,8), %xmm0
	cltq
	movl	%edx, 0(%rbp,%rax,4)
	movsd	%xmm0, (%r8,%rax,8)
.L163:
	leaq	1(%r14), %rax
	addq	$8, (%rsp)
	addq	$4, 8(%rsp)
	cmpq	56(%rsp), %r14
	je	.L148
	movq	%rax, %r14
	jmp	.L158
	.p2align 4,,10
	.p2align 3
.L148:
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L169:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L160
.L179:
	movl	12(%r14,%rsi), %r9d
	movl	%r9d, %edi
	subl	%r8d, %edi
	movl	16(%r14,%rsi), %r8d
	cmpl	%eax, %edi
	cmovge	%edi, %eax
	movl	%r8d, %edi
	subl	%r9d, %edi
	leal	5(%rdx), %r9d
	cmpl	%eax, %edi
	cmovge	%edi, %eax
	leal	4(%rdx), %edi
	cmpl	%r9d, %ecx
	jle	.L153
	movl	20(%r14,%rsi), %edi
	movl	%edi, %ecx
	subl	%r8d, %ecx
	cmpl	%eax, %ecx
	cmovge	%ecx, %eax
	movl	24(%r14,%rsi), %ecx
	subl	%edi, %ecx
	leal	6(%rdx), %edi
	cmpl	%eax, %ecx
	cmovge	%ecx, %eax
	jmp	.L153
.L165:
	xorl	%r13d, %r13d
	xorl	%eax, %eax
	jmp	.L149
.L166:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L150
.L167:
	movl	%edx, %edi
	jmp	.L153
.L180:
	movl	$.LC0, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L155:
	movl	$.LC1, %edi
	movl	$38, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	csr_ellii, .-csr_ellii
	.p2align 4,,15
	.globl	csr_custom
	.type	csr_custom, @function
csr_custom:
.LFB40:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%r9d, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	movl	$4, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	128(%rsp), %rax
	movq	%rdi, 48(%rsp)
	movq	%rcx, 8(%rsp)
	movq	%rax, 24(%rsp)
	movq	136(%rsp), %rax
	movq	%r8, 16(%rsp)
	movq	%rax, 32(%rsp)
	leal	-1(%r9,%r9), %eax
	movslq	%eax, %rdi
	movl	%eax, 44(%rsp)
	call	calloc
	movq	48(%rsp), %r11
	testq	%rax, %rax
	je	.L222
	movq	%r11, 56(%rsp)
	movq	%rax, 48(%rsp)
	call	clock
	testl	%r15d, %r15d
	movq	48(%rsp), %r8
	movq	56(%rsp), %r11
	jle	.L205
	leal	-1(%r15), %r14d
	xorl	%r10d, %r10d
	leaq	4(%r12), %rbx
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L187:
	movl	(%r11,%r10,4), %edi
	movl	4(%r11,%r10,4), %eax
	movl	%r10d, %ecx
	cmpl	%eax, %edi
	jge	.L184
	subl	$1, %eax
	movslq	%edi, %rsi
	subl	%edi, %eax
	leaq	(%r12,%rsi,4), %rdx
	addq	%rsi, %rax
	leaq	(%rbx,%rax,4), %rsi
	.p2align 4,,10
	.p2align 3
.L186:
	movl	(%rdx), %eax
	addl	%r15d, %eax
	subl	%ecx, %eax
	cltq
	leaq	-4(%r8,%rax,4), %rdi
	movl	(%rdi), %eax
	cmpl	$1, %eax
	leal	1(%rax), %r9d
	adcl	$0, %ebp
	addq	$4, %rdx
	movl	%r9d, (%rdi)
	cmpq	%rdx, %rsi
	jne	.L186
.L184:
	leaq	1(%r10), %rax
	cmpq	%r10, %r14
	je	.L223
	movq	%rax, %r10
	jmp	.L187
.L223:
	movslq	%ebp, %rbx
	salq	$2, %rbx
.L183:
	movq	24(%rsp), %rax
	movq	%rbx, %rdi
	movq	%r11, 56(%rsp)
	movq	%r8, 48(%rsp)
	movl	%ebp, (%rax)
	call	malloc
	movq	8(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%rax, (%rsi)
	call	malloc
	movq	8(%rsp), %rsi
	movq	%rax, %r14
	movq	32(%rsp), %rax
	movq	%r14, (%rax)
	movq	(%rsi), %rbx
	testq	%r14, %r14
	je	.L212
	testq	%rbx, %rbx
	movq	48(%rsp), %r8
	movq	56(%rsp), %r11
	je	.L212
	movl	44(%rsp), %esi
	movl	%esi, %eax
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	negl	%eax
	testl	%esi, %esi
	jle	.L207
	addl	%eax, %esi
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L192:
	movl	(%r8), %edx
	testl	%edx, %edx
	je	.L191
	movl	%eax, %r9d
	movslq	%ecx, %rdx
	movl	%r15d, %r10d
	addl	$1, %ecx
	sarl	$31, %r9d
	movl	%edi, (%r14,%rdx,4)
	movl	%eax, (%rbx,%rdx,4)
	movl	%r9d, %edx
	xorl	%eax, %edx
	subl	%r9d, %edx
	subl	%edx, %r10d
	movslq	%r10d, %rdx
	addq	%rdx, %rdi
.L191:
	addl	$1, %eax
	addq	$4, %r8
	cmpl	%esi, %eax
	jne	.L192
.L190:
	movl	$8, %esi
	movq	%r11, 8(%rsp)
	call	calloc
	movq	16(%rsp), %rsi
	movq	%rax, (%rsi)
	testq	%rax, %rax
	je	.L193
	testl	%r15d, %r15d
	movq	8(%rsp), %r11
	jle	.L197
	leal	-1(%r15), %esi
	leal	-1(%rbp), %edx
	xorl	%r10d, %r10d
	movq	%rsi, 8(%rsp)
	leaq	4(,%rdx,4), %rdi
	.p2align 4,,10
	.p2align 3
.L196:
	movslq	(%r11,%r10,4), %rsi
	movl	4(%r11,%r10,4), %r9d
	movl	%r10d, %r8d
	cmpl	%r9d, %esi
	jge	.L204
	.p2align 4,,10
	.p2align 3
.L203:
	movl	(%r12,%rsi,4), %ecx
	testl	%ebp, %ebp
	je	.L198
	subl	%r8d, %ecx
	cmpl	(%rbx), %ecx
	je	.L209
	movl	$4, %edx
	jmp	.L200
	.p2align 4,,10
	.p2align 3
.L202:
	leaq	4(%rdx), %r15
	cmpl	%ecx, -4(%rbx,%r15)
	je	.L224
	movq	%r15, %rdx
.L200:
	cmpq	%rdx, %rdi
	jne	.L202
.L198:
	addq	$1, %rsi
	cmpl	%esi, %r9d
	jg	.L203
.L204:
	leaq	1(%r10), %rdx
	cmpq	8(%rsp), %r10
	je	.L197
	movq	%rdx, %r10
	jmp	.L196
	.p2align 4,,10
	.p2align 3
.L224:
	addq	%r14, %rdx
.L199:
	leal	(%r8,%rcx), %r15d
	testl	%ecx, %ecx
	movsd	0(%r13,%rsi,8), %xmm0
	movl	%r15d, %ecx
	cmovns	%r8d, %ecx
	addl	(%rdx), %ecx
	addq	$1, %rsi
	movslq	%ecx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	cmpl	%esi, %r9d
	jg	.L203
	jmp	.L204
.L209:
	movq	%r14, %rdx
	jmp	.L199
.L197:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	clock
.L205:
	.cfi_restore_state
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	jmp	.L183
.L207:
	xorl	%edi, %edi
	jmp	.L190
.L212:
	movl	$.LC3, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L222:
	movl	$.LC2, %edi
	movl	$35, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L193:
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	call	__errno_location
	movl	(%rax), %edi
	movq	%rax, %rbx
	call	strerror
	movq	stderr(%rip), %rdi
	movl	$.LC5, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movq	stderr(%rip), %rdi
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE40:
	.size	csr_custom, .-csr_custom
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
