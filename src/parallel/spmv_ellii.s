	.file	"spmv_ellii.c"
	.text
	.p2align 4,,15
	.globl	spmv_ellii
	.type	spmv_ellii, @function
spmv_ellii:
.LFB14:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	32(%rsp), %r11
	movq	40(%rsp), %r10
	testl	%r8d, %r8d
	jle	.L1
	cmpl	%ecx, %edx
	jge	.L1
	movslq	%r9d, %rbx
	movslq	%edx, %r12
	xorl	%r9d, %r9d
	leaq	0(,%rbx,8), %rbp
	salq	$2, %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L5:
	movslq	(%rdi,%rax,4), %rdx
	testl	%edx, %edx
	js	.L4
	movsd	(%r11,%rdx,8), %xmm0
	mulsd	(%rsi,%rax,8), %xmm0
	addsd	(%r10,%rax,8), %xmm0
	movsd	%xmm0, (%r10,%rax,8)
.L4:
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L5
	addl	$1, %r9d
	addq	%rbp, %rsi
	addq	%rbx, %rdi
	cmpl	%r9d, %r8d
	jne	.L3
.L1:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE14:
	.size	spmv_ellii, .-spmv_ellii
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
