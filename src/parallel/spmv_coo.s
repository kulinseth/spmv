	.file	"spmv_coo.c"
	.text
	.p2align 4,,15
	.globl	spmv_coo
	.type	spmv_coo, @function
spmv_coo:
.LFB14:
	.cfi_startproc
	movq	8(%rsp), %r10
	testl	%ecx, %ecx
	jle	.L1
	leal	-1(%rcx), %r11d
	xorl	%eax, %eax
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movq	%rcx, %rax
.L3:
	movslq	(%rdi,%rax,4), %rcx
	movslq	(%rsi,%rax,4), %r8
	leaq	(%r10,%rcx,8), %rcx
	movsd	(%r9,%r8,8), %xmm0
	mulsd	(%rdx,%rax,8), %xmm0
	addsd	(%rcx), %xmm0
	movsd	%xmm0, (%rcx)
	leaq	1(%rax), %rcx
	cmpq	%r11, %rax
	jne	.L4
.L1:
	ret
	.cfi_endproc
.LFE14:
	.size	spmv_coo, .-spmv_coo
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
