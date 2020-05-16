	.file	"conversions.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"couldn't allocate last_used using malloc"
	.align 8
.LC1:
	.string	"couldn't allocate reuse_distance using malloc"
	.align 8
.LC2:
	.string	"couldn't allocate elems using calloc"
	.text
	.p2align 4,,15
	.globl	coo_csr
	.type	coo_csr, @function
coo_csr:
.LFB37:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%edi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%r9, %rbx
	movq	56(%rsp), %r10
	movq	48(%rsp), %r9
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
	cmpq	%rax, %rdi
	jne	.L3
	testl	%ebp, %ebp
	jle	.L15
.L14:
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
.L15:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L7:
	movslq	(%rdx,%rax,4), %rsi
	movl	(%rcx,%rax,4), %r11d
	vmovss	(%r8,%rax,4), %xmm0
	addq	$1, %rax
	leaq	(%rbx,%rsi,4), %rsi
	movslq	(%rsi), %rdi
	movl	%r11d, (%r9,%rdi,4)
	vmovss	%xmm0, (%r10,%rdi,4)
	addl	$1, (%rsi)
	cmpl	%eax, %r12d
	jg	.L7
.L6:
	leal	-1(%rbp), %r13d
	testl	%r13d, %r13d
	jle	.L8
	leal	-2(%rbp), %edx
	movslq	%r13d, %rdi
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
	movslq	%ebp, %r14
	movl	$0, (%rbx)
	leaq	0(,%r14,4), %rdi
	movl	%r12d, (%rbx,%r14,4)
	call	malloc
	testq	%rax, %rax
	je	.L9
	testl	%ebp, %ebp
	jle	.L11
	movl	%r13d, %r13d
	movl	$255, %esi
	movq	%rax, %rdi
	leaq	4(,%r13,4), %rdx
	call	memset
.L11:
	movl	$4, %esi
	movq	%r14, %rdi
	call	calloc
	testq	%rax, %rax
	je	.L23
	movl	$4, %esi
	movq	%r14, %rdi
	call	calloc
	testq	%rax, %rax
	je	.L24
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	testl	%esi, %esi
	jg	.L14
	jmp	.L6
.L9:
	movl	$.LC0, %edi
	movl	$40, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L24:
	movl	$.LC2, %edi
	movl	$36, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L23:
	movl	$.LC1, %edi
	movl	$45, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE37:
	.size	coo_csr, .-coo_csr
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"couldn't allocate ell_data using calloc"
	.align 8
.LC4:
	.string	"couldn't allocate indices using malloc"
	.align 8
.LC5:
	.string	"couldn't allocate x used using malloc"
	.text
	.p2align 4,,15
	.globl	csr_ell
	.type	csr_ell, @function
csr_ell:
.LFB38:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%r9d, %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rsi, %r15
	pushq	%r14
	.cfi_offset 14, -32
	movq	%rdx, %r14
	pushq	%r13
	.cfi_offset 13, -40
	movq	%r8, %r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rcx, %rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	movq	%rdi, 32(%rsp)
	movl	%eax, 40(%rsp)
	movq	%rax, 88(%rsp)
	testl	%eax, %eax
	jle	.L65
	movq	%rax, %rsi
	leal	-1(%rax), %eax
	movl	%eax, 64(%rsp)
	cmpl	$2, %eax
	jbe	.L66
	shrl	$2, %esi
	movq	%rdi, %rax
	vpxor	%xmm1, %xmm1, %xmm1
	movl	%esi, %edx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L28:
	vmovdqu	4(%rax), %xmm4
	vpsubd	(%rax), %xmm4, %xmm0
	addq	$16, %rax
	vpmaxsd	%xmm0, %xmm1, %xmm1
	cmpq	%rdx, %rax
	jne	.L28
	movl	40(%rsp), %edi
	vpsrldq	$8, %xmm1, %xmm0
	vpmaxsd	%xmm0, %xmm1, %xmm1
	vpsrldq	$4, %xmm1, %xmm0
	vpmaxsd	%xmm0, %xmm1, %xmm1
	movl	%edi, %eax
	vmovd	%xmm1, 28(%rsp)
	andl	$-4, %eax
	cmpl	%edi, %eax
	je	.L29
