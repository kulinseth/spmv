	.file	"spmv_dia.c"
	.text
	.p2align 4,,15
	.globl	spmv_dia
	.type	spmv_dia, @function
spmv_dia:
.LFB37:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, -16(%rsp)
	movq	16(%rbp), %rsi
	testl	%ecx, %ecx
	jle	.L24
	leal	-1(%rdx), %eax
	subl	%r8d, %edx
	movq	%rdi, -8(%rsp)
	movl	%eax, -44(%rsp)
	movslq	%r8d, %rax
	movq	%rax, -32(%rsp)
	leal	-1(%rcx), %eax
	leaq	4(%rdi,%rax,4), %rax
	movl	%edx, -48(%rsp)
	movq	%rax, -40(%rsp)
	movq	$0, -24(%rsp)
	.p2align 4,,10
	.p2align 3
.L5:
	movq	-8(%rsp), %rax
	movl	(%rax), %r8d
	testl	%r8d, %r8d
	js	.L27
	movl	-44(%rsp), %edi
	xorl	%edx, %edx
	xorl	%eax, %eax
	subl	%r8d, %edi
.L14:
	cmpl	%edx, %edi
	jl	.L10
	movq	-24(%rsp), %rbx
	movq	-16(%rsp), %r14
	movslq	%r8d, %r13
	subq	%rax, %rbx
	movslq	%edx, %rax
	leaq	(%rbx,%rax), %r11
	leaq	0(,%rax,4), %r12
	leaq	(%r14,%r11,4), %r11
	leaq	8(%r13,%rax), %r14
	leaq	(%rsi,%r12), %rcx
	leaq	(%r9,%r14,4), %r14
	leaq	(%rax,%r13), %r10
	cmpq	%r14, %rcx
	leaq	32(%rsi,%r12), %r14
	leaq	(%r9,%r10,4), %r10
	setnb	%r15b
	cmpq	%r14, %r10
	setnb	%r12b
	orl	%r15d, %r12d
	movl	%edi, %r15d
	subl	%edx, %r15d
	cmpl	$6, %r15d
	seta	%r15b
	testb	%r15b, %r12b
	je	.L7
	movq	-16(%rsp), %r15
	leaq	8(%rbx,%rax), %r12
	leaq	(%r15,%r12,4), %r12
	cmpq	%r12, %rcx
	setnb	%r12b
	cmpq	%r14, %r11
	setnb	%r14b
	orb	%r14b, %r12b
	je	.L7
	leal	1(%rdi), %r13d
	xorl	%eax, %eax
	subl	%edx, %r13d
	movl	%r13d, %r12d
	shrl	$3, %r12d
	salq	$5, %r12
	.p2align 4,,10
	.p2align 3
.L8:
	vmovups	(%r11,%rax), %ymm0
	vmovups	(%rcx,%rax), %ymm1
	vfmadd132ps	(%r10,%rax), %ymm1, %ymm0
	vmovups	%ymm0, (%rcx,%rax)
	addq	$32, %rax
	cmpq	%r12, %rax
	jne	.L8
	movl	%r13d, %eax
	andl	$-8, %eax
	addl	%eax, %edx
	cmpl	%eax, %r13d
	je	.L10
	movslq	%edx, %rax
	leal	(%r8,%rdx), %ecx
	movq	-16(%rsp), %r15
	leaq	(%rsi,%rax,4), %r10
	movslq	%ecx, %rcx
	addq	%rbx, %rax
	vmovss	(%r15,%rax,4), %xmm0
	vmovss	(%r10), %xmm3
	leal	1(%rdx), %eax
	vfmadd132ss	(%r9,%rcx,4), %xmm3, %xmm0
	vmovss	%xmm0, (%r10)
	cmpl	%eax, %edi
	jl	.L10
	movslq	%eax, %rcx
	addl	%r8d, %eax
	leaq	(%rsi,%rcx,4), %r10
	cltq
	addq	%rbx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	vmovss	(%r10), %xmm4
	vfmadd132ss	(%r9,%rax,4), %xmm4, %xmm0
	leal	2(%rdx), %eax
	vmovss	%xmm0, (%r10)
	cmpl	%eax, %edi
	jl	.L10
	movslq	%eax, %rcx
	addl	%r8d, %eax
	leaq	(%rsi,%rcx,4), %r10
	cltq
	addq	%rbx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	vmovss	(%r10), %xmm5
	vfmadd132ss	(%r9,%rax,4), %xmm5, %xmm0
	leal	3(%rdx), %eax
	vmovss	%xmm0, (%r10)
	cmpl	%eax, %edi
	jl	.L10
	movslq	%eax, %rcx
	addl	%r8d, %eax
	leaq	(%rsi,%rcx,4), %r10
	cltq
	addq	%rbx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	vmovss	(%r10), %xmm6
	vfmadd132ss	(%r9,%rax,4), %xmm6, %xmm0
	leal	4(%rdx), %eax
	vmovss	%xmm0, (%r10)
	cmpl	%eax, %edi
	jl	.L10
	movslq	%eax, %rcx
	addl	%r8d, %eax
	leaq	(%rsi,%rcx,4), %r10
	cltq
	addq	%rbx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	vmovss	(%r10), %xmm7
	vfmadd132ss	(%r9,%rax,4), %xmm7, %xmm0
	leal	5(%rdx), %eax
	vmovss	%xmm0, (%r10)
	cmpl	%eax, %edi
	jl	.L10
	movslq	%eax, %rcx
	addl	%r8d, %eax
	addl	$6, %edx
	leaq	(%rsi,%rcx,4), %r10
	cltq
	addq	%rbx, %rcx
	vmovss	(%r15,%rcx,4), %xmm0
	vmovss	(%r10), %xmm7
	vfmadd132ss	(%r9,%rax,4), %xmm7, %xmm0
	vmovss	%xmm0, (%r10)
	cmpl	%edx, %edi
	jl	.L10
	movslq	%edx, %rcx
	addl	%r8d, %edx
	leaq	(%rsi,%rcx,4), %rax
	addq	%rcx, %rbx
	movslq	%edx, %rdx
	vmovss	(%r15,%rbx,4), %xmm0
	vmovss	(%rax), %xmm6
	vfmadd132ss	(%r9,%rdx,4), %xmm6, %xmm0
	vmovss	%xmm0, (%rax)
.L10:
	addq	$4, -8(%rsp)
	movq	-32(%rsp), %rdi
	movq	-8(%rsp), %rax
	addq	%rdi, -24(%rsp)
	cmpq	-40(%rsp), %rax
	jne	.L5
	vzeroupper
.L24:
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
	.p2align 4,,10
	.p2align 3
.L27:
	.cfi_restore_state
	movl	%r8d, %edx
	movslq	-48(%rsp), %rax
	movl	-44(%rsp), %edi
	negl	%edx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L7:
	movq	-16(%rsp), %rdx
	leaq	(%rdx,%rbx,4), %rcx
	leaq	(%r9,%r13,4), %rdx
	.p2align 4,,10
	.p2align 3
.L12:
	vmovss	(%rcx,%rax,4), %xmm0
	vmovss	(%rsi,%rax,4), %xmm2
	vfmadd132ss	(%rdx,%rax,4), %xmm2, %xmm0
	vmovss	%xmm0, (%rsi,%rax,4)
	incq	%rax
	cmpl	%eax, %edi
	jge	.L12
	jmp	.L10
	.cfi_endproc
.LFE37:
	.size	spmv_dia, .-spmv_dia
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
