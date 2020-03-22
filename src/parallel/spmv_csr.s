	.file	"spmv_csr.c"
	.text
	.p2align 4,,15
	.globl	spmv_csr
	.type	spmv_csr, @function
spmv_csr:
.LFB14:
	.cfi_startproc
	testl	%ecx, %ecx
	jle	.L9
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%r11d, %r11d
	leal	-1(%rcx), %ebx
	.p2align 4,,10
	.p2align 3
.L5:
	movslq	(%rdi,%r11,4), %rax
	movl	4(%rdi,%r11,4), %r10d
	movsd	(%r9,%r11,8), %xmm1
	cmpl	%r10d, %eax
	jge	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	(%rsi,%rax,4), %rcx
	movsd	(%r8,%rcx,8), %xmm0
	mulsd	(%rdx,%rax,8), %xmm0
	addq	$1, %rax
	addsd	%xmm0, %xmm1
	cmpl	%eax, %r10d
	jg	.L4
.L3:
	movsd	%xmm1, (%r9,%r11,8)
	leaq	1(%r11), %rax
	cmpq	%r11, %rbx
	je	.L13
	movq	%rax, %r11
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L13:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L9:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE14:
	.size	spmv_csr, .-spmv_csr
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
