	.file	"spmv_csr.c"
	.text
	.p2align 4,,15
	.globl	spmv_csr
	.type	spmv_csr, @function
spmv_csr:
.LFB37:
	.cfi_startproc
	testl	%ecx, %ecx
	jle	.L10
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	-1(%rcx), %ebx
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L5:
	movslq	(%rdi,%r11,4), %rax
	movl	4(%rdi,%r11,4), %r10d
	vmovss	(%r9,%r11,4), %xmm1
	cmpl	%r10d, %eax
	jge	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movslq	(%rsi,%rax,4), %rcx
	vmovss	(%r8,%rcx,4), %xmm0
	vmulss	(%rdx,%rax,4), %xmm0, %xmm0
	addq	$1, %rax
	vaddss	%xmm0, %xmm1, %xmm1
	cmpl	%eax, %r10d
	jg	.L4
.L3:
	vmovss	%xmm1, (%r9,%r11,4)
	leaq	1(%r11), %rax
	cmpq	%r11, %rbx
	je	.L14
	movq	%rax, %r11
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L14:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L10:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE37:
	.size	spmv_csr, .-spmv_csr
	.p2align 4,,15
	.globl	spmv_csr4
	.type	spmv_csr4, @function
spmv_csr4:
.LFB38:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE38:
	.size	spmv_csr4, .-spmv_csr4
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
