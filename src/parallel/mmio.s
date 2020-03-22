	.file	"mmio.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %lg %lg"
.LC1:
	.string	"%d %d %lg\n"
.LC2:
	.string	"%d %d"
	.text
	.p2align 4,,15
	.type	mm_read_mtx_crd_data.constprop.2, @function
mm_read_mtx_crd_data.constprop.2:
.LFB50:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movzbl	2(%r9), %edi
	cmpb	$67, %dil
	je	.L17
	cmpb	$82, %dil
	je	.L18
	movl	$15, %eax
	cmpb	$80, %dil
	jne	.L1
	testl	%esi, %esi
	jle	.L3
	leal	-1(%rsi), %eax
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	leaq	4(%rdx,%rax,4), %r13
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$4, %rbx
	addq	$4, %rbp
	cmpq	%r13, %rbx
	je	.L3
.L10:
	xorl	%eax, %eax
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC2, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$2, %eax
	je	.L19
.L8:
	movl	$12, %eax
.L1:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	testl	%esi, %esi
	jle	.L3
	leal	-1(%rsi), %eax
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%r8, %r13
	leaq	4(%rdx,%rax,4), %r14
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L20:
	addq	$4, %rbx
	addq	$4, %rbp
	addq	$8, %r13
	cmpq	%r14, %rbx
	je	.L3
.L9:
	xorl	%eax, %eax
	movq	%r13, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC1, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$3, %eax
	je	.L20
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L3:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L17:
	.cfi_restore_state
	testl	%esi, %esi
	jle	.L3
	leal	-1(%rsi), %r14d
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	%r8, %r13
	addq	$1, %r14
	salq	$4, %r14
	addq	%r8, %r14
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L4:
	addq	$16, %r13
	addq	$4, %rbx
	addq	$4, %rbp
	cmpq	%r13, %r14
	je	.L3
.L6:
	xorl	%eax, %eax
	leaq	8(%r13), %r9
	movq	%r13, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC0, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$4, %eax
	je	.L4
	jmp	.L8
	.cfi_endproc
.LFE50:
	.size	mm_read_mtx_crd_data.constprop.2, .-mm_read_mtx_crd_data.constprop.2
	.p2align 4,,15
	.globl	mm_is_valid
	.type	mm_is_valid, @function
mm_is_valid:
.LFB35:
	.cfi_startproc
	xorl	%eax, %eax
	cmpb	$77, (%rdi)
	jne	.L21
	cmpb	$65, 1(%rdi)
	movzbl	2(%rdi), %edx
	je	.L35
	cmpb	$82, %dl
	je	.L26
	movl	$1, %eax
	cmpb	$80, %dl
	jne	.L21
	movzbl	3(%rdi), %edx
	cmpb	$72, %dl
	sete	%al
	cmpb	$75, %dl
	sete	%dl
	orl	%edx, %eax
	xorl	$1, %eax
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	cmpb	$80, %dl
	je	.L36
	cmpb	$82, %dl
	je	.L26
	movl	$1, %eax
.L21:
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	xorl	%eax, %eax
	cmpb	$72, 3(%rdi)
	setne	%al
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	ret
	.cfi_endproc
.LFE35:
	.size	mm_is_valid, .-mm_is_valid
	.section	.rodata.str1.1
.LC3:
	.string	"%s %s %s %s %s"
.LC4:
	.string	"%%MatrixMarket"
.LC5:
	.string	"matrix"
.LC6:
	.string	"coordinate"
.LC7:
	.string	"array"
.LC8:
	.string	"real"
.LC9:
	.string	"complex"
.LC10:
	.string	"pattern"
.LC11:
	.string	"integer"
.LC12:
	.string	"general"
.LC13:
	.string	"symmetric"
.LC14:
	.string	"hermitian"
.LC15:
	.string	"skew-symmetric"
	.text
	.p2align 4,,15
	.globl	mm_read_banner
	.type	mm_read_banner, @function
