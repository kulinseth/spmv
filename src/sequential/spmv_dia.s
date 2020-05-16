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
	movq	16(%rbp), %r10
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
	movl	(%rax), %r11d
	testl	%r11d, %r11d
	js	.L27
	movl	-44(%rsp), %r8d
	xorl	%ecx, %ecx
	xorl	%eax, %eax
	subl	%r11d, %r8d
.L14:
	cmpl	%ecx, %r8d
	jl	.L10
	movq	-24(%rsp), %rbx
	movslq	%ecx, %rdx
	movslq	%r11d, %r13
	movq	-16(%rsp), %r14
	leaq	0(,%rdx,4), %r12
	leaq	(%rdx,%r13), %rsi
	leaq	(%r9,%rsi,4), %rsi
	subq	%rax, %rbx
	leaq	(%rbx,%rdx), %rdi
	leaq	(%r14,%rdi,4), %rdi
	leaq	8(%r13,%rdx), %r14
	leaq	(%r10,%r12), %rax
	leaq	(%r9,%r14,4), %r14
	cmpq	%r14, %rax
	leaq	32(%r10,%r12), %r14
	setnb	%r15b
	cmpq	%r14, %rsi
	setnb	%r12b
	orl	%r15d, %r12d
	movl	%r8d, %r15d
	subl	%ecx, %r15d
	cmpl	$6, %r15d
	seta	%r15b
	testb	%r15b, %r12b
	je	.L7
	movq	-16(%rsp), %r15
	leaq	8(%rbx,%rdx), %r12
	leaq	(%r15,%r12,4), %r12
	cmpq	%r12, %rax
	setnb	%r12b
	cmpq	%r14, %rdi
	setnb	%r14b
	orb	%r14b, %r12b
	je	.L7
	leal	1(%r8), %r13d
	xorl	%edx, %edx
	subl	%ecx, %r13d
	movl	%r13d, %r12d
	shrl	$3, %r12d
	salq	$5, %r12
	.p2align 4,,10
	.p2align 3
.L8:
	vmovups	(%rdi,%rdx), %xmm2
	vinsertf128	$0x1, 16(%rdi,%rdx), %ymm2, %ymm0
	vmovups	(%rsi,%rdx), %xmm3
	vinsertf128	$0x1, 16(%rsi,%rdx), %ymm3, %ymm1
	vmulps	%ymm1, %ymm0, %ymm0
	vmovups	(%rax,%rdx), %xmm4
	vinsertf128	$0x1, 16(%rax,%rdx), %ymm4, %ymm1
	vaddps	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, (%rax,%rdx)
	vextractf128	$0x1, %ymm0, 16(%rax,%rdx)
	addq	$32, %rdx
	cmpq	%r12, %rdx
	jne	.L8
	movl	%r13d, %eax
	andl	$-8, %eax
	addl	%eax, %ecx
	cmpl	%eax, %r13d
	je	.L10
	movq	-16(%rsp), %rdi
	leal	(%r11,%rcx), %edx
	movslq	%ecx, %rax
	leaq	(%r10,%rax,4), %rsi
	movslq	%edx, %rdx
	addq	%rbx, %rax
	vmovss	(%rdi,%rax,4), %xmm0
	leal	1(%rcx), %eax
	vmulss	(%r9,%rdx,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, (%rsi)
	cmpl	%eax, %r8d
	jl	.L10
	movslq	%eax, %rdx
	addl	%r11d, %eax
	leaq	(%r10,%rdx,4), %rsi
	cltq
	addq	%rbx, %rdx
	vmovss	(%rdi,%rdx,4), %xmm0
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	leal	2(%rcx), %eax
	vmovss	%xmm0, (%rsi)
	cmpl	%eax, %r8d
	jl	.L10
	movslq	%eax, %rdx
	addl	%r11d, %eax
	leaq	(%r10,%rdx,4), %rsi
	cltq
	addq	%rbx, %rdx
	vmovss	(%rdi,%rdx,4), %xmm0
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	leal	3(%rcx), %eax
	vmovss	%xmm0, (%rsi)
	cmpl	%eax, %r8d
	jl	.L10
	movslq	%eax, %rdx
	addl	%r11d, %eax
	leaq	(%r10,%rdx,4), %rsi
	cltq
	addq	%rbx, %rdx
	vmovss	(%rdi,%rdx,4), %xmm0
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	leal	4(%rcx), %eax
	vmovss	%xmm0, (%rsi)
	cmpl	%eax, %r8d
	jl	.L10
	movslq	%eax, %rdx
	addl	%r11d, %eax
	leaq	(%r10,%rdx,4), %rsi
	cltq
	addq	%rbx, %rdx
	vmovss	(%rdi,%rdx,4), %xmm0
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	leal	5(%rcx), %eax
	vmovss	%xmm0, (%rsi)
	cmpl	%eax, %r8d
	jl	.L10
	movslq	%eax, %rdx
	addl	%r11d, %eax
	addl	$6, %ecx
	leaq	(%r10,%rdx,4), %rsi
	cltq
	addq	%rbx, %rdx
	vmovss	(%rdi,%rdx,4), %xmm0
	vmulss	(%r9,%rax,4), %xmm0, %xmm0
	vaddss	(%rsi), %xmm0, %xmm0
	vmovss	%xmm0, (%rsi)
	cmpl	%ecx, %r8d
	jl	.L10
	movslq	%ecx, %rdx
	addl	%r11d, %ecx
	leaq	(%r10,%rdx,4), %rax
	addq	%rdx, %rbx
	movslq	%ecx, %rcx
	vmovss	(%rdi,%rbx,4), %xmm0
	vmulss	(%r9,%rcx,4), %xmm0, %xmm0
	vaddss	(%rax), %xmm0, %xmm0
	vmovss	%xmm0, (%rax)
.L10:
	addq	$4, -8(%rsp)
	movq	-32(%rsp), %rcx
	movq	-8(%rsp), %rax
	addq	%rcx, -24(%rsp)
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
	movl	%r11d, %ecx
	movslq	-48(%rsp), %rax
	negl	%ecx
	movl	-44(%rsp), %r8d
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L7:
	movq	-16(%rsp), %rax
	leaq	(%rax,%rbx,4), %rcx
	leaq	(%r9,%r13,4), %rax
	.p2align 4,,10
	.p2align 3
.L12:
	vmovss	(%rcx,%rdx,4), %xmm0
	vmulss	(%rax,%rdx,4), %xmm0, %xmm0
	vaddss	(%r10,%rdx,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r10,%rdx,4)
	addq	$1, %rdx
	cmpl	%edx, %r8d
	jge	.L12
	jmp	.L10
	.cfi_endproc
.LFE37:
	.size	spmv_dia, .-spmv_dia
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