.L27:
	movq	32(%rsp), %r11
	leal	1(%rax), %ecx
	movslq	%eax, %rdx
	movl	64(%rsp), %r9d
	salq	$2, %rdx
	leaq	(%r11,%rdx), %rdi
	cmpl	%ecx, %r9d
	jle	.L67
	cmpl	%eax, 40(%rsp)
	jle	.L67
	movl	4(%r11,%rdx), %esi
	movl	%esi, %ecx
	subl	(%rdi), %ecx
	movl	28(%rsp), %edi
	cmpl	%edi, %ecx
	cmovl	%edi, %ecx
	movl	8(%r11,%rdx), %edi
	movl	%edi, %r10d
	subl	%esi, %r10d
	leal	3(%rax), %esi
	cmpl	%ecx, %r10d
	cmovge	%r10d, %ecx
	movl	%ecx, %r10d
	movl	%ecx, 28(%rsp)
	leal	2(%rax), %ecx
	cmpl	%esi, %r9d
	jg	.L98
.L30:
	movq	32(%rsp), %rdi
	movslq	%ecx, %rax
	addq	$1, %rax
	movl	28(%rsp), %r10d
	leaq	0(,%rax,4), %rsi
	movl	40(%rsp), %r11d
	movl	(%rdi,%rax,4), %edx
	subl	-4(%rdi,%rsi), %edx
	cmpl	%edx, %r10d
	cmovge	%r10d, %edx
	movl	%edx, %r10d
	movl	%edx, 28(%rsp)
	leal	1(%rcx), %edx
	cmpl	%edx, %r11d
	jle	.L29
	movl	4(%rdi,%rsi), %edx
	subl	(%rdi,%rax,4), %edx
	cmpl	%edx, %r10d
	movl	%edx, %eax
	cmovge	%r10d, %eax
	addl	$2, %ecx
	movl	%eax, %edx
	movl	%eax, 28(%rsp)
	cmpl	%ecx, %r11d
	jle	.L29
	movl	8(%rdi,%rsi), %eax
	subl	4(%rdi,%rsi), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, 28(%rsp)
.L29:
	movslq	28(%rsp), %r12
	imulq	88(%rsp), %r12
.L26:
	movl	28(%rsp), %edi
	movl	$4, %esi
	movq	16(%rbp), %rax
	movl	%edi, (%rax)
	movq	%r12, %rdi
	call	calloc
	movq	%rax, 72(%rsp)
	movq	%rax, 0(%r13)
	testq	%rax, %rax
	je	.L99
	leaq	0(,%r12,4), %rdi
	call	malloc
	movq	%rax, %rcx
	movq	%rax, 80(%rsp)
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L32
	movl	28(%rsp), %edi
	testl	%edi, %edi
	jle	.L33
	movl	40(%rsp), %eax
	movq	88(%rsp), %rbx
	testl	%eax, %eax
	jle	.L34
	subl	$1, %eax
	xorl	%r13d, %r13d
	movq	%r14, 56(%rsp)
	leaq	0(,%rbx,4), %r12
	movl	%r13d, %r14d
	movl	%eax, 64(%rsp)
	leaq	4(,%rax,4), %rbx
	movq	%r12, %r13
	movq	%rbx, %r12
	movl	%edi, %ebx
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rcx, %rdi
	movq	%r12, %rdx
	movl	$255, %esi
	call	memset
	addl	$1, %r14d
	movq	%rax, %rcx
	addq	%r13, %rcx
	cmpl	%ebx, %r14d
	jne	.L35
	movq	88(%rsp), %rax
	movq	56(%rsp), %r14
	leaq	0(,%rax,4), %rbx
	movq	%rax, %r13