mm_read_banner:
.LFB36:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rdx
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
	movq	%rsi, %rbx
	subq	$1384, %rsp
	.cfi_def_cfa_offset 1440
	movl	$1193287712, (%rsi)
	movl	$1025, %esi
	leaq	336(%rsp), %rdi
	call	fgets
	testq	%rax, %rax
	je	.L40
	leaq	208(%rsp), %r14
	leaq	144(%rsp), %r12
	movl	$.LC3, %esi
	xorl	%eax, %eax
	leaq	80(%rsp), %rbp
	leaq	16(%rsp), %r13
	movq	%r14, %r9
	movq	%r12, %r8
	subq	$8, %rsp
	.cfi_def_cfa_offset 1448
	movq	%rbp, %rcx
	movq	%r13, %rdx
	leaq	280(%rsp), %r15
	pushq	%r15
	.cfi_def_cfa_offset 1456
	leaq	352(%rsp), %rdi
	call	__isoc99_sscanf
	popq	%rdx
	.cfi_def_cfa_offset 1448
	popq	%rcx
	.cfi_def_cfa_offset 1440
	cmpl	$5, %eax
	jne	.L40
	movzbl	80(%rsp), %edx
	testb	%dl, %dl
	movb	%dl, 15(%rsp)
	je	.L41
	call	__ctype_tolower_loc
	movsbq	15(%rsp), %rdx
	movq	(%rax), %rcx
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L42:
	movl	(%rcx,%rdx,4), %edx
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movsbq	(%rax), %rdx
	testb	%dl, %dl
	jne	.L42
.L41:
	movzbl	144(%rsp), %edx
	testb	%dl, %dl
	movb	%dl, 15(%rsp)
	je	.L43
	call	__ctype_tolower_loc
	movsbq	15(%rsp), %rdx
	movq	(%rax), %rcx
	movq	%r12, %rax
	.p2align 4,,10
	.p2align 3
.L44:
	movl	(%rcx,%rdx,4), %edx
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movsbq	(%rax), %rdx
	testb	%dl, %dl
	jne	.L44
.L43:
	movzbl	208(%rsp), %edx
	testb	%dl, %dl
	movb	%dl, 15(%rsp)
	je	.L45
	call	__ctype_tolower_loc
	movsbq	15(%rsp), %rdx
	movq	(%rax), %rcx
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L46:
	movl	(%rcx,%rdx,4), %edx
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movsbq	(%rax), %rdx
	testb	%dl, %dl
	jne	.L46
.L45:
	movzbl	272(%rsp), %edx
	testb	%dl, %dl
	movb	%dl, 15(%rsp)
	je	.L47
	call	__ctype_tolower_loc
	movsbq	15(%rsp), %rdx
	movq	(%rax), %rcx
	movq	%r15, %rax
	.p2align 4,,10
	.p2align 3
.L48:
	movl	(%rcx,%rdx,4), %edx
	addq	$1, %rax
	movb	%dl, -1(%rax)
	movsbq	(%rax), %rdx
	testb	%dl, %dl
	jne	.L48
.L47:
	movl	$.LC4, %edi
	movl	$14, %ecx
	movq	%r13, %rsi
	movl	$14, %eax
	repz cmpsb
	seta	%dl
	sbbb	$0, %dl
	testb	%dl, %dl
	jne	.L37
	movl	$.LC5, %edi
	movl	$7, %ecx
	movq	%rbp, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L52
	movl	$.LC6, %edi
	movl	$11, %ecx
	movq	%r12, %rsi
	movb	$77, (%rbx)
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L78
	movl	$.LC7, %edi
	movl	$6, %ecx
	movq	%r12, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L52
	movb	$65, 1(%rbx)
.L51:
	movl	$.LC8, %edi
	movl	$5, %ecx
	movq	%r14, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L53
	movb	$82, 2(%rbx)
.L54:
	movl	$.LC12, %edi
	movl	$8, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L57
	movb	$71, 3(%rbx)
