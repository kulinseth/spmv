	.file	"spmv_ell.c"
	.text
	.p2align 4,,15
	.globl	spmv_ell
	.type	spmv_ell, @function
spmv_ell:
.LFB37:
	.cfi_startproc
	testl	%ecx, %ecx
	jle	.L8
	testl	%edx, %edx
	jle	.L8
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	-1(%rdx), %r10d
	movslq	%edx, %rbx
	xorl	%r11d, %r11d
	salq	$2, %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	xorl	%eax, %eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%rdx, %rax
.L4:
	movslq	(%rdi,%rax,4), %rdx
	vmovss	(%r8,%rdx,4), %xmm0
	leaq	1(%rax), %rdx
	vmulss	(%rsi,%rax,4), %xmm0, %xmm0
	vaddss	(%r9,%rax,4), %xmm0, %xmm0
	vmovss	%xmm0, (%r9,%rax,4)
	cmpq	%r10, %rax
	jne	.L5
	addl	$1, %r11d
	addq	%rbx, %rsi
	addq	%rbx, %rdi
	cmpl	%r11d, %ecx
	jne	.L3
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE37:
	.size	spmv_ell, .-spmv_ell
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