.L64:
	movl	64(%rsp), %eax
	leaq	0(,%rbx,8), %r9
	salq	$5, %r13
	movq	$0, 64(%rsp)
	leaq	(%rbx,%rbx,2), %r10
	subq	%rbx, %r9
	leaq	(%rbx,%rbx,4), %r12
	movq	%r9, 48(%rsp)
	leaq	(%r10,%r10), %r11
	movq	%rax, 16(%rsp)
	addq	$1, %rax
	movq	%rax, 8(%rsp)
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L39:
	movq	32(%rsp), %rsi
	movl	%eax, 56(%rsp)
	movl	(%rsi,%rax,4), %edi
	movl	4(%rsi,%rax,4), %eax
	movl	%eax, 88(%rsp)
	cmpl	%eax, %edi
	jge	.L44
	movl	%eax, %r8d
	subl	$1, %eax
	subl	%edi, %r8d
	subl	%edi, %eax
	movl	%r8d, 44(%rsp)
	cmpl	$6, %eax
	jbe	.L69
	movq	64(%rsp), %rax
	movslq	%edi, %rsi
	shrl	$3, %r8d
	movq	80(%rsp), %rcx
	salq	$2, %rsi
	salq	$5, %r8
	movq	48(%rsp), %r9
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	addq	72(%rsp), %rax
	leaq	(%r15,%rsi), %rcx
	addq	%r14, %rsi
	addq	%rcx, %r8
	.p2align 4,,10
	.p2align 3
.L42:
	vmovups	(%rsi), %xmm2
	addq	$32, %rcx
	vinsertf128	$0x1, 16(%rsi), %ymm2, %ymm0
	vmovss	%xmm0, (%rax)
	vmovdqu	-32(%rcx), %xmm3
	vextractps	$1, %xmm0, (%rax,%rbx)
	addq	$32, %rsi
	vextractps	$2, %xmm0, (%rax,%rbx,2)
	vextractps	$3, %xmm0, (%rax,%r10)
	vextractf128	$0x1, %ymm0, %xmm0
	vmovss	%xmm0, (%rax,%rbx,4)
	vextractps	$1, %xmm0, (%rax,%r12)
	vextractps	$2, %xmm0, (%rax,%r11)
	vextractps	$3, %xmm0, (%rax,%r9)
	vinsertf128	$0x1, -16(%rcx), %ymm3, %ymm0
	addq	%r13, %rax
	vmovd	%xmm0, (%rdx)
	vpextrd	$1, %xmm0, (%rdx,%rbx)
	vpextrd	$2, %xmm0, (%rdx,%rbx,2)
	vpextrd	$3, %xmm0, (%rdx,%r10)
	vextractf128	$0x1, %ymm0, %xmm0
	vmovd	%xmm0, (%rdx,%rbx,4)
	vpextrd	$1, %xmm0, (%rdx,%r12)
	vpextrd	$2, %xmm0, (%rdx,%r11)
	vpextrd	$3, %xmm0, (%rdx,%r9)
	addq	%r13, %rdx
	cmpq	%r8, %rcx
	jne	.L42
	movl	44(%rsp), %esi
	movq	%r9, 48(%rsp)
	movl	%esi, %eax
	andl	$-8, %eax
	addl	%eax, %edi
	cmpl	%eax, %esi
	je	.L44