.L37:
	addq	$1384, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
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
.L40:
	.cfi_restore_state
	movl	$12, %eax
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L78:
	movb	$67, 1(%rbx)
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L53:
	movl	$.LC9, %edi
	movl	$8, %ecx
	movq	%r14, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L55
	movb	$67, 2(%rbx)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L52:
	movl	$15, %eax
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L57:
	movl	$.LC13, %edi
	movl	$10, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L58
	movb	$83, 3(%rbx)
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L55:
	movl	$.LC10, %edi
	movl	$8, %ecx
	movq	%r14, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	je	.L79
	movl	$.LC11, %edi
	movl	$8, %ecx
	movq	%r14, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L52
	movb	$73, 2(%rbx)
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L58:
	movl	$.LC14, %edi
	movl	$10, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	je	.L80
	movl	$.LC15, %edi
	movl	$15, %ecx
	movq	%r15, %rsi
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	movsbl	%al, %eax
	testl	%eax, %eax
	jne	.L52
	movb	$75, 3(%rbx)
	jmp	.L37
.L79:
	movb	$80, 2(%rbx)
	jmp	.L54
.L80:
	movb	$72, 3(%rbx)
	jmp	.L37
	.cfi_endproc
.LFE36:
	.size	mm_read_banner, .-mm_read_banner
	.section	.rodata.str1.1
.LC16:
	.string	"%d %d %d\n"
	.text
	.p2align 4,,15
	.globl	mm_write_mtx_crd_size
	.type	mm_write_mtx_crd_size, @function
mm_write_mtx_crd_size:
.LFB37:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%ecx, %r8d
	xorl	%eax, %eax
	movl	%edx, %ecx
	movl	%esi, %edx
	movl	$.LC16, %esi
	call	fprintf
	movl	$0, %edx
	cmpl	$3, %eax
	movl	$17, %eax
	cmove	%edx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	mm_write_mtx_crd_size, .-mm_write_mtx_crd_size
	.section	.rodata.str1.1
.LC17:
	.string	"%d %d %d"
	.text
	.p2align 4,,15
	.globl	mm_read_mtx_crd_size
	.type	mm_read_mtx_crd_size, @function
mm_read_mtx_crd_size:
.LFB38:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$1048, %rsp
	.cfi_def_cfa_offset 1088
	movl	$0, (%rcx)
	movl	$0, (%rdx)
	movl	$0, (%rsi)
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L104:
	cmpb	$37, (%rsp)
	jne	.L103
.L87:
	movq	%rbx, %rdx
	movl	$1025, %esi
	movq	%rsp, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L104
.L86:
	addq	$1048, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$12, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L103:
	.cfi_restore_state
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$.LC17, %esi
	movq	%rsp, %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L88:
	xorl	%eax, %eax
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$.LC17, %esi
	movq	%rbx, %rdi
	call	__isoc99_fscanf
	cmpl	$-1, %eax
	je	.L86
.L102:
	cmpl	$3, %eax
	jne	.L88
	addq	$1048, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE38:
	.size	mm_read_mtx_crd_size, .-mm_read_mtx_crd_size
	.p2align 4,,15
	.globl	mm_read_mtx_array_size
	.type	mm_read_mtx_array_size, @function
mm_read_mtx_array_size:
.LFB39:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$1040, %rsp
	.cfi_def_cfa_offset 1072
	movl	$0, (%rdx)
	movl	$0, (%rsi)
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L124:
	cmpb	$37, (%rsp)
	jne	.L123
.L107:
	movq	%rbx, %rdx
	movl	$1025, %esi
	movq	%rsp, %rdi
	call	fgets
	testq	%rax, %rax
	jne	.L124
.L106:
	addq	$1040, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	$12, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L123:
	.cfi_restore_state
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$.LC2, %esi
	movq	%rsp, %rdi
	xorl	%eax, %eax
	call	__isoc99_sscanf
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L108:
	xorl	%eax, %eax
	movq	%r12, %rcx
	movq	%rbp, %rdx
	movl	$.LC2, %esi
	movq	%rbx, %rdi
	call	__isoc99_fscanf
	cmpl	$-1, %eax
	je	.L106
.L122:
	cmpl	$2, %eax
	jne	.L108
	addq	$1040, %rsp
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	mm_read_mtx_array_size, .-mm_read_mtx_array_size
	.section	.rodata.str1.1
.LC18:
	.string	"%d %d\n"
	.text
	.p2align 4,,15
	.globl	mm_write_mtx_array_size
	.type	mm_write_mtx_array_size, @function
