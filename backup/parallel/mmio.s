	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 16	sdk_version 10, 16
	.globl	_mm_read_unsymmetric_sparse ## -- Begin function mm_read_unsymmetric_sparse
	.p2align	4, 0x90
_mm_read_unsymmetric_sparse:            ## @mm_read_unsymmetric_sparse
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1096, %rsp             ## imm = 0x448
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, -1128(%rbp)        ## 8-byte Spill
	movq	%r8, -1120(%rbp)        ## 8-byte Spill
	movq	%rcx, -1112(%rbp)       ## 8-byte Spill
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	movl	$-1, %r14d
	testq	%rax, %rax
	je	LBB0_19
## %bb.1:
	movq	%rax, %r13
	leaq	-1096(%rbp), %rsi
	movq	%rax, %rdi
	callq	_mm_read_banner
	testl	%eax, %eax
	je	LBB0_3
## %bb.2:
	leaq	L_.str.1(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	_printf
LBB0_19:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB0_21
LBB0_20:
	movl	%r14d, %eax
	addq	$1096, %rsp             ## imm = 0x448
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB0_3:
	cmpb	$82, -1094(%rbp)
	jne	LBB0_6
## %bb.4:
	cmpb	$77, -1096(%rbp)
	jne	LBB0_6
## %bb.5:
	cmpb	$67, -1095(%rbp)
	jne	LBB0_6
## %bb.7:
	movl	$0, -1092(%rbp)
	movl	$0, -1100(%rbp)
	movl	$0, -1104(%rbp)
	leaq	-1088(%rbp), %rbx
	.p2align	4, 0x90
LBB0_8:                                 ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movl	$1025, %esi             ## imm = 0x401
	movq	%r13, %rdx
	callq	_fgets
	testq	%rax, %rax
	je	LBB0_14
## %bb.9:                               ##   in Loop: Header=BB0_8 Depth=1
	cmpb	$37, -1088(%rbp)
	je	LBB0_8
## %bb.10:
	leaq	L_.str.21(%rip), %rsi
	leaq	-1088(%rbp), %rdi
	leaq	-1104(%rbp), %rdx
	leaq	-1100(%rbp), %rcx
	leaq	-1092(%rbp), %r8
	xorl	%eax, %eax
	callq	_sscanf
	cmpl	$3, %eax
	je	LBB0_15
## %bb.11:
	leaq	-1092(%rbp), %rbx
	.p2align	4, 0x90
LBB0_12:                                ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	leaq	L_.str.21(%rip), %rsi
	leaq	-1104(%rbp), %rdx
	leaq	-1100(%rbp), %rcx
	movq	%rbx, %r8
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$3, %eax
	je	LBB0_15
## %bb.13:                              ##   in Loop: Header=BB0_12 Depth=1
	cmpl	$-1, %eax
	jne	LBB0_12
LBB0_14:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	leaq	L_.str.5(%rip), %rdi
	movl	$56, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB0_20
	jmp	LBB0_21
LBB0_6:
	movq	___stderrp@GOTPCREL(%rip), %rbx
	movq	(%rbx), %rcx
	leaq	L_.str.3(%rip), %rdi
	movl	$41, %esi
	movl	$1, %edx
	callq	_fwrite
	movq	(%rbx), %rbx
	leaq	-1096(%rbp), %rdi
	callq	_mm_typecode_to_str
	leaq	L_.str.4(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB0_20
LBB0_21:
	callq	___stack_chk_fail
LBB0_15:
	movl	-1104(%rbp), %eax
	movl	%eax, (%r12)
	movl	-1100(%rbp), %eax
	movl	%eax, (%r15)
	movslq	-1092(%rbp), %r12
	movq	-1112(%rbp), %rax       ## 8-byte Reload
	movl	%r12d, (%rax)
	leaq	(,%r12,4), %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, %rbx
	leaq	(,%r12,8), %rdi
	callq	_malloc
	movq	%rax, %r15
	movq	-1120(%rbp), %rax       ## 8-byte Reload
	movq	%r15, (%rax)
	movq	-1128(%rbp), %rax       ## 8-byte Reload
	movq	%r14, (%rax)
	movq	16(%rbp), %rax
	movq	%rbx, (%rax)
	testq	%r12, %r12
	jle	LBB0_18
## %bb.16:
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB0_17:                                ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	leaq	L_.str.6(%rip), %rsi
	movq	%r14, %rdx
	movq	%rbx, %rcx
	movq	%r15, %r8
	xorl	%eax, %eax
	callq	_fscanf
	decl	(%r14)
	decl	(%rbx)
	incq	%r12
	movslq	-1092(%rbp), %rax
	addq	$8, %r15
	addq	$4, %rbx
	addq	$4, %r14
	cmpq	%rax, %r12
	jl	LBB0_17
LBB0_18:
	movq	%r13, %rdi
	callq	_fclose
	xorl	%r14d, %r14d
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB0_20
	jmp	LBB0_21
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_read_banner         ## -- Begin function mm_read_banner
	.p2align	4, 0x90
_mm_read_banner:                        ## @mm_read_banner
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$1376, %rsp             ## imm = 0x560
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %r14
	movq	%rdi, %rdx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movl	$1193287712, (%rsi)     ## imm = 0x47202020
	leaq	-1056(%rbp), %rdi
	movl	$1025, %esi             ## imm = 0x401
	callq	_fgets
	movl	$12, %ebx
	testq	%rax, %rax
	je	LBB1_37
## %bb.1:
	leaq	-1376(%rbp), %rax
	movq	%rax, (%rsp)
	leaq	L_.str.7(%rip), %rsi
	leaq	-1056(%rbp), %rdi
	leaq	-1120(%rbp), %rdx
	leaq	-1184(%rbp), %rcx
	leaq	-1248(%rbp), %r8
	leaq	-1312(%rbp), %r9
	xorl	%eax, %eax
	callq	_sscanf
	cmpl	$5, %eax
	jne	LBB1_37
## %bb.2:
	movb	-1184(%rbp), %al
	testb	%al, %al
	je	LBB1_5
## %bb.3:
	leaq	-1183(%rbp), %rbx
	.p2align	4, 0x90
LBB1_4:                                 ## =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	___tolower
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %eax
	incq	%rbx
	testb	%al, %al
	jne	LBB1_4
LBB1_5:
	movb	-1248(%rbp), %al
	testb	%al, %al
	je	LBB1_8
## %bb.6:
	leaq	-1247(%rbp), %rbx
	.p2align	4, 0x90
LBB1_7:                                 ## =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	___tolower
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %eax
	incq	%rbx
	testb	%al, %al
	jne	LBB1_7
LBB1_8:
	movb	-1312(%rbp), %al
	testb	%al, %al
	je	LBB1_11
## %bb.9:
	leaq	-1311(%rbp), %rbx
	.p2align	4, 0x90
LBB1_10:                                ## =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	___tolower
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %eax
	incq	%rbx
	testb	%al, %al
	jne	LBB1_10
LBB1_11:
	movb	-1376(%rbp), %al
	testb	%al, %al
	je	LBB1_14
## %bb.12:
	leaq	-1375(%rbp), %rbx
	.p2align	4, 0x90
LBB1_13:                                ## =>This Inner Loop Header: Depth=1
	movsbl	%al, %edi
	callq	___tolower
	movb	%al, -1(%rbx)
	movzbl	(%rbx), %eax
	incq	%rbx
	testb	%al, %al
	jne	LBB1_13
LBB1_14:
	movabsq	$8676592001280189733, %rax ## imm = 0x78697274614D2525
	xorq	-1120(%rbp), %rax
	movabsq	$8387228020050327657, %rcx ## imm = 0x74656B72614D7869
	xorq	-1114(%rbp), %rcx
	orq	%rax, %rcx
	movl	$14, %ebx
	jne	LBB1_37
## %bb.15:
	movl	$1920229741, %eax       ## imm = 0x7274616D
	xorl	-1184(%rbp), %eax
	movl	$7891314, %ecx          ## imm = 0x786972
	xorl	-1181(%rbp), %ecx
	orl	%eax, %ecx
	movl	$15, %ebx
	jne	LBB1_37
## %bb.16:
	movb	$77, (%r14)
	movabsq	$7020664749254733667, %rax ## imm = 0x616E6964726F6F63
	xorq	-1248(%rbp), %rax
	movabsq	$28556934460826738, %rcx ## imm = 0x6574616E696472
	xorq	-1245(%rbp), %rcx
	orq	%rax, %rcx
	je	LBB1_17
## %bb.18:
	movl	$1634890337, %eax       ## imm = 0x61727261
	xorl	-1248(%rbp), %eax
	movzwl	-1244(%rbp), %ecx
	xorl	$121, %ecx
	orl	%eax, %ecx
	jne	LBB1_37
## %bb.19:
	movb	$65, %al
	jmp	LBB1_20
LBB1_17:
	movb	$67, %al
LBB1_20:
	movb	%al, 1(%r14)
	movl	$1818322290, %eax       ## imm = 0x6C616572
	xorl	-1312(%rbp), %eax
	movzbl	-1308(%rbp), %ecx
	orl	%eax, %ecx
	je	LBB1_21
## %bb.22:
	movq	-1312(%rbp), %rax
	movabsq	$33888513622372195, %rcx ## imm = 0x78656C706D6F63
	cmpq	%rcx, %rax
	je	LBB1_23
## %bb.24:
	movabsq	$32199642103180905, %rcx ## imm = 0x72656765746E69
	cmpq	%rcx, %rax
	je	LBB1_27
## %bb.25:
	movabsq	$31088027509219696, %rcx ## imm = 0x6E726574746170
	cmpq	%rcx, %rax
	jne	LBB1_37
## %bb.26:
	movb	$80, %al
	movb	%al, 2(%r14)
	movabsq	$30506441440650599, %rax ## imm = 0x6C6172656E6567
	cmpq	%rax, -1376(%rbp)
	je	LBB1_29
	jmp	LBB1_30
LBB1_21:
	movb	$82, %al
	movb	%al, 2(%r14)
	movabsq	$30506441440650599, %rax ## imm = 0x6C6172656E6567
	cmpq	%rax, -1376(%rbp)
	je	LBB1_29
	jmp	LBB1_30
LBB1_23:
	movb	$67, %al
	movb	%al, 2(%r14)
	movabsq	$30506441440650599, %rax ## imm = 0x6C6172656E6567
	cmpq	%rax, -1376(%rbp)
	je	LBB1_29
	jmp	LBB1_30
LBB1_27:
	movb	$73, %al
	movb	%al, 2(%r14)
	movabsq	$30506441440650599, %rax ## imm = 0x6C6172656E6567
	cmpq	%rax, -1376(%rbp)
	jne	LBB1_30
LBB1_29:
	movb	$71, 3(%r14)
	jmp	LBB1_36
LBB1_30:
	movabsq	$7598263500303858035, %rax ## imm = 0x697274656D6D7973
	xorq	-1376(%rbp), %rax
	movzwl	-1368(%rbp), %ecx
	xorq	$99, %rcx
	orq	%rax, %rcx
	je	LBB1_31
## %bb.32:
	movabsq	$7019269490390230376, %rax ## imm = 0x616974696D726568
	xorq	-1376(%rbp), %rax
	movzwl	-1368(%rbp), %ecx
	xorq	$110, %rcx
	orq	%rax, %rcx
	je	LBB1_33
## %bb.34:
	movabsq	$7888462861429992307, %rax ## imm = 0x6D79732D77656B73
	xorq	-1376(%rbp), %rax
	movabsq	$27981962994347373, %rcx ## imm = 0x63697274656D6D
	xorq	-1369(%rbp), %rcx
	orq	%rax, %rcx
	jne	LBB1_37
## %bb.35:
	movb	$75, 3(%r14)
	jmp	LBB1_36
LBB1_31:
	movb	$83, 3(%r14)
	jmp	LBB1_36
LBB1_33:
	movb	$72, 3(%r14)
LBB1_36:
	xorl	%ebx, %ebx
LBB1_37:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-24(%rbp), %rax
	jne	LBB1_39
## %bb.38:
	movl	%ebx, %eax
	addq	$1376, %rsp             ## imm = 0x560
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB1_39:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_typecode_to_str     ## -- Begin function mm_typecode_to_str
	.p2align	4, 0x90
_mm_typecode_to_str:                    ## @mm_typecode_to_str
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$1040, %rsp             ## imm = 0x410
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -24(%rbp)
	movb	1(%rdi), %al
	cmpb	$67, %al
	je	LBB2_1
## %bb.2:
	cmpb	$65, %al
	jne	LBB2_3
## %bb.4:
	leaq	L_.str.11(%rip), %r9
	jmp	LBB2_5
LBB2_1:
	leaq	L_.str.10(%rip), %r9
LBB2_5:
	movb	2(%rdi), %cl
	xorl	%eax, %eax
	addb	$-67, %cl
	cmpb	$15, %cl
	ja	LBB2_16
## %bb.6:
	leaq	L_.str.12(%rip), %r10
	movzbl	%cl, %ecx
	leaq	LJTI2_0(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rcx
	addq	%rdx, %rcx
	jmpq	*%rcx
LBB2_7:
	leaq	L_.str.13(%rip), %r10
	jmp	LBB2_10
LBB2_3:
	xorl	%eax, %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-24(%rbp), %rcx
	je	LBB2_17
	jmp	LBB2_18
LBB2_9:
	leaq	L_.str.15(%rip), %r10
	jmp	LBB2_10
LBB2_8:
	leaq	L_.str.14(%rip), %r10
LBB2_10:
	movb	3(%rdi), %cl
	xorl	%eax, %eax
	addb	$-71, %cl
	cmpb	$12, %cl
	ja	LBB2_16
## %bb.11:
	leaq	L_.str.16(%rip), %rbx
	movzbl	%cl, %ecx
	leaq	LJTI2_1(%rip), %rdx
	movslq	(%rdx,%rcx,4), %rcx
	addq	%rdx, %rcx
	jmpq	*%rcx
LBB2_13:
	leaq	L_.str.18(%rip), %rbx
	jmp	LBB2_15
LBB2_14:
	leaq	L_.str.19(%rip), %rbx
	jmp	LBB2_15
LBB2_12:
	leaq	L_.str.17(%rip), %rbx
LBB2_15:
	leaq	L_.str.33(%rip), %rcx
	leaq	L_.str.9(%rip), %r8
	leaq	-1056(%rbp), %r14
	movl	$1025, %edx             ## imm = 0x401
	movq	%r14, %rdi
	movl	$0, %esi
	xorl	%eax, %eax
	pushq	%rbx
	pushq	%r10
	callq	___sprintf_chk
	addq	$16, %rsp
	movq	%r14, %rdi
	callq	_strlen
	shlq	$32, %rax
	movabsq	$4294967296, %rdi       ## imm = 0x100000000
	addq	%rax, %rdi
	sarq	$32, %rdi
	callq	_malloc
	movq	%rax, %rdi
	movq	%r14, %rsi
	callq	_strcpy
LBB2_16:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	-24(%rbp), %rcx
	jne	LBB2_18
LBB2_17:
	addq	$1040, %rsp             ## imm = 0x410
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
LBB2_18:
	callq	___stack_chk_fail
	.cfi_endproc
	.p2align	2, 0x90
	.data_region jt32
.set L2_0_set_7, LBB2_7-LJTI2_0
.set L2_0_set_16, LBB2_16-LJTI2_0
.set L2_0_set_9, LBB2_9-LJTI2_0
.set L2_0_set_8, LBB2_8-LJTI2_0
.set L2_0_set_10, LBB2_10-LJTI2_0
LJTI2_0:
	.long	L2_0_set_7
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_9
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_16
	.long	L2_0_set_8
	.long	L2_0_set_16
	.long	L2_0_set_10
.set L2_1_set_15, LBB2_15-LJTI2_1
.set L2_1_set_13, LBB2_13-LJTI2_1
.set L2_1_set_16, LBB2_16-LJTI2_1
.set L2_1_set_14, LBB2_14-LJTI2_1
.set L2_1_set_12, LBB2_12-LJTI2_1
LJTI2_1:
	.long	L2_1_set_15
	.long	L2_1_set_13
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_14
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_16
	.long	L2_1_set_12
	.end_data_region
                                        ## -- End function
	.globl	_mm_read_mtx_crd_size   ## -- Begin function mm_read_mtx_crd_size
	.p2align	4, 0x90
_mm_read_mtx_crd_size:                  ## @mm_read_mtx_crd_size
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1064, %rsp             ## imm = 0x428
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r15
	movq	%rsi, %r12
	movq	%rdi, %r13
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	%rcx, -1096(%rbp)       ## 8-byte Spill
	movl	$0, (%rcx)
	movl	$0, (%rdx)
	movl	$0, (%rsi)
	leaq	-1088(%rbp), %r14
	movl	$12, %ebx
	.p2align	4, 0x90
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	$1025, %esi             ## imm = 0x401
	movq	%r13, %rdx
	callq	_fgets
	testq	%rax, %rax
	je	LBB3_9
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	cmpb	$37, -1088(%rbp)
	je	LBB3_1
## %bb.3:
	leaq	L_.str.21(%rip), %rsi
	xorl	%ebx, %ebx
	leaq	-1088(%rbp), %rdi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movq	-1096(%rbp), %r14       ## 8-byte Reload
	movq	%r14, %r8
	xorl	%eax, %eax
	callq	_sscanf
	cmpl	$3, %eax
	je	LBB3_9
## %bb.4:
	leaq	L_.str.21(%rip), %rbx
	.p2align	4, 0x90
LBB3_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	movq	%r15, %rcx
	movq	%r14, %r8
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$3, %eax
	je	LBB3_8
## %bb.6:                               ##   in Loop: Header=BB3_5 Depth=1
	cmpl	$-1, %eax
	jne	LBB3_5
## %bb.7:
	movl	$12, %ebx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB3_10
	jmp	LBB3_11
LBB3_8:
	xorl	%ebx, %ebx
LBB3_9:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB3_11
LBB3_10:
	movl	%ebx, %eax
	addq	$1064, %rsp             ## imm = 0x428
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_11:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_is_valid            ## -- Begin function mm_is_valid
	.p2align	4, 0x90
_mm_is_valid:                           ## @mm_is_valid
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	xorl	%eax, %eax
	cmpb	$77, (%rdi)
	jne	LBB4_9
## %bb.1:
	movb	2(%rdi), %cl
	cmpb	$65, 1(%rdi)
	jne	LBB4_3
## %bb.2:
	cmpb	$80, %cl
	je	LBB4_9
LBB4_3:
	cmpb	$80, %cl
	je	LBB4_6
## %bb.4:
	cmpb	$82, %cl
	jne	LBB4_8
## %bb.5:
	cmpb	$72, 3(%rdi)
	jne	LBB4_8
	jmp	LBB4_9
LBB4_6:
	movb	3(%rdi), %cl
	cmpb	$72, %cl
	je	LBB4_9
## %bb.7:
	cmpb	$75, %cl
	je	LBB4_9
LBB4_8:
	movl	$1, %eax
LBB4_9:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_write_mtx_crd_size  ## -- Begin function mm_write_mtx_crd_size
	.p2align	4, 0x90
_mm_write_mtx_crd_size:                 ## @mm_write_mtx_crd_size
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	%esi, %edx
	leaq	L_.str.20(%rip), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	_fprintf
	cmpl	$3, %eax
	movl	$17, %eax
	cmovel	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_read_mtx_array_size ## -- Begin function mm_read_mtx_array_size
	.p2align	4, 0x90
_mm_read_mtx_array_size:                ## @mm_read_mtx_array_size
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1048, %rsp             ## imm = 0x418
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %r12
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	$0, (%rdx)
	movl	$0, (%rsi)
	leaq	-1088(%rbp), %r13
	movl	$12, %ebx
	.p2align	4, 0x90
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	movl	$1025, %esi             ## imm = 0x401
	movq	%r12, %rdx
	callq	_fgets
	testq	%rax, %rax
	je	LBB6_9
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	cmpb	$37, -1088(%rbp)
	je	LBB6_1
## %bb.3:
	leaq	L_.str.22(%rip), %rsi
	xorl	%ebx, %ebx
	leaq	-1088(%rbp), %rdi
	movq	%r15, %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	_sscanf
	cmpl	$2, %eax
	je	LBB6_9
## %bb.4:
	leaq	L_.str.22(%rip), %rbx
	.p2align	4, 0x90
LBB6_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	movq	%rbx, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$2, %eax
	je	LBB6_8
## %bb.6:                               ##   in Loop: Header=BB6_5 Depth=1
	cmpl	$-1, %eax
	jne	LBB6_5
## %bb.7:
	movl	$12, %ebx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB6_10
	jmp	LBB6_11
LBB6_8:
	xorl	%ebx, %ebx
LBB6_9:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB6_11
LBB6_10:
	movl	%ebx, %eax
	addq	$1048, %rsp             ## imm = 0x418
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB6_11:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_write_mtx_array_size ## -- Begin function mm_write_mtx_array_size
	.p2align	4, 0x90
_mm_write_mtx_array_size:               ## @mm_write_mtx_array_size
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movl	%edx, %ecx
	movl	%esi, %edx
	leaq	L_.str.23(%rip), %rsi
	xorl	%ebx, %ebx
	xorl	%eax, %eax
	callq	_fprintf
	cmpl	$2, %eax
	movl	$17, %eax
	cmovel	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_read_mtx_crd_data   ## -- Begin function mm_read_mtx_crd_data
	.p2align	4, 0x90
_mm_read_mtx_crd_data:                  ## @mm_read_mtx_crd_data
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r14
	movq	%r8, %rbx
	movq	%rdi, %r15
	movq	16(%rbp), %r12
	movq	24(%rbp), %rax
	movb	2(%rax), %dl
	cmpb	$67, %dl
	je	LBB8_8
## %bb.1:
	cmpb	$82, %dl
	je	LBB8_13
## %bb.2:
	movl	$15, %eax
	cmpb	$80, %dl
	jne	LBB8_22
## %bb.3:
	testl	%ecx, %ecx
	jle	LBB8_21
## %bb.4:
	movslq	%ecx, %r13
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB8_5:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	leaq	L_.str.22(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$2, %eax
	jne	LBB8_18
## %bb.6:                               ##   in Loop: Header=BB8_5 Depth=1
	incq	%r12
	addq	$4, %r14
	addq	$4, %rbx
	cmpq	%r13, %r12
	jl	LBB8_5
	jmp	LBB8_21
LBB8_8:
	testl	%ecx, %ecx
	jle	LBB8_21
## %bb.9:
	movslq	%ecx, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB8_10:                                ## =>This Inner Loop Header: Depth=1
	leaq	8(%r12), %r9
	movq	%r15, %rdi
	leaq	L_.str.24(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r12, %r8
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$4, %eax
	jne	LBB8_18
## %bb.11:                              ##   in Loop: Header=BB8_10 Depth=1
	incq	%r13
	addq	$4, %r14
	addq	$4, %rbx
	addq	$16, %r12
	cmpq	-48(%rbp), %r13         ## 8-byte Folded Reload
	jl	LBB8_10
	jmp	LBB8_21
LBB8_13:
	testl	%ecx, %ecx
	jle	LBB8_21
## %bb.14:
	movslq	%ecx, %rax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	xorl	%r13d, %r13d
	.p2align	4, 0x90
LBB8_15:                                ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	leaq	L_.str.6(%rip), %rsi
	movq	%rbx, %rdx
	movq	%r14, %rcx
	movq	%r12, %r8
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$3, %eax
	jne	LBB8_18
## %bb.16:                              ##   in Loop: Header=BB8_15 Depth=1
	incq	%r13
	addq	$8, %r12
	addq	$4, %r14
	addq	$4, %rbx
	cmpq	-48(%rbp), %r13         ## 8-byte Folded Reload
	jl	LBB8_15
LBB8_21:
	xorl	%eax, %eax
	jmp	LBB8_22
LBB8_18:
	movl	$12, %eax
LBB8_22:
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_read_mtx_crd_entry  ## -- Begin function mm_read_mtx_crd_entry
	.p2align	4, 0x90
_mm_read_mtx_crd_entry:                 ## @mm_read_mtx_crd_entry
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%r8, %r10
	movq	%rcx, %r8
	movq	%rdx, %r11
	movq	%rsi, %rdx
	movb	2(%r9), %cl
	cmpb	$82, %cl
	je	LBB9_4
## %bb.1:
	cmpb	$80, %cl
	je	LBB9_5
## %bb.2:
	movl	$15, %eax
	cmpb	$67, %cl
	jne	LBB9_7
## %bb.3:
	leaq	L_.str.24(%rip), %rsi
	movq	%r11, %rcx
	movq	%r10, %r9
	xorl	%eax, %eax
	callq	_fscanf
	movl	%eax, %ecx
	movl	$12, %eax
	cmpl	$4, %ecx
	je	LBB9_6
	jmp	LBB9_7
LBB9_4:
	leaq	L_.str.6(%rip), %rsi
	movq	%r11, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	%eax, %ecx
	movl	$12, %eax
	cmpl	$3, %ecx
	je	LBB9_6
	jmp	LBB9_7
LBB9_5:
	leaq	L_.str.22(%rip), %rsi
	movq	%r11, %rcx
	xorl	%eax, %eax
	callq	_fscanf
	movl	%eax, %ecx
	movl	$12, %eax
	cmpl	$2, %ecx
	jne	LBB9_7
LBB9_6:
	xorl	%eax, %eax
LBB9_7:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_read_mtx_crd        ## -- Begin function mm_read_mtx_crd
	.p2align	4, 0x90
_mm_read_mtx_crd:                       ## @mm_read_mtx_crd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$1080, %rsp             ## imm = 0x438
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r12
	movq	%r8, -1096(%rbp)        ## 8-byte Spill
	movq	%rcx, -1104(%rbp)       ## 8-byte Spill
	movq	%rdx, %r14
	movq	%rsi, %r15
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	leaq	L_.str.25(%rip), %rsi
	callq	_strcmp
	testl	%eax, %eax
	je	LBB10_1
## %bb.9:
	leaq	L_.str(%rip), %rsi
	movq	%rbx, %rdi
	callq	_fopen
	movq	%rax, %rbx
	testq	%rax, %rax
	jne	LBB10_2
## %bb.10:
	movl	$11, %r12d
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB10_33
	jmp	LBB10_34
LBB10_1:
	movq	___stdinp@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
LBB10_2:
	movq	%r12, -1112(%rbp)       ## 8-byte Spill
	movq	24(%rbp), %r13
	movq	%rbx, %rdi
	movq	%r13, %rsi
	callq	_mm_read_banner
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	LBB10_32
## %bb.3:
	movl	$15, %r12d
	cmpb	$77, (%r13)
	jne	LBB10_32
## %bb.4:
	movb	1(%r13), %al
	movb	2(%r13), %cl
	cmpb	$65, %al
	jne	LBB10_6
## %bb.5:
	cmpb	$80, %cl
	je	LBB10_32
LBB10_6:
	cmpb	$80, %cl
	je	LBB10_11
## %bb.7:
	cmpb	$82, %cl
	jne	LBB10_13
## %bb.8:
	cmpb	$72, 3(%r13)
	jne	LBB10_13
	jmp	LBB10_32
LBB10_11:
	movb	3(%r13), %cl
	cmpb	$72, %cl
	je	LBB10_32
## %bb.12:
	cmpb	$75, %cl
	je	LBB10_32
LBB10_13:
	cmpb	$67, %al
	jne	LBB10_32
## %bb.14:
	movq	-1104(%rbp), %rax       ## 8-byte Reload
	movl	$0, (%rax)
	movl	$0, (%r14)
	movl	$0, (%r15)
	leaq	-1088(%rbp), %r12
	.p2align	4, 0x90
LBB10_15:                               ## =>This Inner Loop Header: Depth=1
	movq	%r12, %rdi
	movl	$1025, %esi             ## imm = 0x401
	movq	%rbx, %rdx
	callq	_fgets
	testq	%rax, %rax
	je	LBB10_21
## %bb.16:                              ##   in Loop: Header=BB10_15 Depth=1
	cmpb	$37, -1088(%rbp)
	je	LBB10_15
## %bb.17:
	leaq	L_.str.21(%rip), %rsi
	leaq	-1088(%rbp), %rdi
	movq	%r15, %rdx
	movq	%r14, %rcx
	movq	-1104(%rbp), %r8        ## 8-byte Reload
	xorl	%eax, %eax
	callq	_sscanf
	cmpl	$3, %eax
	je	LBB10_22
## %bb.18:
	leaq	L_.str.21(%rip), %r12
	.p2align	4, 0x90
LBB10_19:                               ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movq	%r12, %rsi
	movq	%r15, %rdx
	movq	%r14, %rcx
	movq	-1104(%rbp), %r8        ## 8-byte Reload
	xorl	%eax, %eax
	callq	_fscanf
	cmpl	$3, %eax
	je	LBB10_22
## %bb.20:                              ##   in Loop: Header=BB10_19 Depth=1
	cmpl	$-1, %eax
	jne	LBB10_19
LBB10_21:
	movl	$12, %r12d
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB10_33
	jmp	LBB10_34
LBB10_22:
	movq	-1104(%rbp), %rax       ## 8-byte Reload
	movslq	(%rax), %r14
	leaq	(,%r14,4), %r15
	movq	%r15, %rdi
	callq	_malloc
	movq	-1096(%rbp), %rcx       ## 8-byte Reload
	movq	%rax, (%rcx)
	movq	%r15, %rdi
	callq	_malloc
	movq	-1112(%rbp), %r15       ## 8-byte Reload
	movq	%rax, (%r15)
	movq	16(%rbp), %r12
	movq	$0, (%r12)
	movb	2(%r13), %al
	cmpb	$82, %al
	je	LBB10_26
## %bb.23:
	cmpb	$80, %al
	je	LBB10_28
## %bb.24:
	cmpb	$67, %al
	jne	LBB10_30
## %bb.25:
	movq	%r14, %rdi
	shlq	$4, %rdi
	callq	_malloc
	movq	%rax, (%r12)
	movq	-1096(%rbp), %rcx       ## 8-byte Reload
	movq	(%rcx), %r8
	movq	-1112(%rbp), %rcx       ## 8-byte Reload
	movq	(%rcx), %r9
	jmp	LBB10_27
LBB10_26:
	movq	%r14, %rdi
	shlq	$3, %rdi
	callq	_malloc
	movq	%rax, (%r12)
	movq	-1096(%rbp), %rcx       ## 8-byte Reload
	movq	(%rcx), %r8
	movq	(%r15), %r9
LBB10_27:
	movq	%rbx, %rdi
	movl	%r14d, %ecx
	pushq	%r13
	pushq	%rax
	jmp	LBB10_29
LBB10_28:
	movq	-1096(%rbp), %rax       ## 8-byte Reload
	movq	(%rax), %r8
	movq	(%r15), %r9
	movq	%rbx, %rdi
	movl	%r14d, %ecx
	pushq	%r13
	pushq	$0
LBB10_29:
	callq	_mm_read_mtx_crd_data
	addq	$16, %rsp
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	LBB10_32
LBB10_30:
	movq	___stdinp@GOTPCREL(%rip), %rax
	xorl	%r12d, %r12d
	cmpq	(%rax), %rbx
	je	LBB10_32
## %bb.31:
	movq	%rbx, %rdi
	callq	_fclose
LBB10_32:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB10_34
LBB10_33:
	movl	%r12d, %eax
	addq	$1080, %rsp             ## imm = 0x438
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB10_34:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_write_banner        ## -- Begin function mm_write_banner
	.p2align	4, 0x90
_mm_write_banner:                       ## @mm_write_banner
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	%rsi, %rdi
	callq	_mm_typecode_to_str
	movq	%rax, %rbx
	leaq	L_.str.26(%rip), %rsi
	leaq	L_.str.8(%rip), %rdx
	xorl	%r15d, %r15d
	movq	%r14, %rdi
	movq	%rax, %rcx
	xorl	%eax, %eax
	callq	_fprintf
	movl	%eax, %r14d
	movq	%rbx, %rdi
	callq	_free
	cmpl	$2, %r14d
	movl	$17, %eax
	cmovel	%r15d, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_write_mtx_crd       ## -- Begin function mm_write_mtx_crd
	.p2align	4, 0x90
_mm_write_mtx_crd:                      ## @mm_write_mtx_crd
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%r9, %r15
	movq	%r8, %r13
	movl	%ecx, %r14d
	movl	%edx, %r12d
	movl	%esi, -60(%rbp)         ## 4-byte Spill
	movq	%rdi, %rbx
	leaq	L_.str.27(%rip), %rsi
	callq	_strcmp
	testl	%eax, %eax
	movq	%r15, -56(%rbp)         ## 8-byte Spill
	je	LBB12_1
## %bb.9:
	leaq	L_.str.28(%rip), %rsi
	movq	%rbx, %rdi
	callq	_fopen
	movq	%rax, %r15
	testq	%rax, %rax
	jne	LBB12_2
## %bb.10:
	movl	$17, %r14d
	jmp	LBB12_20
LBB12_1:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
LBB12_2:
	movq	%r13, -48(%rbp)         ## 8-byte Spill
	movq	24(%rbp), %rbx
	movq	16(%rbp), %r13
	leaq	L_.str.29(%rip), %rsi
	leaq	L_.str.8(%rip), %rdx
	movq	%r15, %rdi
	xorl	%eax, %eax
	callq	_fprintf
	movq	%rbx, %rdi
	callq	_mm_typecode_to_str
	leaq	L_.str.30(%rip), %rsi
	movq	%r15, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	leaq	L_.str.20(%rip), %rsi
	movq	%r15, %rdi
	movl	-60(%rbp), %edx         ## 4-byte Reload
	movl	%r12d, %ecx
	movl	%r14d, %r8d
	xorl	%eax, %eax
	callq	_fprintf
	movb	2(%rbx), %al
	cmpb	$82, %al
	je	LBB12_11
## %bb.3:
	cmpb	$80, %al
	je	LBB12_14
## %bb.4:
	cmpb	$67, %al
	jne	LBB12_17
## %bb.5:
	testl	%r14d, %r14d
	movq	-56(%rbp), %r12         ## 8-byte Reload
	jle	LBB12_8
## %bb.6:
	movl	%r14d, %ebx
	addq	$8, %r13
	xorl	%r14d, %r14d
	.p2align	4, 0x90
LBB12_7:                                ## =>This Inner Loop Header: Depth=1
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	movl	(%rcx,%r14,4), %edx
	movl	(%r12,%r14,4), %ecx
	movsd	-8(%r13), %xmm0         ## xmm0 = mem[0],zero
	movsd	(%r13), %xmm1           ## xmm1 = mem[0],zero
	movq	%r15, %rdi
	leaq	L_.str.32(%rip), %rsi
	movb	$2, %al
	callq	_fprintf
	incq	%r14
	addq	$16, %r13
	cmpq	%r14, %rbx
	jne	LBB12_7
	jmp	LBB12_8
LBB12_11:
	testl	%r14d, %r14d
	movq	-48(%rbp), %rbx         ## 8-byte Reload
	jle	LBB12_8
## %bb.12:
	movl	%r14d, %r14d
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB12_13:                               ## =>This Inner Loop Header: Depth=1
	movl	(%rbx,%r12,4), %edx
	movq	-56(%rbp), %rax         ## 8-byte Reload
	movl	(%rax,%r12,4), %ecx
	movsd	(%r13,%r12,8), %xmm0    ## xmm0 = mem[0],zero
	movq	%r15, %rdi
	leaq	L_.str.31(%rip), %rsi
	movb	$1, %al
	callq	_fprintf
	incq	%r12
	cmpq	%r12, %r14
	jne	LBB12_13
	jmp	LBB12_8
LBB12_14:
	testl	%r14d, %r14d
	movq	-56(%rbp), %r13         ## 8-byte Reload
	movq	-48(%rbp), %r12         ## 8-byte Reload
	jle	LBB12_8
## %bb.15:
	movl	%r14d, %r14d
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB12_16:                               ## =>This Inner Loop Header: Depth=1
	movl	(%r12,%rbx,4), %edx
	movl	(%r13,%rbx,4), %ecx
	movq	%r15, %rdi
	leaq	L_.str.23(%rip), %rsi
	xorl	%eax, %eax
	callq	_fprintf
	incq	%rbx
	cmpq	%rbx, %r14
	jne	LBB12_16
LBB12_8:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	xorl	%r14d, %r14d
	cmpq	(%rax), %r15
	je	LBB12_20
LBB12_19:
	movq	%r15, %rdi
	callq	_fclose
LBB12_20:
	movl	%r14d, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB12_17:
	movq	___stdoutp@GOTPCREL(%rip), %rax
	movl	$15, %r14d
	cmpq	(%rax), %r15
	jne	LBB12_19
	jmp	LBB12_20
	.cfi_endproc
                                        ## -- End function
	.globl	_mm_strdup              ## -- Begin function mm_strdup
	.p2align	4, 0x90
_mm_strdup:                             ## @mm_strdup
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	callq	_strlen
	shlq	$32, %rax
	movabsq	$4294967296, %rdi       ## imm = 0x100000000
	addq	%rax, %rdi
	sarq	$32, %rdi
	callq	_malloc
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	_strcpy
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"r"

L_.str.1:                               ## @.str.1
	.asciz	"mm_read_unsymetric: Could not process Matrix Market banner "

L_.str.2:                               ## @.str.2
	.asciz	" in file [%s]\n"

L_.str.3:                               ## @.str.3
	.asciz	"Sorry, this application does not support "

L_.str.4:                               ## @.str.4
	.asciz	"Market Market type: [%s]\n"

L_.str.5:                               ## @.str.5
	.asciz	"read_unsymmetric_sparse(): could not parse matrix size.\n"

L_.str.6:                               ## @.str.6
	.asciz	"%d %d %lg\n"

L_.str.7:                               ## @.str.7
	.asciz	"%s %s %s %s %s"

L_.str.8:                               ## @.str.8
	.asciz	"%%MatrixMarket"

L_.str.9:                               ## @.str.9
	.asciz	"matrix"

L_.str.10:                              ## @.str.10
	.asciz	"coordinate"

L_.str.11:                              ## @.str.11
	.asciz	"array"

L_.str.12:                              ## @.str.12
	.asciz	"real"

L_.str.13:                              ## @.str.13
	.asciz	"complex"

L_.str.14:                              ## @.str.14
	.asciz	"pattern"

L_.str.15:                              ## @.str.15
	.asciz	"integer"

L_.str.16:                              ## @.str.16
	.asciz	"general"

L_.str.17:                              ## @.str.17
	.asciz	"symmetric"

L_.str.18:                              ## @.str.18
	.asciz	"hermitian"

L_.str.19:                              ## @.str.19
	.asciz	"skew-symmetric"

L_.str.20:                              ## @.str.20
	.asciz	"%d %d %d\n"

L_.str.21:                              ## @.str.21
	.asciz	"%d %d %d"

L_.str.22:                              ## @.str.22
	.asciz	"%d %d"

L_.str.23:                              ## @.str.23
	.asciz	"%d %d\n"

L_.str.24:                              ## @.str.24
	.asciz	"%d %d %lg %lg"

L_.str.25:                              ## @.str.25
	.asciz	"stdin"

L_.str.26:                              ## @.str.26
	.asciz	"%s %s\n"

L_.str.27:                              ## @.str.27
	.asciz	"stdout"

L_.str.28:                              ## @.str.28
	.asciz	"w"

L_.str.29:                              ## @.str.29
	.asciz	"%s "

L_.str.30:                              ## @.str.30
	.asciz	"%s\n"

L_.str.31:                              ## @.str.31
	.asciz	"%d %d %20.16g\n"

L_.str.32:                              ## @.str.32
	.asciz	"%d %d %20.16g %20.16g\n"

L_.str.33:                              ## @.str.33
	.asciz	"%s %s %s %s"


.subsections_via_symbols
