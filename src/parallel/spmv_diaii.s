	.file	"spmv_diaii.c"
	.text
	.p2align 4,,15
	.globl	spmv_diaii
	.type	spmv_diaii, @function
spmv_diaii:
.LFB14:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	56(%rsp), %eax
	movq	64(%rsp), %r15
	movq	72(%rsp), %r10
	movl	%edx, -28(%rsp)
	movl	%ecx, -32(%rsp)
	testl	%r8d, %r8d
	jle	.L1
	movq	%rdi, %r13
	leal	-1(%r8), %edx
	movslq	%eax, %rdi
	movq	$0, -56(%rsp)
	leal	-1(%r9), %ebx
	movq	%rdi, -48(%rsp)
	subl	%eax, %r9d
	movq	%r13, %r12
	leaq	4(%r13,%rdx,4), %rdi
	movl	%ebx, -16(%rsp)
	movq	%rdi, -40(%rsp)
	movl	%r9d, -12(%rsp)
	.p2align 4,,10
	.p2align 3
.L5:
	movl	(%r12), %edi
	testl	%edi, %edi
	js	.L26
	movl	-28(%rsp), %ebx
	movl	-16(%rsp), %r8d
	movl	$0, %eax
	testl	%ebx, %ebx
	cmovns	%ebx, %eax
	subl	%edi, %r8d
	xorl	%edx, %edx
.L14:
	movl	-32(%rsp), %ebx
	cmpl	%ebx, %r8d
	cmovg	%ebx, %r8d
	cmpl	%eax, %r8d
	jl	.L10
	movq	-56(%rsp), %r9
	movslq	%edi, %r13
	movl	%r8d, %ebx
	movq	%r13, -24(%rsp)
	subl	%eax, %ebx
	subq	%rdx, %r9
	movslq	%eax, %rdx
	movl	%ebx, -60(%rsp)
	leaq	0(,%rdx,8), %rbp
	leaq	(%rdx,%r13), %r11
	leaq	2(%rdx,%r13), %r13
	leaq	(%r10,%rbp), %rcx
	leaq	(%r15,%r13,8), %r13
	leaq	(%r15,%r11,8), %r11
	cmpq	%r13, %rcx
	leaq	16(%r10,%rbp), %r13
	leaq	(%r9,%rdx), %rbx
	setnb	%r14b
	cmpq	%r13, %r11
	leaq	(%rsi,%rbx,8), %rbx
	setnb	%bpl
	orl	%r14d, %ebp
	cmpl	$1, -60(%rsp)
	seta	%r14b
	testb	%r14b, %bpl
	je	.L7
	leaq	2(%r9,%rdx), %rbp
	leaq	(%rsi,%rbp,8), %rbp
	cmpq	%rbp, %rcx
	setnb	%bpl
	cmpq	%r13, %rbx
	setnb	%r13b
	orb	%r13b, %bpl
	je	.L7
	movl	-60(%rsp), %ebp
	xorl	%edx, %edx
	addl	$1, %ebp
	movl	%ebp, %r8d
	shrl	%r8d
	salq	$4, %r8
	.p2align 4,,10
	.p2align 3
.L8:
	movupd	(%rbx,%rdx), %xmm0
	movupd	(%r11,%rdx), %xmm1
	movupd	(%rcx,%rdx), %xmm2
	mulpd	%xmm1, %xmm0
	addpd	%xmm2, %xmm0
	movups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%r8, %rdx
	jne	.L8
	movl	%ebp, %edx
	andl	$-2, %edx
	addl	%edx, %eax
	cmpl	%edx, %ebp
	je	.L10
	movslq	%eax, %rdx
	addl	%edi, %eax
	addq	%rdx, %r9
	cltq
	leaq	(%r10,%rdx,8), %rcx
	movsd	(%rsi,%r9,8), %xmm0
	mulsd	(%r15,%rax,8), %xmm0
	addsd	(%rcx), %xmm0
	movsd	%xmm0, (%rcx)
.L10:
	movq	-48(%rsp), %rdi
	addq	$4, %r12
	addq	%rdi, -56(%rsp)
	cmpq	-40(%rsp), %r12
	jne	.L5
.L1:
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	movl	-28(%rsp), %ebx
	movl	%edi, %eax
	movslq	-12(%rsp), %rdx
	negl	%eax
	movl	-16(%rsp), %r8d
	cmpl	%ebx, %eax
	cmovl	%ebx, %eax
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L7:
	movq	-24(%rsp), %rdi
	leaq	(%rsi,%r9,8), %rax
	leaq	(%r15,%rdi,8), %rcx
	.p2align 4,,10
	.p2align 3
.L12:
	movsd	(%rax,%rdx,8), %xmm0
	mulsd	(%rcx,%rdx,8), %xmm0
	addsd	(%r10,%rdx,8), %xmm0
	movsd	%xmm0, (%r10,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %r8d
	jge	.L12
	jmp	.L10
	.cfi_endproc
.LFE14:
	.size	spmv_diaii, .-spmv_diaii
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