mm_write_mtx_array_size:
.LFB40:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%edx, %ecx
	xorl	%eax, %eax
	movl	%esi, %edx
	movl	$.LC18, %esi
	call	fprintf
	movl	$0, %edx
	cmpl	$2, %eax
	movl	$17, %eax
	cmove	%edx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	mm_write_mtx_array_size, .-mm_write_mtx_array_size
	.p2align 4,,15
	.globl	mm_read_mtx_crd_data
	.type	mm_read_mtx_crd_data, @function
mm_read_mtx_crd_data:
.LFB41:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	56(%rsp), %rax
	movzbl	2(%rax), %edx
	cmpb	$67, %dl
	je	.L144
	cmpb	$82, %dl
	je	.L145
	movl	$15, %eax
	cmpb	$80, %dl
	jne	.L129
	testl	%ecx, %ecx
	jle	.L131
	leal	-1(%rcx), %eax
	movq	%r8, %rbx
	movq	%r9, %rbp
	leaq	4(%r8,%rax,4), %r13
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L146:
	addq	$4, %rbx
	addq	$4, %rbp
	cmpq	%r13, %rbx
	je	.L131
.L138:
	xorl	%eax, %eax
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC2, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$2, %eax
	je	.L146
.L136:
	movl	$12, %eax
.L129:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L145:
	.cfi_restore_state
	testl	%ecx, %ecx
	jle	.L131
	leal	-1(%rcx), %eax
	movq	%r8, %rbx
	movq	%r9, %rbp
	movq	48(%rsp), %r13
	leaq	4(%r8,%rax,4), %r14
	jmp	.L137
	.p2align 4,,10
	.p2align 3
.L147:
	addq	$4, %rbx
	addq	$4, %rbp
	addq	$8, %r13
	cmpq	%r14, %rbx
	je	.L131
.L137:
	xorl	%eax, %eax
	movq	%r13, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC1, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$3, %eax
	je	.L147
	jmp	.L136
	.p2align 4,,10
	.p2align 3
.L131:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	.cfi_restore_state
	testl	%ecx, %ecx
	jle	.L131
	movq	48(%rsp), %r13
	leal	-1(%rcx), %eax
	movq	%r8, %rbx
	movq	%r9, %rbp
	salq	$4, %rax
	leaq	16(%r13,%rax), %r14
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L132:
	addq	$16, %r13
	addq	$4, %rbx
	addq	$4, %rbp
	cmpq	%r13, %r14
	je	.L131
.L134:
	xorl	%eax, %eax
	leaq	8(%r13), %r9
	movq	%r13, %r8
	movq	%rbp, %rcx
	movq	%rbx, %rdx
	movl	$.LC0, %esi
	movq	%r12, %rdi
	call	__isoc99_fscanf
	cmpl	$4, %eax
	je	.L132
	jmp	.L136
	.cfi_endproc
.LFE41:
	.size	mm_read_mtx_crd_data, .-mm_read_mtx_crd_data
	.p2align 4,,15
	.globl	mm_read_mtx_crd_entry
	.type	mm_read_mtx_crd_entry, @function
mm_read_mtx_crd_entry:
.LFB42:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movzbl	2(%r9), %r9d
	cmpb	$67, %r9b
	je	.L157
	cmpb	$82, %r9b
	je	.L158
	movl	$15, %eax
	cmpb	$80, %r9b
	je	.L159
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L159:
	.cfi_restore_state
	movq	%rdx, %rcx
	xorl	%eax, %eax
	movq	%rsi, %rdx
	movl	$.LC2, %esi
	call	__isoc99_fscanf
	cmpl	$2, %eax
	jne	.L150
.L153:
	xorl	%eax, %eax
.L160:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	movq	%r8, %r9
	xorl	%eax, %eax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movl	$.LC0, %esi
	call	__isoc99_fscanf
	cmpl	$4, %eax
	je	.L153
.L150:
	movl	$12, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L158:
	.cfi_restore_state
	movq	%rcx, %r8
	xorl	%eax, %eax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
	movl	$.LC1, %esi
	call	__isoc99_fscanf
	cmpl	$3, %eax
	jne	.L150
	xorl	%eax, %eax
	jmp	.L160
	.cfi_endproc
.LFE42:
	.size	mm_read_mtx_crd_entry, .-mm_read_mtx_crd_entry
	.section	.rodata.str1.1
.LC19:
	.string	"stdin"
.LC20:
	.string	"r"
	.text
	.p2align 4,,15
	.globl	mm_read_mtx_crd
	.type	mm_read_mtx_crd, @function
mm_read_mtx_crd:
.LFB43:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r10
	movl	$.LC19, %edi
	movq	%r8, %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	movq	%r10, %rsi
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	movl	$6, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	stdin(%rip), %rbp
	repz cmpsb
	movq	%r9, (%rsp)
	movq	88(%rsp), %rbx
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L187
.L163:
	movq	%rbx, %rsi
	movq	%rbp, %rdi
	call	mm_read_banner
	movl	%eax, %r10d
	testl	%eax, %eax
	jne	.L161
	cmpb	$77, (%rbx)
	movl	$15, %r10d
	jne	.L161
	movzbl	1(%rbx), %eax
	movzbl	2(%rbx), %edx
	cmpb	$65, %al
	je	.L161
	cmpb	$82, %dl
	je	.L188
	cmpb	$80, %dl
	jne	.L166
	movzbl	3(%rbx), %edx
	cmpb	$72, %dl
	je	.L180
	cmpb	$75, %dl
	je	.L180
.L166:
	cmpb	$67, %al
	jne	.L180
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%r13, %rsi
	movq	%rbp, %rdi
	call	mm_read_mtx_crd_size
	movl	%eax, %r10d
	testl	%eax, %eax
	jne	.L161
	movslq	(%r12), %rdi
	movl	%eax, 12(%rsp)
	salq	$2, %rdi
	call	malloc
	movslq	(%r12), %rdi
	movq	%rax, (%r15)
	salq	$2, %rdi
	call	malloc
	movl	12(%rsp), %r10d
	movq	%rax, %r13
	movq	(%rsp), %rax
	movq	%r13, (%rax)
	movq	80(%rsp), %rax
	movq	$0, (%rax)
	movzbl	2(%rbx), %eax
	cmpb	$67, %al
	je	.L189
	cmpb	$82, %al
	je	.L190
	cmpb	$80, %al
	je	.L191
.L170:
	cmpq	%rbp, stdin(%rip)
	je	.L161
	movq	%rbp, %rdi
	movl	%r10d, (%rsp)
	call	fclose
	movl	(%rsp), %r10d
.L161:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r10d, %eax
	popq	%rbx
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
.L187:
	.cfi_restore_state
	movl	$.LC20, %esi
	movq	%r10, %rdi
	call	fopen
	movq	%rax, %rbp
	testq	%rax, %rax
	jne	.L163
	movl	$11, %r10d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L188:
	cmpb	$72, 3(%rbx)
	jne	.L166
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L190:
	movl	%r10d, (%rsp)
	movslq	(%r12), %rdi
.L186:
	salq	$3, %rdi
	call	malloc
	movq	%rbx, %r9
	movq	%rax, %r8
	movq	80(%rsp), %rax
	movq	%r8, (%rax)
.L184:
	movq	(%r15), %rdx
	movl	(%r12), %esi
	movq	%r13, %rcx
	movq	%rbp, %rdi
	call	mm_read_mtx_crd_data.constprop.2
	movl	(%rsp), %r10d
	testl	%eax, %eax
	je	.L170
	movl	%eax, %r10d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L180:
	movl	$15, %r10d
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L189:
	movl	(%r12), %eax
	movl	%r10d, (%rsp)
	leal	(%rax,%rax), %edi
	movslq	%edi, %rdi
	jmp	.L186
.L191:
	movl	%r10d, (%rsp)
	movq	%rbx, %r9
	xorl	%r8d, %r8d
	jmp	.L184
	.cfi_endproc
.LFE43:
	.size	mm_read_mtx_crd, .-mm_read_mtx_crd
	.p2align 4,,15
	.globl	mm_strdup
	.type	mm_strdup, @function
mm_strdup:
.LFB46:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strlen
	leal	1(%rax), %edi
	movq	%rax, %rbx
	movslq	%edi, %rdi
	call	malloc
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	leaq	1(%rbx), %rdx
	movq	%rbp, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memcpy
	.cfi_endproc
.LFE46:
	.size	mm_strdup, .-mm_strdup
	.section	.rodata.str1.1
.LC21:
	.string	"%s %s %s %s"
	.text
	.p2align 4,,15
	.globl	mm_typecode_to_str
	.type	mm_typecode_to_str, @function
mm_typecode_to_str:
.LFB47:
	.cfi_startproc
	movzbl	1(%rdi), %edx
	cmpb	$67, %dl
	je	.L205
	xorl	%eax, %eax
	movl	$.LC7, %ecx
	cmpb	$65, %dl
	jne	.L221
	movzbl	2(%rdi), %edx
	cmpb	$82, %dl
	je	.L207
.L225:
	cmpb	$67, %dl
	je	.L208
	cmpb	$80, %dl
	je	.L209
	xorl	%eax, %eax
	movl	$.LC11, %r8d
	cmpb	$73, %dl
	jne	.L221
.L197:
	movzbl	3(%rdi), %edx
	cmpb	$71, %dl
	je	.L211
.L226:
	cmpb	$83, %dl
	je	.L212
	cmpb	$72, %dl
	je	.L213
	xorl	%eax, %eax
	movl	$.LC15, %r9d
	cmpb	$75, %dl
	jne	.L221
.L198:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$.LC5, %edx
	movl	$.LC21, %esi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$1048, %rsp
	.cfi_def_cfa_offset 1072
	movq	%rsp, %rbp
	movq	%rbp, %rdi
	movq	%rbp, %rbx
	call	sprintf
.L199:
	movl	(%rbx), %edx
	addq	$4, %rbx
	leal	-16843009(%rdx), %eax
	notl	%edx
	andl	%edx, %eax
	andl	$-2139062144, %eax
	je	.L199
	movl	%eax, %edx
	shrl	$16, %edx
	testl	$32896, %eax
	cmove	%edx, %eax
	leaq	2(%rbx), %rdx
	cmove	%rdx, %rbx
	movl	%eax, %esi
	addb	%al, %sil
	sbbq	$3, %rbx
	subq	%rbp, %rbx
	leal	1(%rbx), %edi
	addq	$1, %rbx
	movslq	%edi, %rdi
	call	malloc
	cmpl	$8, %ebx
	jnb	.L201
	testb	$4, %bl
	jne	.L223
	testl	%ebx, %ebx
	je	.L194
	movzbl	0(%rbp), %edx
	movb	%dl, (%rax)
	testb	$2, %bl
	jne	.L224
.L194:
	addq	$1048, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	.cfi_restore_state
	movl	%ebx, %edx
	subl	$1, %ebx
	movq	%rbp, %rsi
	movq	%rax, %rdi
	movq	-8(%rbp,%rdx), %rcx
	shrl	$3, %ebx
	movq	%rcx, -8(%rax,%rdx)
	movl	%ebx, %ecx
	rep movsq
	addq	$1048, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L205:
	.cfi_restore 3
	.cfi_restore 6
	movzbl	2(%rdi), %edx
	movl	$.LC6, %ecx
	cmpb	$82, %dl
	jne	.L225
.L207:
	movzbl	3(%rdi), %edx
	movl	$.LC8, %r8d
	cmpb	$71, %dl
	jne	.L226
.L211:
	movl	$.LC12, %r9d
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L212:
	movl	$.LC13, %r9d
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L208:
	movl	$.LC9, %r8d
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$.LC14, %r9d
	jmp	.L198
	.p2align 4,,10
	.p2align 3
.L209:
	movl	$.LC10, %r8d
	jmp	.L197
.L221:
	ret
	.p2align 4,,10
	.p2align 3
.L223:
	.cfi_def_cfa_offset 1072
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	movl	0(%rbp), %edx
	movl	%ebx, %ebx
	movl	%edx, (%rax)
	movl	-4(%rbp,%rbx), %edx
	movl	%edx, -4(%rax,%rbx)
	jmp	.L194
	.p2align 4,,10
	.p2align 3
.L224:
	movl	%ebx, %ebx
	movzwl	-2(%rbp,%rbx), %edx
	movw	%dx, -2(%rax,%rbx)
	jmp	.L194
	.cfi_endproc
.LFE47:
	.size	mm_typecode_to_str, .-mm_typecode_to_str
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC22:
	.string	"mm_read_unsymetric: Could not process Matrix Market banner "
	.section	.rodata.str1.1
.LC23:
	.string	" in file [%s]\n"
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"Sorry, this application does not support "
	.section	.rodata.str1.1
.LC25:
	.string	"Market Market type: [%s]\n"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"read_unsymmetric_sparse(): could not parse matrix size.\n"
	.text
	.p2align 4,,15
	.globl	mm_read_unsymmetric_sparse
	.type	mm_read_unsymmetric_sparse, @function
mm_read_unsymmetric_sparse:
.LFB34:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rsi, %r15
	movl	$.LC20, %esi
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%r9, 8(%rsp)
	call	fopen
	testq	%rax, %rax
	je	.L235
	leaq	28(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbx
	call	mm_read_banner
	testl	%eax, %eax
	jne	.L238
	cmpb	$82, 30(%rsp)
	jne	.L230
	cmpb	$77, 28(%rsp)
	jne	.L230
	cmpb	$67, 29(%rsp)
	jne	.L230
	leaq	24(%rsp), %rcx
	leaq	20(%rsp), %rdx
	movq	%rbx, %rdi
	leaq	16(%rsp), %rsi
	call	mm_read_mtx_crd_size
	movl	%eax, %ebp
	testl	%eax, %eax
	jne	.L239
	movl	16(%rsp), %eax
	movslq	24(%rsp), %rdi
	movl	%eax, (%r15)
	movl	20(%rsp), %eax
	movl	%eax, (%r14)
	movl	%edi, 0(%r13)
	salq	$2, %rdi
	call	malloc
	movslq	24(%rsp), %rdi
	movq	%rax, %r14
	salq	$2, %rdi
	call	malloc
	movslq	24(%rsp), %rdi
	movq	%rax, %r13
	salq	$3, %rdi
	call	malloc
	movq	96(%rsp), %rdx
	movq	8(%rsp), %rcx
	movq	%rax, (%r12)
	movq	%r14, (%rcx)
	movq	%r13, (%rdx)
	movl	24(%rsp), %edx
	testl	%edx, %edx
	jle	.L233
	movq	%r13, %r12
	xorl	%r15d, %r15d
	movq	%rax, %r13
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%r14, %rdx
	movl	$.LC1, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	addl	$1, %r15d
	addq	$8, %r13
	call	__isoc99_fscanf
	subl	$1, (%r14)
	addq	$4, %r14
	subl	$1, (%r12)
	addq	$4, %r12
	cmpl	%r15d, 24(%rsp)
	jg	.L234
.L233:
	movq	%rbx, %rdi
	call	fclose
.L227:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
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
.L230:
	.cfi_restore_state
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC24, %edi
	movq	stderr(%rip), %rcx
	movl	$-1, %ebp
	call	fwrite
	leaq	28(%rsp), %rdi
	call	mm_typecode_to_str
	movq	stderr(%rip), %rdi
	movl	$.LC25, %esi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	jmp	.L227
.L239:
	movl	$56, %edx
	movl	$1, %esi
	movl	$.LC26, %edi
	movq	stderr(%rip), %rcx
	movl	$-1, %ebp
	call	fwrite
	jmp	.L227
.L235:
	movl	$-1, %ebp
	jmp	.L227
.L238:
	movl	$.LC22, %edi
	xorl	%eax, %eax
	call	printf
	movq	%rbp, %rsi
	movl	$.LC23, %edi
	xorl	%eax, %eax
	call	printf
	movl	$-1, %ebp
	jmp	.L227
	.cfi_endproc
.LFE34:
	.size	mm_read_unsymmetric_sparse, .-mm_read_unsymmetric_sparse
	.section	.rodata.str1.1
.LC27:
	.string	"%s %s\n"
	.text
	.p2align 4,,15
	.globl	mm_write_banner
	.type	mm_write_banner, @function
mm_write_banner:
.LFB44:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movq	%rsi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	mm_typecode_to_str
	movl	$.LC4, %edx
	movq	%rbp, %rdi
	movl	$.LC27, %esi
	movq	%rax, %rbx
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	fprintf
	movq	%rbx, %rdi
	movl	%eax, %ebp
	call	free
	cmpl	$2, %ebp
	movl	$17, %eax
	movl	$0, %edx
	cmove	%edx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE44:
	.size	mm_write_banner, .-mm_write_banner
	.section	.rodata.str1.1
.LC28:
	.string	"stdout"
.LC29:
	.string	"w"
.LC30:
	.string	"%s "
.LC31:
	.string	"%s\n"
.LC32:
	.string	"%d %d %20.16g\n"
.LC33:
	.string	"%d %d %20.16g %20.16g\n"
	.text
	.p2align 4,,15
	.globl	mm_write_mtx_crd
	.type	mm_write_mtx_crd, @function
mm_write_mtx_crd:
.LFB45:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r10
	movl	$.LC28, %edi
	movl	%edx, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	movl	$7, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r9, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	stdout(%rip), %rbx
	movl	%esi, 12(%rsp)
	movq	%r10, %rsi
	movq	80(%rsp), %r13
	repz cmpsb
	seta	%al
	sbbb	$0, %al
	testb	%al, %al
	jne	.L263
.L246:
	movl	$.LC4, %edx
	movl	$.LC30, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	fprintf
	movq	88(%rsp), %rdi
	call	mm_typecode_to_str
	movl	$.LC31, %esi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	fprintf
	movl	12(%rsp), %edx
	movl	%r14d, %r8d
	movl	%r15d, %ecx
	movl	$.LC16, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	fprintf
	movq	88(%rsp), %rax
	movzbl	2(%rax), %eax
	cmpb	$80, %al
	je	.L264
	cmpb	$82, %al
	je	.L265
	cmpb	$67, %al
	jne	.L253
	testl	%r14d, %r14d
	jle	.L249
	leal	-1(%r14), %eax
	xorl	%r14d, %r14d
	leaq	4(,%rax,4), %r15
	.p2align 4,,10
	.p2align 3
.L254:
	movl	(%r12,%r14), %ecx
	movl	0(%rbp,%r14), %edx
	movq	%rbx, %rdi
	movl	$.LC33, %esi
	movsd	8(%r13,%r14,4), %xmm1
	movsd	0(%r13,%r14,4), %xmm0
	movl	$2, %eax
	addq	$4, %r14
	call	fprintf
	cmpq	%r14, %r15
	jne	.L254
.L249:
	xorl	%ebp, %ebp
	cmpq	%rbx, stdout(%rip)
	je	.L244
.L262:
	movq	%rbx, %rdi
	call	fclose
.L244:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
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
.L265:
	.cfi_restore_state
	testl	%r14d, %r14d
	jle	.L249
	leal	-1(%r14), %r15d
	xorl	%r14d, %r14d
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L257:
	movq	%rax, %r14
.L252:
	movl	(%r12,%r14,4), %ecx
	movl	0(%rbp,%r14,4), %edx
	movl	$.LC32, %esi
	movq	%rbx, %rdi
	movsd	0(%r13,%r14,8), %xmm0
	movl	$1, %eax
	call	fprintf
	leaq	1(%r14), %rax
	cmpq	%r14, %r15
	jne	.L257
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L263:
	movl	$.LC29, %esi
	movq	%r10, %rdi
	call	fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	.L246
	movl	$17, %ebp
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L264:
	testl	%r14d, %r14d
	jle	.L249
	subl	$1, %r14d
	xorl	%r13d, %r13d
	jmp	.L250
	.p2align 4,,10
	.p2align 3
.L256:
	movq	%rax, %r13
.L250:
	movl	(%r12,%r13,4), %ecx
	movl	0(%rbp,%r13,4), %edx
	movl	$.LC18, %esi
	xorl	%eax, %eax
	movq	%rbx, %rdi
	call	fprintf
	leaq	1(%r13), %rax
	cmpq	%r14, %r13
	jne	.L256
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L253:
	cmpq	%rbx, stdout(%rip)
	movl	$15, %ebp
	jne	.L262
	jmp	.L244
	.cfi_endproc
.LFE45:
	.size	mm_write_mtx_crd, .-mm_write_mtx_crd
	.ident	"GCC: (GNU) 8.1.0"
	.section	.note.GNU-stack,"",@progbits
