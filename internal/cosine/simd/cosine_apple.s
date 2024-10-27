//go:build !noasm && darwin && arm64
// AUTO-GENERATED BY GOCC -- DO NOT EDIT

TEXT ·f32_cosine_distance(SB), $0-32
	MOVD x+0(FP), R0
	MOVD y+8(FP), R1
	MOVD size+16(FP), R2
	MOVD result+24(FP), R3
	WORD $0xa9bf7bfd       // stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	WORD $0x910003fd       // mov	x29, sp
	WORD $0xf100105f       // cmp	x2, #4
	WORD $0x54000223       // b.lo	LBB0_4
	WORD $0x6f00e400       // movi.2d	v0, #0000000000000000
	WORD $0x52800068       // mov	w8, #3
	WORD $0xaa0103e9       // mov	x9, x1
	WORD $0xaa0003ea       // mov	x10, x0
	WORD $0x6f00e401       // movi.2d	v1, #0000000000000000
	WORD $0x6f00e402       // movi.2d	v2, #0000000000000000

BB0_2:
	WORD $0x3cc10543 // ldr	q3, [x10], #16
	WORD $0x3cc10524 // ldr	q4, [x9], #16
	WORD $0x4e23cc80 // fmla.4s	v0, v4, v3
	WORD $0x4e23cc61 // fmla.4s	v1, v3, v3
	WORD $0x4e24cc82 // fmla.4s	v2, v4, v4
	WORD $0x91001108 // add	x8, x8, #4
	WORD $0xeb02011f // cmp	x8, x2
	WORD $0x54ffff23 // b.lo	LBB0_2
	WORD $0x927ef44b // and	x11, x2, #0xfffffffffffffffc
	WORD $0x14000005 // b	LBB0_5

BB0_4:
	WORD $0xd280000b // mov	x11, #0
	WORD $0x6f00e402 // movi.2d	v2, #0000000000000000
	WORD $0x6f00e401 // movi.2d	v1, #0000000000000000
	WORD $0x6f00e400 // movi.2d	v0, #0000000000000000

BB0_5:
	WORD $0x6e20d400 // faddp.4s	v0, v0, v0
	WORD $0x7e30d800 // faddp.2s	s0, v0
	WORD $0x6e21d421 // faddp.4s	v1, v1, v1
	WORD $0x7e30d821 // faddp.2s	s1, v1
	WORD $0x6e22d442 // faddp.4s	v2, v2, v2
	WORD $0x7e30d842 // faddp.2s	s2, v2
	WORD $0xeb02017f // cmp	x11, x2
	WORD $0x54000702 // b.hs	LBB0_13
	WORD $0xcb0b0049 // sub	x9, x2, x11
	WORD $0xf100213f // cmp	x9, #8
	WORD $0x54000062 // b.hs	LBB0_8
	WORD $0xaa0b03e8 // mov	x8, x11
	WORD $0x14000028 // b	LBB0_11

BB0_8:
	WORD $0x927df12a // and	x10, x9, #0xfffffffffffffff8
	WORD $0x8b0a0168 // add	x8, x11, x10
	WORD $0x6f00e403 // movi.2d	v3, #0000000000000000
	WORD $0x6f00e404 // movi.2d	v4, #0000000000000000
	WORD $0x6e040444 // mov.s	v4[0], v2[0]
	WORD $0x6f00e402 // movi.2d	v2, #0000000000000000
	WORD $0x6e040422 // mov.s	v2[0], v1[0]
	WORD $0x6f00e401 // movi.2d	v1, #0000000000000000
	WORD $0x6e040401 // mov.s	v1[0], v0[0]
	WORD $0xd37ef56b // lsl	x11, x11, #2
	WORD $0x9100416c // add	x12, x11, #16
	WORD $0x8b0c000b // add	x11, x0, x12
	WORD $0x8b0c002c // add	x12, x1, x12
	WORD $0xaa0a03ed // mov	x13, x10
	WORD $0x6f00e405 // movi.2d	v5, #0000000000000000
	WORD $0x6f00e400 // movi.2d	v0, #0000000000000000

BB0_9:
	WORD $0xad7f9d66 // ldp	q6, q7, [x11, #-16]
	WORD $0xad7fc590 // ldp	q16, q17, [x12, #-16]
	WORD $0x4e26ce01 // fmla.4s	v1, v16, v6
	WORD $0x4e27ce20 // fmla.4s	v0, v17, v7
	WORD $0x4e26ccc2 // fmla.4s	v2, v6, v6
	WORD $0x4e27cce5 // fmla.4s	v5, v7, v7
	WORD $0x4e30ce04 // fmla.4s	v4, v16, v16
	WORD $0x4e31ce23 // fmla.4s	v3, v17, v17
	WORD $0x9100816b // add	x11, x11, #32
	WORD $0x9100818c // add	x12, x12, #32
	WORD $0xf10021ad // subs	x13, x13, #8
	WORD $0x54fffea1 // b.ne	LBB0_9
	WORD $0x4e21d400 // fadd.4s	v0, v0, v1
	WORD $0x6e20d400 // faddp.4s	v0, v0, v0
	WORD $0x7e30d800 // faddp.2s	s0, v0
	WORD $0x4e22d4a1 // fadd.4s	v1, v5, v2
	WORD $0x6e21d421 // faddp.4s	v1, v1, v1
	WORD $0x7e30d821 // faddp.2s	s1, v1
	WORD $0x4e24d462 // fadd.4s	v2, v3, v4
	WORD $0x6e22d442 // faddp.4s	v2, v2, v2
	WORD $0x7e30d842 // faddp.2s	s2, v2
	WORD $0xeb0a013f // cmp	x9, x10
	WORD $0x54000180 // b.eq	LBB0_13

BB0_11:
	WORD $0xcb080049 // sub	x9, x2, x8
	WORD $0xd37ef50a // lsl	x10, x8, #2
	WORD $0x8b0a0028 // add	x8, x1, x10
	WORD $0x8b0a000a // add	x10, x0, x10

BB0_12:
	WORD $0xbc404543 // ldr	s3, [x10], #4
	WORD $0xbc404504 // ldr	s4, [x8], #4
	WORD $0x1f030080 // fmadd	s0, s4, s3, s0
	WORD $0x1f030461 // fmadd	s1, s3, s3, s1
	WORD $0x1f040882 // fmadd	s2, s4, s4, s2
	WORD $0xf1000529 // subs	x9, x9, #1
	WORD $0x54ffff41 // b.ne	LBB0_12

BB0_13:
	WORD $0x1e210841 // fmul	s1, s2, s1
	WORD $0x1e21c022 // fsqrt	s2, s1
	WORD $0x2f00e401 // movi	d1, #0000000000000000
	WORD $0x1e202048 // fcmp	s2, #0.0
	WORD $0x54000081 // b.ne	LBB0_15
	WORD $0xbd000061 // str	s1, [x3]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret

BB0_15:
	WORD $0x1e221800 // fdiv	s0, s0, s2
	WORD $0x1e2e1001 // fmov	s1, #1.00000000
	WORD $0x1e203821 // fsub	s1, s1, s0
	WORD $0xbd000061 // str	s1, [x3]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret
