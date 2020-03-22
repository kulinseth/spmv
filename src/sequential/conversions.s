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
	incl	(%rbx,%rsi,4)
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
	incq	%rax
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
	incq	%rax
	leaq	(%rbx,%rsi,4), %rsi
	movslq	(%rsi), %rdi
	movl	%r11d, (%r9,%rdi,4)
	vmovss	%xmm0, (%r10,%rdi,4)
	incl	(%rsi)
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
	movl	%r12d, (%rbx,%r14,4)
	leaq	0(,%r14,4), %rdi
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
	movl	%eax, 44(%rsp)
	movq	%rax, 88(%rsp)
	testl	%eax, %eax
	jle	.L66
	leal	-1(%rax), %r12d
	movq	%rax, %rsi
	cmpl	$6, %r12d
	jbe	.L67
	shrl	$3, %esi
	movq	%rdi, %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movl	%esi, %edx
	salq	$5, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L28:
	vmovdqu	4(%rax), %ymm4
	vpsubd	(%rax), %ymm4, %ymm1
	addq	$32, %rax
	vpmaxsd	%ymm1, %ymm0, %ymm0
	cmpq	%rdx, %rax
	jne	.L28
	vperm2i128	$1, %ymm0, %ymm0, %ymm1
	movl	44(%rsp), %edi
	vpmaxsd	%ymm1, %ymm0, %ymm0
	vpsrldq	$8, %ymm0, %ymm1
	movl	%edi, %eax
	vpmaxsd	%ymm1, %ymm0, %ymm0
	andl	$-8, %eax
	vpsrldq	$4, %ymm0, %ymm1
	vpmaxsd	%ymm1, %ymm0, %ymm0
	vmovd	%xmm0, 40(%rsp)
	cmpl	%eax, %edi
	je	.L100
	vzeroupper
.L27:
	movslq	%eax, %rdx
	movq	32(%rsp), %r11
	leal	1(%rax), %ecx
	salq	$2, %rdx
	leaq	(%r11,%rdx), %rdi
	cmpl	%ecx, %r12d
	jle	.L68
	cmpl	%eax, 44(%rsp)
	jle	.L68
	movl	4(%r11,%rdx), %esi
	movl	%esi, %ecx
	subl	(%rdi), %ecx
	movl	40(%rsp), %edi
	cmpl	%edi, %ecx
	cmovl	%edi, %ecx
	movl	8(%r11,%rdx), %edi
	movl	%edi, %r10d
	subl	%esi, %r10d
	leal	3(%rax), %esi
	cmpl	%ecx, %r10d
	cmovge	%r10d, %ecx
	movl	%ecx, %r10d
	movl	%ecx, 40(%rsp)
	leal	2(%rax), %ecx
	cmpl	%esi, %r12d
	jle	.L30
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
	movl	%edi, 40(%rsp)
	leal	5(%rax), %edi
	cmpl	%edi, %r12d
	jle	.L30
	movl	20(%r11,%rdx), %ecx
	movl	%ecx, %edi
	subl	%esi, %edi
	movl	24(%r11,%rdx), %esi
	cmpl	%r10d, %edi
	cmovl	%r10d, %edi
	movl	%esi, %r10d
	subl	%ecx, %r10d
	leal	6(%rax), %ecx
	cmpl	%edi, %r10d
	cmovge	%r10d, %edi
	movl	%edi, %r10d
	movl	%edi, 40(%rsp)
	leal	7(%rax), %edi
	cmpl	%edi, %r12d
	jle	.L30
	movl	28(%r11,%rdx), %ecx
	movl	%ecx, %edi
	subl	%esi, %edi
	movl	32(%r11,%rdx), %esi
	cmpl	%r10d, %edi
	cmovl	%r10d, %edi
	movl	%esi, %r10d
	subl	%ecx, %r10d
	leal	8(%rax), %ecx
	cmpl	%edi, %r10d
	cmovge	%r10d, %edi
	movl	%edi, %r10d
	movl	%edi, 40(%rsp)
	leal	9(%rax), %edi
	cmpl	%edi, %r12d
	jle	.L30
	movl	36(%r11,%rdx), %ecx
	movl	%ecx, %edi
	subl	%esi, %edi
	movl	40(%r11,%rdx), %esi
	cmpl	%r10d, %edi
	cmovl	%r10d, %edi
	movl	%esi, %r10d
	subl	%ecx, %r10d
	leal	10(%rax), %ecx
	cmpl	%edi, %r10d
	cmovge	%r10d, %edi
	movl	%edi, %r10d
	movl	%edi, 40(%rsp)
	leal	11(%rax), %edi
	cmpl	%edi, %r12d
	jle	.L30
	movl	44(%r11,%rdx), %ecx
	movl	%ecx, %edi
	subl	%esi, %edi
	movl	48(%r11,%rdx), %esi
	cmpl	%r10d, %edi
	cmovl	%r10d, %edi
	movl	%esi, %r10d
	subl	%ecx, %r10d
	leal	12(%rax), %ecx
	cmpl	%edi, %r10d
	cmovge	%r10d, %edi
	movl	%edi, %r10d
	movl	%edi, 40(%rsp)
	leal	13(%rax), %edi
	cmpl	%edi, %r12d
	jle	.L30
	movl	52(%r11,%rdx), %edi
	movl	56(%r11,%rdx), %edx
	movl	%edi, %ecx
	subl	%esi, %ecx
	cmpl	%r10d, %ecx
	cmovl	%r10d, %ecx
	subl	%edi, %edx
	cmpl	%ecx, %edx
	cmovge	%edx, %ecx
	movl	%ecx, 40(%rsp)
	leal	14(%rax), %ecx
	.p2align 4,,10
	.p2align 3
.L30:
	movslq	%ecx, %rdx
	movq	32(%rsp), %rdi
	movl	40(%rsp), %r10d
	incq	%rdx
	leaq	0(,%rdx,4), %rax
	movl	(%rdi,%rdx,4), %esi
	subl	-4(%rdi,%rax), %esi
	cmpl	%esi, %r10d
	cmovge	%r10d, %esi
	movl	44(%rsp), %r10d
	movl	%esi, %r11d
	movl	%esi, 40(%rsp)
	leal	1(%rcx), %esi
	cmpl	%esi, %r10d
	jle	.L29
	movl	4(%rdi,%rax), %esi
	subl	(%rdi,%rdx,4), %esi
	cmpl	%esi, %r11d
	movl	%esi, %edx
	movl	%r10d, %esi
	cmovge	%r11d, %edx
	movl	%edx, %r11d
	movl	%edx, 40(%rsp)
	leal	2(%rcx), %edx
	cmpl	%edx, %r10d
	jle	.L29
	movl	8(%rdi,%rax), %edx
	subl	4(%rdi,%rax), %edx
	cmpl	%edx, %r11d
	cmovge	%r11d, %edx
	movl	%edx, %r10d
	movl	%edx, 40(%rsp)
	leal	3(%rcx), %edx
	cmpl	%edx, %esi
	jle	.L29
	movl	12(%rdi,%rax), %edx
	subl	8(%rdi,%rax), %edx
	cmpl	%edx, %r10d
	cmovge	%r10d, %edx
	movl	%edx, %r10d
	movl	%edx, 40(%rsp)
	leal	4(%rcx), %edx
	cmpl	%edx, %esi
	jle	.L29
	movl	16(%rdi,%rax), %edx
	subl	12(%rdi,%rax), %edx
	cmpl	%edx, %r10d
	cmovge	%r10d, %edx
	movl	%edx, %r10d
	movl	%edx, 40(%rsp)
	leal	5(%rcx), %edx
	cmpl	%edx, %esi
	jle	.L29
	movl	20(%rdi,%rax), %edx
	subl	16(%rdi,%rax), %edx
	cmpl	%edx, %r10d
	cmovge	%r10d, %edx
	addl	$6, %ecx
	movl	%edx, %r10d
	movl	%edx, 40(%rsp)
	cmpl	%ecx, %esi
	jle	.L29
	movl	24(%rdi,%rax), %edx
	subl	20(%rdi,%rax), %edx
	movl	%edx, %eax
	cmpl	%edx, %r10d
	cmovge	%r10d, %eax
	movl	%eax, 40(%rsp)
.L29:
	movslq	40(%rsp), %r12
	imulq	88(%rsp), %r12
.L26:
	movl	40(%rsp), %edi
	movq	16(%rbp), %rax
	movl	$4, %esi
	movl	%edi, (%rax)
	movq	%r12, %rdi
	call	calloc
	movq	%rax, 72(%rsp)
	movq	%rax, 0(%r13)
	testq	%rax, %rax
	je	.L101
	leaq	0(,%r12,4), %rdi
	call	malloc
	movq	%rax, %rcx
	movq	%rax, 80(%rsp)
	movq	%rax, (%rbx)
	testq	%rax, %rax
	je	.L32
	movl	40(%rsp), %edi
	testl	%edi, %edi
	jle	.L33
	movl	44(%rsp), %eax
	movq	88(%rsp), %rbx
	testl	%eax, %eax
	jle	.L34
	decl	%eax
	leaq	0(,%rbx,4), %rsi
	xorl	%r13d, %r13d
	movl	%edi, %r12d
	movl	%eax, 60(%rsp)
	leaq	4(,%rax,4), %rbx
	movq	%r14, 64(%rsp)
	movl	%r13d, %r14d
	movq	%rsi, %r13
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rcx, %rdi
	movq	%rbx, %rdx
	movl	$255, %esi
	incl	%r14d
	call	memset
	movq	%rax, %rcx
	addq	%r13, %rcx
	cmpl	%r12d, %r14d
	jne	.L35
	movq	88(%rsp), %rax
	movq	64(%rsp), %r14
	movl	60(%rsp), %r12d
	leaq	0(,%rax,4), %rbx
	movq	%rax, %r13
.L65:
	leaq	0(,%rbx,8), %r9
	movl	%r12d, %eax
	leaq	(%rbx,%rbx,2), %r10
	movq	$0, 64(%rsp)
	subq	%rbx, %r9
	movq	%rax, 24(%rsp)
	incq	%rax
	salq	$5, %r13
	movq	%r9, 48(%rsp)
	leaq	(%rbx,%rbx,4), %r12
	leaq	(%r10,%r10), %r11
	movq	%rax, 16(%rsp)
	movq	64(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L39:
	movq	32(%rsp), %rsi
	movl	%eax, 60(%rsp)
	movl	(%rsi,%rax,4), %edi
	movl	4(%rsi,%rax,4), %eax
	movl	%eax, 88(%rsp)
	cmpl	%eax, %edi
	jge	.L44
	movl	%eax, %r8d
	decl	%eax
	subl	%edi, %r8d
	subl	%edi, %eax
	movl	%r8d, 56(%rsp)
	cmpl	$6, %eax
	jbe	.L70
	movslq	%edi, %rsi
	movq	64(%rsp), %rax
	movq	72(%rsp), %rdx
	shrl	$3, %r8d
	salq	$2, %rsi
	salq	$5, %r8
	movq	48(%rsp), %r9
	leaq	(%r14,%rsi), %rcx
	salq	$2, %rax
	addq	%r15, %rsi
	addq	%rax, %rdx
	addq	%rcx, %r8
	addq	80(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L42:
	vmovups	(%rcx), %xmm0
	addq	$32, %rcx
	addq	$32, %rsi
	vmovss	%xmm0, (%rdx)
	vextractps	$1, %xmm0, (%rdx,%rbx)
	vextractps	$2, %xmm0, (%rdx,%rbx,2)
	vextractps	$3, %xmm0, (%rdx,%r10)
	vmovups	-32(%rcx), %ymm2
	vextractf128	$0x1, %ymm2, %xmm0
	vmovss	%xmm0, (%rdx,%rbx,4)
	vextractps	$1, %xmm0, (%rdx,%r12)
	vextractps	$2, %xmm0, (%rdx,%r11)
	vextractps	$3, %xmm0, (%rdx,%r9)
	vmovdqu	-32(%rsi), %xmm0
	addq	%r13, %rdx
	vmovd	%xmm0, (%rax)
	vpextrd	$1, %xmm0, (%rax,%rbx)
	vpextrd	$2, %xmm0, (%rax,%rbx,2)
	vpextrd	$3, %xmm0, (%rax,%r10)
	vmovdqu	-32(%rsi), %ymm3
	vextracti128	$0x1, %ymm3, %xmm0
	vmovd	%xmm0, (%rax,%rbx,4)
	vpextrd	$1, %xmm0, (%rax,%r12)
	vpextrd	$2, %xmm0, (%rax,%r11)
	vpextrd	$3, %xmm0, (%rax,%r9)
	addq	%r13, %rax
	cmpq	%r8, %rcx
	jne	.L42
	movl	56(%rsp), %esi
	movq	%r9, 48(%rsp)
	movl	%esi, %eax
	andl	$-8, %eax
	addl	%eax, %edi
	cmpl	%esi, %eax
	je	.L44
.L41:
	movl	44(%rsp), %esi
	movl	60(%rsp), %r8d
	movslq	%edi, %rcx
	vmovss	(%r14,%rcx,4), %xmm0
	movq	72(%rsp), %r9
	imull	%esi, %eax
	movl	(%r15,%rcx,4), %ecx
	leal	(%rax,%r8), %edx
	movslq	%edx, %rdx
	vmovss	%xmm0, (%r9,%rdx,4)
	movq	80(%rsp), %r9
	movl	%ecx, (%r9,%rdx,4)
	leal	1(%rdi), %edx
	cmpl	88(%rsp), %edx
	jge	.L44
	movslq	%edx, %rdx
	addl	%esi, %eax
	movq	72(%rsp), %r9
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	2(%rdi), %edx
	cmpl	%edx, 88(%rsp)
	jle	.L44
	movslq	%edx, %rdx
	addl	%esi, %eax
	movq	72(%rsp), %r9
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	3(%rdi), %edx
	cmpl	88(%rsp), %edx
	jge	.L44
	movslq	%edx, %rdx
	addl	%esi, %eax
	movq	72(%rsp), %r9
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	4(%rdi), %edx
	cmpl	88(%rsp), %edx
	jge	.L44
	movslq	%edx, %rdx
	addl	%esi, %eax
	movq	72(%rsp), %r9
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	leal	5(%rdi), %edx
	cmpl	88(%rsp), %edx
	jge	.L44
	movslq	%edx, %rdx
	addl	%esi, %eax
	movq	72(%rsp), %r9
	addl	$6, %edi
	vmovss	(%r14,%rdx,4), %xmm0
	leal	(%r8,%rax), %ecx
	movl	(%r15,%rdx,4), %edx
	movslq	%ecx, %rcx
	vmovss	%xmm0, (%r9,%rcx,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rcx,4)
	cmpl	%edi, 88(%rsp)
	jle	.L44
	movslq	%edi, %rdi
	addl	%esi, %eax
	movq	72(%rsp), %r9
	addl	%r8d, %eax
	vmovss	(%r14,%rdi,4), %xmm0
	movl	(%r15,%rdi,4), %edx
	cltq
	vmovss	%xmm0, (%r9,%rax,4)
	movq	80(%rsp), %r9
	movl	%edx, (%r9,%rax,4)
.L44:
	movq	64(%rsp), %rdi
	leaq	1(%rdi), %rax
	cmpq	24(%rsp), %rdi
	je	.L102
	movq	%rax, 64(%rsp)
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L102:
	movq	%rbx, %rdi
	vzeroupper
	call	malloc
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L46
	movq	16(%rsp), %rdx
	movl	$255, %esi
	movq	%r12, %rdi
	salq	$2, %rdx
	call	memset
.L64:
	movslq	24(%rbp), %rdi
	movl	$4, %esi
	call	calloc
	testq	%rax, %rax
	je	.L46
	movl	40(%rsp), %edx
	testl	%edx, %edx
	jle	.L98
	movl	44(%rsp), %r11d
	testl	%r11d, %r11d
	jle	.L98
	movq	80(%rsp), %r10
	movl	40(%rsp), %r13d
	movl	%r11d, %edi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L54:
	movl	%r9d, %ecx
	movq	%r10, %rsi
	.p2align 4,,10
	.p2align 3
.L53:
	movl	(%rsi), %r14d
	cmpl	$-1, %r14d
	je	.L49
	testl	%r14d, %r14d
	leal	15(%r14), %edx
	cmovns	%r14d, %edx
	sarl	$4, %edx
	movslq	%edx, %rdx
	leaq	(%r12,%rdx,4), %r14
	movl	(%r14), %edx
	cmpl	$-1, %edx
	je	.L50
	movl	%ecx, %r15d
	subl	%edx, %r15d
	movl	%r15d, %edx
	decl	%edx
	cmpl	%ecx, %edx
	jg	.L50
	movslq	%edx, %rdx
	incl	(%rax,%rdx,4)
.L50:
	movl	%ecx, (%r14)
.L49:
	incl	%ecx
	addq	$4, %rsi
	cmpl	%edi, %ecx
	jne	.L53
	incl	%r8d
	leal	(%rcx,%r11), %edi
	addq	%rbx, %r10
	addl	%r11d, %r9d
	cmpl	%r13d, %r8d
	jne	.L54
	movl	44(%rsp), %eax
	movl	40(%rsp), %r9d
	xorl	%edx, %edx
	xorl	%edi, %edi
	leal	-1(%rax), %r8d
	movq	80(%rsp), %rax
	incq	%r8
	leaq	(%rax,%r8,4), %rcx
	negq	%r8
	salq	$2, %r8
	.p2align 4,,10
	.p2align 3
.L61:
	leaq	(%r8,%rcx), %rax
	movl	%edx, %esi
.L57:
	movl	(%rax), %edx
	cmpl	$-1, %edx
	je	.L103
.L58:
	addq	$4, %rax
	cmpq	%rcx, %rax
	je	.L60
	movl	%edx, %esi
	movl	(%rax), %edx
	cmpl	$-1, %edx
	jne	.L58
.L103:
	movl	%esi, (%rax)
	addq	$4, %rax
	cmpq	%rcx, %rax
	jne	.L57
	movl	%esi, %edx
.L60:
	incl	%edi
	addq	%rbx, %rcx
	cmpl	%edi, %r9d
	jne	.L61
.L98:
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
.L70:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L41
.L66:
	xorl	%r12d, %r12d
	movl	$0, 40(%rsp)
	jmp	.L26
.L33:
	movq	88(%rsp), %rax
	leaq	0(,%rax,4), %rbx
	movl	44(%rsp), %eax
	testl	%eax, %eax
	jle	.L37
	leal	-1(%rax), %r12d
	movq	88(%rsp), %r13
	jmp	.L65
.L34:
	salq	$2, %rbx
.L37:
	movq	%rbx, %rdi
	call	malloc
	movq	%rax, %r12
	testq	%rax, %rax
	jne	.L64
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
.L100:
	vzeroupper
	jmp	.L29
.L67:
	movl	$0, 40(%rsp)
	xorl	%eax, %eax
	jmp	.L27
.L68:
	movl	%eax, %ecx
	jmp	.L30
.L101:
	movl	$.LC3, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L32:
	movl	$.LC4, %edi
	movl	$38, %edx
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
	movq	%rax, 32(%rsp)
	leal	-1(%r9,%r9), %eax
	movslq	%eax, %rdi
	movq	%r8, 24(%rsp)
	movl	%eax, 44(%rsp)
	call	calloc
	testq	%rax, %rax
	je	.L145
	movq	%rax, 48(%rsp)
	call	clock
	testl	%r14d, %r14d
	movq	48(%rsp), %r8
	jle	.L128
	movq	%r13, 48(%rsp)
	movq	16(%rsp), %r13
	leal	-1(%r14), %ebx
	xorl	%ebp, %ebp
	xorl	%r10d, %r10d
	leaq	4(%r12), %r11
	.p2align 4,,10
	.p2align 3
.L110:
	movl	0(%r13,%r10,4), %esi
	movl	4(%r13,%r10,4), %edx
	movl	%r10d, %edi
	cmpl	%edx, %esi
	jge	.L107
	decl	%edx
	movslq	%esi, %rcx
	subl	%esi, %edx
	leaq	(%r12,%rcx,4), %rax
	addq	%rcx, %rdx
	leaq	(%r11,%rdx,4), %r9
	.p2align 4,,10
	.p2align 3
.L109:
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
	jne	.L109
.L107:
	leaq	1(%r10), %rax
	cmpq	%rbx, %r10
	je	.L146
	movq	%rax, %r10
	jmp	.L110
.L146:
	movslq	%ebp, %rdx
	movq	48(%rsp), %r13
	leaq	0(,%rdx,4), %rdi
.L106:
	movq	32(%rsp), %rax
	movq	%rdx, 56(%rsp)
	movq	%r8, 48(%rsp)
	movl	%ebp, (%rax)
	call	malloc
	movq	48(%rsp), %r8
	movq	56(%rsp), %rdx
	movq	%rax, %rbx
	movq	8(%rsp), %rax
	testq	%rbx, %rbx
	movq	%rbx, (%rax)
	je	.L147
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
	jle	.L112
	addl	%eax, %edi
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L114:
	movl	(%r8), %ecx
	testl	%ecx, %ecx
	je	.L113
	movl	%eax, %r10d
	movslq	%r9d, %rcx
	sarl	$31, %r10d
	movl	%eax, (%rbx,%rcx,4)
	movl	%r10d, %ecx
	xorl	%eax, %ecx
	subl	%r10d, %ecx
	cmpl	%ecx, %esi
	cmovg	%ecx, %esi
	incl	%r9d
.L113:
	incl	%eax
	addq	$4, %r8
	cmpl	%eax, %edi
	jne	.L114
.L112:
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
	je	.L115
	leal	-1(%r14), %edi
	xorl	%r10d, %r10d
	movq	%rdi, 24(%rsp)
	testl	%r14d, %r14d
	jle	.L119
	leal	-1(%rbp), %esi
	movl	%r14d, 8(%rsp)
	movq	%rax, %r14
	incq	%rsi
	.p2align 4,,10
	.p2align 3
.L118:
	movq	16(%rsp), %rdi
	movl	%r10d, %r11d
	movl	(%rdi,%r10,4), %eax
	movl	4(%rdi,%r10,4), %r9d
	movslq	%eax, %rdi
	cmpl	%r9d, %eax
	jge	.L127
	.p2align 4,,10
	.p2align 3
.L126:
	movl	(%r12,%rdi,4), %edx
	testl	%ebp, %ebp
	je	.L120
	subl	%r11d, %edx
	movl	$1, %eax
	cmpl	%edx, (%rbx)
	jne	.L123
	jmp	.L148
	.p2align 4,,10
	.p2align 3
.L125:
	leaq	1(%rax), %rcx
	cmpl	%edx, -4(%rbx,%rcx,4)
	je	.L121
	movq	%rcx, %rax
.L123:
	cmpq	%rax, %rsi
	jne	.L125
.L120:
	incq	%rdi
	cmpl	%edi, %r9d
	jg	.L126
.L127:
	leaq	1(%r10), %rax
	cmpq	24(%rsp), %r10
	je	.L119
	movq	%rax, %r10
	jmp	.L118
.L148:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L121:
	movslq	(%r15), %rcx
	movl	8(%rsp), %r8d
	vmovss	0(%r13,%rdi,4), %xmm0
	subl	%ecx, %r8d
	testl	%edx, %edx
	movl	$0, %edx
	movslq	%r8d, %r8
	cmovns	%rdx, %r8
	imulq	%rcx, %rax
	incq	%rdi
	addq	%r10, %rax
	subq	%r8, %rax
	vmovss	%xmm0, (%r14,%rax,4)
	cmpl	%edi, %r9d
	jg	.L126
	jmp	.L127
.L119:
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
.L128:
	.cfi_restore_state
	xorl	%edi, %edi
	xorl	%edx, %edx
	xorl	%ebp, %ebp
	jmp	.L106
.L147:
	movl	$.LC7, %edi
	movl	$39, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L145:
	movl	$.LC6, %edi
	movl	$35, %edx
	movl	$1, %esi
	movq	stderr(%rip), %rcx
	call	fwrite
	movl	$1, %edi
	call	exit
.L115:
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
	movq	stderr(%rip), %rdi
	movl	(%rbx), %edx
	xorl	%eax, %eax
	movl	$.LC10, %esi
	call	fprintf
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE39:
	.size	csr_dia, .-csr_dia
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
