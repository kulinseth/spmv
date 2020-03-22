	.file	"spmv_ell.c"
	.text
	.p2align 4,,15
	.globl	spmv_ell
	.type	spmv_ell, @function
spmv_ell:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	24(%rsp), %r10
	movq	32(%rsp), %rbp
	cmpl	%ecx, %edx
	jge	.L1
	testl	%r8d, %r8d
	jle	.L1
	movslq	%edx, %rax
	movslq	%r8d, %rbx
	subl	$1, %ecx
	subl	$1, %r8d
	movq	%rax, %r11
	subl	%edx, %ecx
	leaq	0(%rbp,%rax,8), %r9
	imulq	%rbx, %r11
	addq	%rcx, %rax
	leaq	8(%rbp,%rax,8), %rcx
	addq	%r11, %r8
	.p2align 4,,10
	.p2align 3
.L5:
	movslq	(%rdi,%r11,4), %rax
	testl	%eax, %eax
	js	.L7
	movsd	(%r9), %xmm1
	movq	%r11, %rdx
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L6:
	addq	$1, %rdx
	movslq	(%rdi,%rdx,4), %rax
	testl	%eax, %eax
	js	.L7
.L4:
	movsd	(%r10,%rax,8), %xmm0
	mulsd	(%rsi,%rdx,8), %xmm0
	addsd	%xmm0, %xmm1
	movsd	%xmm1, (%r9)
	cmpq	%r8, %rdx
	jne	.L6
.L7:
	addq	$8, %r9
	addq	%rbx, %r11
	addq	%rbx, %r8
	cmpq	%r9, %rcx
	jne	.L5
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	spmv_ell, .-spmv_ell
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
