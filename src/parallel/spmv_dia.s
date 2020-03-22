	.file	"spmv_dia.c"
	.text
	.p2align 4,,15
	.globl	spmv_dia
	.type	spmv_dia, @function
spmv_dia:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	32(%rsp), %rbx
	cmpl	%ecx, %edx
	jge	.L1
	testl	%r8d, %r8d
	jle	.L1
	movslq	%r8d, %rbp
	movq	40(%rsp), %rax
	movslq	%edx, %r11
	subl	$1, %r8d
	salq	$3, %rbp
	leaq	(%rax,%r11,8), %r10
	imulq	%rbp, %r11
	addq	%rsi, %r11
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L6:
	movq	%rsi, %rax
.L5:
	movl	%edx, %esi
	addl	(%rdi,%rax,4), %esi
	js	.L4
	cmpl	%r9d, %esi
	jge	.L4
	movslq	%esi, %rsi
	movsd	(%rbx,%rsi,8), %xmm0
	mulsd	(%r11,%rax,8), %xmm0
	addsd	(%r10), %xmm0
	movsd	%xmm0, (%r10)
.L4:
	leaq	1(%rax), %rsi
	cmpq	%r8, %rax
	jne	.L6
	addl	$1, %edx
	addq	$8, %r10
	addq	%rbp, %r11
	cmpl	%edx, %ecx
	jne	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	spmv_dia, .-spmv_dia
	.p2align 4,,15
	.globl	spmv_custom
	.type	spmv_custom, @function
spmv_custom:
.LFB15:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	56(%rsp), %rsi
	testl	%ecx, %ecx
	jle	.L12
	leal	-1(%rdx), %eax
	movl	$0, -44(%rsp)
	movq	%rdi, %r14
	movl	%eax, -28(%rsp)
	leal	-1(%rcx), %eax
	leaq	4(%rdi,%rax,4), %rax
	movq	%rax, -24(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movl	-28(%rsp), %ebx
	movl	(%r14), %eax
	xorl	%r8d, %r8d
	movl	%ebx, %edi
	subl	%eax, %edi
	testl	%eax, %eax
	jns	.L24
	movl	%eax, %r8d
	movl	%ebx, %edi
	negl	%r8d
.L24:
	cmpl	%r8d, %edi
	jl	.L15
	movslq	-44(%rsp), %r11
	movslq	%r8d, %rdx
	movslq	%eax, %rbp
	leaq	0(,%rdx,8), %r12
	leaq	2(%rdx,%rbp), %r13
	leaq	16(,%r11,8), %rbx
	leaq	(%rsi,%r12), %rcx
	leaq	-16(%rbx), %r11
	leaq	(%r9,%r13,8), %r13
	leaq	(%rdx,%rbp), %r10
	movq	%r11, -16(%rsp)
	leaq	16(%rsi,%r12), %r12
	addq	%r15, %r11
	leaq	(%r9,%r10,8), %r10
	cmpq	%r13, %rcx
	movq	%r11, -40(%rsp)
	setnb	-29(%rsp)
	cmpq	%r12, %r10
	movzbl	-29(%rsp), %r11d
	setnb	%r13b
	orb	%r13b, %r11b
	je	.L16
	movq	-40(%rsp), %r11
	cmpq	%r12, %r11
	setnb	%r12b
	addq	%r15, %rbx
	cmpq	%rbx, %rcx
	setnb	%bl
	orl	%ebx, %r12d
	movl	%edi, %ebx
	subl	%r8d, %ebx
	cmpl	$1, %ebx
	seta	%bl
	testb	%bl, %r12b
	je	.L16
	leal	1(%rdi), %ebp
	xorl	%edx, %edx
	subl	%r8d, %ebp
	movl	%ebp, %ebx
	shrl	%ebx
	salq	$4, %rbx
	.p2align 4,,10
	.p2align 3
.L17:
	movupd	(%r11,%rdx), %xmm0
	movupd	(%r10,%rdx), %xmm1
	movupd	(%rcx,%rdx), %xmm2
	mulpd	%xmm1, %xmm0
	addpd	%xmm2, %xmm0
	movups	%xmm0, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	%rbx, %rdx
	jne	.L17
	movl	%ebp, %ecx
	movl	-44(%rsp), %ebx
	andl	$-2, %ecx
	leal	(%r8,%rcx), %r10d
	leal	(%rbx,%rcx), %edx
	cmpl	%ecx, %ebp
	je	.L21
	addl	%r10d, %eax
	movslq	%r10d, %rcx
	movslq	%edx, %rdx
	cltq
	leaq	(%rsi,%rcx,8), %rcx
	movsd	(%r9,%rax,8), %xmm0
	mulsd	(%r15,%rdx,8), %xmm0
	addsd	(%rcx), %xmm0
	movsd	%xmm0, (%rcx)
.L21:
	movl	-44(%rsp), %eax
	leal	1(%rdi,%rax), %eax
	subl	%r8d, %eax
	movl	%eax, -44(%rsp)
.L15:
	addq	$4, %r14
	cmpq	-24(%rsp), %r14
	jne	.L22
.L12:
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
.L16:
	.cfi_restore_state
	movq	%rdx, %rax
	movq	-16(%rsp), %rbx
	leaq	(%r9,%rbp,8), %rcx
	negq	%rax
	leaq	(%rbx,%rax,8), %rax
	addq	%r15, %rax
	.p2align 4,,10
	.p2align 3
.L20:
	movsd	(%rax,%rdx,8), %xmm0
	mulsd	(%rcx,%rdx,8), %xmm0
	addsd	(%rsi,%rdx,8), %xmm0
	movsd	%xmm0, (%rsi,%rdx,8)
	addq	$1, %rdx
	cmpl	%edx, %edi
	jge	.L20
	jmp	.L21
	.cfi_endproc
.LFE15:
	.size	spmv_custom, .-spmv_custom
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