.L41:
	movl	40(%rsp), %esi
	movslq	%edi, %rcx
	movl	56(%rsp), %r8d
	movq	72(%rsp), %r9
	vmovss	(%r14,%rcx,4), %xmm0
	imull	%esi, %eax
	movl	(%r15,%rcx,4), %ecx
	leal	(%r8,%rax), %edx
	movslq	%edx, %rdx
	vmovss	%xmm0, (%r9,%rdx,4)
	movq	80(%rsp), %r9
	movl	%ecx, (%r9,%rdx,4)
	leal	1(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edx, %rdx
	addl	%esi, %eax
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%rax,%r8), %ecx
	movslq	%ecx, %rcx
	movl	(%r15,%rdx,4), %edx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	2(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edx, %rdx
	addl	%esi, %eax
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movslq	%ecx, %rcx
	movl	(%r15,%rdx,4), %edx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	3(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edx, %rdx
	addl	%esi, %eax
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movslq	%ecx, %rcx
	movl	(%r15,%rdx,4), %edx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	4(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edx, %rdx
	addl	%esi, %eax
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movslq	%ecx, %rcx
	movl	(%r15,%rdx,4), %edx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	5(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edx, %rdx
	addl	%esi, %eax
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%rax,%r8), %ecx
	addl	$6, %edi
	movslq	%ecx, %rcx
	movl	(%r15,%rdx,4), %edx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	cmpl	%edi, 88(%rsp)
	jle	.L44
	movq	72(%rsp), %r9
	movslq	%edi, %rdi
	addl	%esi, %eax
	addl	%r8d, %eax
	vmovss	(%r14,%rdi,4), %xmm0
	cltq
	movl	(%r15,%rdi,4), %edx
	vmovss	%xmm0, (%r9,%rax,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rax,4)
.L44:
	movq	64(%rsp), %rdi
	leaq	1(%rdi), %rax
	cmpq	16(%rsp), %rdi
	je	.L100
	movq	%rax, 64(%rsp)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L100:
	movq	%rbx, %rdi
	vzeroupper
	call	malloc
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L46
	movq	8(%rsp), %rdx
	movl	$255, %esi
	movq	%r12, %rdi
	salq	$2, %rdx
	call	memset
.L63:
	movslq	24(%rbp), %rdi
	movl	$4, %esi
	call	calloc
	testq	%rax, %rax
	je	.L46
	movl	28(%rsp), %edx
	testl	%edx, %edx
	jle	.L96
	movl	40(%rsp), %r11d
	testl	%r11d, %r11d
	jle	.L96
	movq	80(%rsp), %r10
	movl	%r11d, %edi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	28(%rsp), %r13d
	.p2align 4,,10
	.p2align 3
.L53:
	movl	%r9d, %ecx
	movq	%r10, %rsi
	.p2align 4,,10
	.p2align 3
.L52:
	movl	(%rsi), %r14d
	cmpl	$-1, %r14d
	je	.L49
	leal	15(%r14), %edx
	testl	%r14d, %r14d
	cmovns	%r14d, %edx
	sarl	$4, %edx
	movslq	%edx, %rdx
	leaq	(%r12,%rdx,4), %r14
	movl	(%r14), %edx
	cmpl	$-1, %edx
	je	.L51
	movl	%ecx, %r15d
	subl	%edx, %r15d
	movl	%r15d, %edx
	subl	$1, %edx
	cmpl	%edx, %ecx
	jl	.L51
	movslq	%edx, %rdx
	addl	$1, (%rax,%rdx,4)
.L51:
	movl	%ecx, (%r14)
.L49:
	addl	$1, %ecx
	addq	$4, %rsi
	cmpl	%edi, %ecx
	jne	.L52
	addl	$1, %r8d
	addq	%rbx, %r10
	addl	%r11d, %r9d
	leal	(%rcx,%r11), %edi
	cmpl	%r13d, %r8d
	jne	.L53
	movl	40(%rsp), %eax
	xorl	%edx, %edx
	xorl	%edi, %edi
	movl	28(%rsp), %r9d
	leal	-1(%rax), %r8d
	movq	80(%rsp), %rax
	addq	$1, %r8
	leaq	(%rax,%r8,4), %rcx
	negq	%r8
	salq	$2, %r8
	.p2align 4,,10
	.p2align 3
.L59:
	leaq	(%r8,%rcx), %rax
	movl	%edx, %esi
.L60:
	movl	(%rax), %edx
	cmpl	$-1, %edx
	je	.L101
.L56:
	addq	$4, %rax
	cmpq	%rcx, %rax
	je	.L58
	movl	%edx, %esi
	movl	(%rax), %edx
	cmpl	$-1, %edx
	jne	.L56
.L101:
	movl	%esi, (%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L60
	movl	%esi, %edx
.L58:
	addl	$1, %edi
	addq	%rbx, %rcx
	cmpl	%r9d, %edi
	jne	.L59
.L96:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L69:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L41
.L98:
	movl	12(%r11,%rdx), %ecx
	movl	%ecx, %esi
	subl	%edi, %esi
	cmpl	%r10d, %esi
	movl	%esi, %edi
	movl	16(%r11,%rdx), %esi
	cmovl	%r10d, %edi
	movl	%esi, %r10d
	subl	%ecx, %r10d
	leal	4(%rax), %ecx
	cmpl	%edi, %r10d
	cmovge	%r10d, %edi
	movl	%edi, %r10d
	movl	%edi, 28(%rsp)
	leal	5(%rax), %edi
	cmpl	%edi, %r9d
	jle	.L30
	movl	20(%r11,%rdx), %edi
	movl	24(%r11,%rdx), %edx
	movl	%edi, %ecx
	subl	%esi, %ecx
	cmpl	%r10d, %ecx
	cmovl	%r10d, %ecx
	subl	%edi, %edx
	cmpl	%ecx, %edx
	cmovge	%edx, %ecx
	movl	%ecx, 28(%rsp)
	leal	6(%rax), %ecx
	jmp	.L30
.L33:
	movq	88(%rsp), %rax
	leaq	0(,%rax,4), %rbx
	movl	40(%rsp), %eax
	testl	%eax, %eax
	jle	.L37
	subl	$1, %eax
	movq	88(%rsp), %r13
	movl	%eax, 64(%rsp)
	jmp	.L64
.L65:
	xorl	%r12d, %r12d
	movl	$0, 28(%rsp)
	jmp	.L26
.L34:
	salq	$2, %rbx
.L37:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L63
.L46:
	movl	$.LC5, %edi
	movl	$37, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L66:
	movl	$0, 28(%rsp)
	xorl	%eax, %eax
	jmp	.L27
.L67:
	movl	%eax, %ecx
	jmp	.L30
.L32:
	movl	$.LC4, %edi
	movl	$38, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L99:
	movl	$.LC3, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE38:
	.size	csr_ell, .-csr_ell
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"couldn't allocate ind using calloc\n"
	.align 8
.LC7:
	.string	"couldn't allocate *offset using malloc\n"
	.align 8
.LC8:
	.string	"couldn't allocate *data using calloc\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"%s\n"
.LC10:
	.string	"%d\n"
	.text
	.p2align 4,,15
	.globl	csr_dia
	.type	csr_dia, @function
csr_dia:
.LFB39:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
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
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	128(%rsp), %rax
	movq	%rdi, 16(%rsp)
	movq	%rcx, 8(%rsp)
	movq	136(%rsp), %r15
	movq	%r8, 24(%rsp)
	movq	%rax, 32(%rsp)
	leal	-1(%r9,%r9), %eax
	movslq	%eax, %rdi
	movl	%eax, 44(%rsp)
	call	calloc
	testq	%rax, %rax
	je	.L143
	movq	%rax, 48(%rsp)
	call	clock
	testl	%r14d, %r14d
	movq	48(%rsp), %r8
	jle	.L126
	movq	%r13, 48(%rsp)
	movq	16(%rsp), %r13
	leal	-1(%r14), %ebx
	xorl	%ebp, %ebp
	leaq	4(%r12), %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L108:
	movl	0(%r13,%r10,4), %esi
	movl	%r10d, %edi
	movl	4(%r13,%r10,4), %edx
	cmpl	%edx, %esi
	jge	.L105
	subl	$1, %edx
	movslq	%esi, %rcx
	leaq	(%r12,%rcx,4), %rax
	subl	%esi, %edx
	addq	%rcx, %rdx
	leaq	(%r11,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L107:
	movl	(%rax), %edx
	addl	%r14d, %edx
	subl	%edi, %edx
	movslq	%edx, %rdx
	leaq	-4(%r8,%rdx,4), %rcx
	movl	(%rcx), %edx
	leal	1(%rdx), %esi
	cmpl	$1, %edx
	adcl	$0, %ebp
	addq	$4, %rax
	movl	%esi, (%rcx)
	cmpq	%rax, %r9
	jne	.L107
.L105:
	leaq	1(%r10), %rax
	cmpq	%r10, %rbx
	je	.L144
	movq	%rax, %r10
	jmp	.L108
.L144:
	movq	48(%rsp), %r13
	movslq	%ebp, %rdx
	leaq	0(,%rdx,4), %rdi
.L104:
	movq	32(%rsp), %rax
	movq	%rdx, 56(%rsp)
	movq	%r8, 48(%rsp)
	movl	%ebp, (%rax)
	call	malloc
	movq	48(%rsp), %r8
	movq	%rax, %rbx
	movq	8(%rsp), %rax
	testq	%rbx, %rbx
	movq	56(%rsp), %rdx
	movq	%rbx, (%rax)
	je	.L145
	movl	44(%rsp), %edi
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	negl	%eax
	movl	%eax, %ecx
	sarl	$31, %ecx
	movl	%ecx, %esi
	xorl	%eax, %esi
	subl	%ecx, %esi
	testl	%edi, %edi
	jle	.L110
	addl	%eax, %edi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L112:
	movl	(%r8), %ecx
	testl	%ecx, %ecx
	je	.L111
	movl	%eax, %r10d
	movslq	%r9d, %rcx
	sarl	$31, %r10d
	movl	%eax, (%rbx,%rcx,4)
	movl	%r10d, %ecx
	xorl	%eax, %ecx
	subl	%r10d, %ecx
	cmpl	%ecx, %esi
	cmovg	%ecx, %esi
	addl	$1, %r9d
.L111:
	addl	$1, %eax
	addq	$4, %r8
	cmpl	%edi, %eax
	jne	.L112
.L110:
	movl	%r14d, %eax
	subl	%esi, %eax
	movl	$4, %esi
	movl	%eax, (%r15)
	cltq
	imulq	%rdx, %rax
	movq	%rax, %rdi
	call	calloc
	movq	24(%rsp), %rdi
	movq	%rax, (%rdi)
	testq	%rax, %rax
	je	.L113
	leal	-1(%r14), %edi
	xorl	%r10d, %r10d
	movq	%rdi, 24(%rsp)
	testl	%r14d, %r14d
	jle	.L117
	leal	-1(%rbp), %esi
	movl	%r14d, 8(%rsp)
	movq	%rax, %r14
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L116:
	movq	16(%rsp), %rdi
	movl	%r10d, %r11d
	movl	(%rdi,%r10,4), %eax
	movl	4(%rdi,%r10,4), %r9d
	movslq	%eax, %rdi
	cmpl	%r9d, %eax
	jge	.L125
	.p2align 4,,10
	.p2align 3
.L124:
	movl	(%r12,%rdi,4), %edx
	testl	%ebp, %ebp
	je	.L118
	subl	%r11d, %edx
	movl	$1, %eax
	cmpl	%edx, (%rbx)
	jne	.L121
	jmp	.L146
	.p2align 4,,10
	.p2align 3
.L123:
	leaq	1(%rax), %rcx
	cmpl	%edx, -4(%rbx,%rcx,4)
	je	.L119
	movq	%rcx, %rax
.L121:
	cmpq	%rax, %rsi
	jne	.L123
.L118:
	addq	$1, %rdi
	cmpl	%edi, %r9d
	jg	.L124
.L125:
	leaq	1(%r10), %rax
	cmpq	24(%rsp), %r10
	je	.L117
	movq	%rax, %r10
	jmp	.L116
.L146:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L119:
	movslq	(%r15), %rcx
	movl	8(%rsp), %r8d
	vmovss	0(%r13,%rdi,4), %xmm0
	subl	%ecx, %r8d
	testl	%edx, %edx
	movl	$0, %edx
	movslq	%r8d, %r8
	cmovns	%rdx, %r8
	addq	$1, %rdi
	imulq	%rcx, %rax
	addq	%r10, %rax
	subq	%r8, %rax
	vmovss	%xmm0, (%r14,%rax,4)
	cmpl	%edi, %r9d
	jg	.L124
	jmp	.L125
.L117:
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
.L126:
	.cfi_restore_state
	xorl	%edi, %edi
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	jmp	.L104
.L145:
	movl	$.LC7, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L143:
	movl	$.LC6, %edi
	movl	$35, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L113:
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	movq	stderr(%rip), %rcx
	call	fwrite
	call	__errno_location
	movl	(%rax), %edi
	movq	%rax, %rbx
	call	strerror
	movq	stderr(%rip), %rdi
	movl	$.LC9, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movl	(%rbx), %edx
	movl	$.LC10, %esi
	xorl	%eax, %eax
	movq	stderr(%rip), %rdi
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	csr_dia, .-csr_dia
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
