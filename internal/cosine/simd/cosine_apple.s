//go:build !noasm && darwin && arm64
// AUTO-GENERATED BY GOCC -- DO NOT EDIT

TEXT ·f32_cosine_distance(SB), $0-32
	MOVD x+0(FP), R0
	MOVD y+8(FP), R1
	MOVD result+16(FP), R2
	MOVD size+24(FP), R3
	WORD $0xa9bf7bfd       // stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	WORD $0x910003fd       // mov	x29, sp
	WORD $0x2f00e400       // movi	d0, #0000000000000000
	WORD $0xb4000103       // cbz	x3, LBB0_3
	WORD $0xf100407f       // cmp	x3, #16
	WORD $0x54000182       // b.hs	LBB0_4
	WORD $0xd2800008       // mov	x8, #0
	WORD $0x2f00e401       // movi	d1, #0000000000000000
	WORD $0x2f00e405       // movi	d5, #0000000000000000
	WORD $0x2f00e411       // movi	d17, #0000000000000000
	WORD $0x1400003a       // b	LBB0_7

BB0_3:
	WORD $0x2f00e402 // movi	d2, #0000000000000000
	WORD $0x2f00e401 // movi	d1, #0000000000000000
	WORD $0x1e21c042 // fsqrt	s2, s2
	WORD $0x1e202048 // fcmp	s2, #0.0
	WORD $0x540008a0 // b.eq	LBB0_10
	WORD $0x14000047 // b	LBB0_11

BB0_4:
	WORD $0x6f00e401 // movi.2d	v1, #0000000000000000
	WORD $0x927cec68 // and	x8, x3, #0xfffffffffffffff0
	WORD $0x6f00e402 // movi.2d	v2, #0000000000000000
	WORD $0x91008009 // add	x9, x0, #32
	WORD $0x6f00e403 // movi.2d	v3, #0000000000000000
	WORD $0x9100802a // add	x10, x1, #32
	WORD $0x6f00e404 // movi.2d	v4, #0000000000000000
	WORD $0xaa0803eb // mov	x11, x8
	WORD $0x6f00e405 // movi.2d	v5, #0000000000000000
	WORD $0x6f00e406 // movi.2d	v6, #0000000000000000
	WORD $0x6f00e407 // movi.2d	v7, #0000000000000000
	WORD $0x6f00e410 // movi.2d	v16, #0000000000000000
	WORD $0x6f00e411 // movi.2d	v17, #0000000000000000
	WORD $0x6f00e412 // movi.2d	v18, #0000000000000000
	WORD $0x6f00e413 // movi.2d	v19, #0000000000000000
	WORD $0x6f00e414 // movi.2d	v20, #0000000000000000

BB0_5:
	WORD $0xad7f5935 // ldp	q21, q22, [x9, #-32]
	WORD $0xacc26137 // ldp	q23, q24, [x9], #64
	WORD $0xad7f6959 // ldp	q25, q26, [x10, #-32]
	WORD $0xacc2715b // ldp	q27, q28, [x10], #64
	WORD $0x4e35cf21 // fmla.4s	v1, v25, v21
	WORD $0x4e36cf42 // fmla.4s	v2, v26, v22
	WORD $0x4e37cf63 // fmla.4s	v3, v27, v23
	WORD $0x4e38cf84 // fmla.4s	v4, v28, v24
	WORD $0x4e35cea5 // fmla.4s	v5, v21, v21
	WORD $0x4e36cec6 // fmla.4s	v6, v22, v22
	WORD $0x4e37cee7 // fmla.4s	v7, v23, v23
	WORD $0x4e38cf10 // fmla.4s	v16, v24, v24
	WORD $0x4e39cf31 // fmla.4s	v17, v25, v25
	WORD $0x4e3acf52 // fmla.4s	v18, v26, v26
	WORD $0x4e3bcf73 // fmla.4s	v19, v27, v27
	WORD $0x4e3ccf94 // fmla.4s	v20, v28, v28
	WORD $0xf100416b // subs	x11, x11, #16
	WORD $0x54fffde1 // b.ne	LBB0_5
	WORD $0x4e31d651 // fadd.4s	v17, v18, v17
	WORD $0x4e31d671 // fadd.4s	v17, v19, v17
	WORD $0x4e31d691 // fadd.4s	v17, v20, v17
	WORD $0x6e31d631 // faddp.4s	v17, v17, v17
	WORD $0x7e30da31 // faddp.2s	s17, v17
	WORD $0x4e25d4c5 // fadd.4s	v5, v6, v5
	WORD $0x4e25d4e5 // fadd.4s	v5, v7, v5
	WORD $0x4e25d605 // fadd.4s	v5, v16, v5
	WORD $0x6e25d4a5 // faddp.4s	v5, v5, v5
	WORD $0x7e30d8a5 // faddp.2s	s5, v5
	WORD $0x4e21d441 // fadd.4s	v1, v2, v1
	WORD $0x4e21d461 // fadd.4s	v1, v3, v1
	WORD $0x4e21d481 // fadd.4s	v1, v4, v1
	WORD $0x6e21d421 // faddp.4s	v1, v1, v1
	WORD $0x7e30d821 // faddp.2s	s1, v1
	WORD $0xeb03011f // cmp	x8, x3
	WORD $0x54000180 // b.eq	LBB0_9

BB0_7:
	WORD $0xcb080069 // sub	x9, x3, x8
	WORD $0xd37ef50a // lsl	x10, x8, #2
	WORD $0x8b0a0028 // add	x8, x1, x10
	WORD $0x8b0a000a // add	x10, x0, x10

BB0_8:
	WORD $0xbc404542 // ldr	s2, [x10], #4
	WORD $0xbc404503 // ldr	s3, [x8], #4
	WORD $0x1f020461 // fmadd	s1, s3, s2, s1
	WORD $0x1f021445 // fmadd	s5, s2, s2, s5
	WORD $0x1f034471 // fmadd	s17, s3, s3, s17
	WORD $0xf1000529 // subs	x9, x9, #1
	WORD $0x54ffff41 // b.ne	LBB0_8

BB0_9:
	WORD $0x1e3108a2 // fmul	s2, s5, s17
	WORD $0x1e22c021 // fcvt	d1, s1
	WORD $0x1e21c042 // fsqrt	s2, s2
	WORD $0x1e202048 // fcmp	s2, #0.0
	WORD $0x54000081 // b.ne	LBB0_11

BB0_10:
	WORD $0xfd000040 // str	d0, [x2]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret

BB0_11:
	WORD $0x1e22c040 // fcvt	d0, s2
	WORD $0x1e601820 // fdiv	d0, d1, d0
	WORD $0xfd000040 // str	d0, [x2]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret

TEXT ·f32_dot_product(SB), $0-32
	MOVD x+0(FP), R0
	MOVD y+8(FP), R1
	MOVD result+16(FP), R2
	MOVD size+24(FP), R3
	WORD $0xa9bf7bfd       // stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	WORD $0x910003fd       // mov	x29, sp
	WORD $0xb40000c3       // cbz	x3, LBB1_3
	WORD $0xf100207f       // cmp	x3, #8
	WORD $0x54000102       // b.hs	LBB1_4
	WORD $0xd2800008       // mov	x8, #0
	WORD $0x2f00e400       // movi	d0, #0000000000000000
	WORD $0x14000018       // b	LBB1_7

BB1_3:
	WORD $0x2f00e400 // movi	d0, #0000000000000000
	WORD $0xfd000040 // str	d0, [x2]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret

BB1_4:
	WORD $0x927df068 // and	x8, x3, #0xfffffffffffffff8
	WORD $0x91004009 // add	x9, x0, #16
	WORD $0x9100402a // add	x10, x1, #16
	WORD $0x6f00e400 // movi.2d	v0, #0000000000000000
	WORD $0xaa0803eb // mov	x11, x8
	WORD $0x6f00e401 // movi.2d	v1, #0000000000000000

BB1_5:
	WORD $0xad7f8d22 // ldp	q2, q3, [x9, #-16]
	WORD $0xad7f9544 // ldp	q4, q5, [x10, #-16]
	WORD $0x4e22cc80 // fmla.4s	v0, v4, v2
	WORD $0x4e23cca1 // fmla.4s	v1, v5, v3
	WORD $0x91008129 // add	x9, x9, #32
	WORD $0x9100814a // add	x10, x10, #32
	WORD $0xf100216b // subs	x11, x11, #8
	WORD $0x54ffff21 // b.ne	LBB1_5
	WORD $0x4e20d420 // fadd.4s	v0, v1, v0
	WORD $0x6e20d400 // faddp.4s	v0, v0, v0
	WORD $0x7e30d800 // faddp.2s	s0, v0
	WORD $0xeb03011f // cmp	x8, x3
	WORD $0x54000140 // b.eq	LBB1_9

BB1_7:
	WORD $0xcb080069 // sub	x9, x3, x8
	WORD $0xd37ef50a // lsl	x10, x8, #2
	WORD $0x8b0a0028 // add	x8, x1, x10
	WORD $0x8b0a000a // add	x10, x0, x10

BB1_8:
	WORD $0xbc404541 // ldr	s1, [x10], #4
	WORD $0xbc404502 // ldr	s2, [x8], #4
	WORD $0x1f010040 // fmadd	s0, s2, s1, s0
	WORD $0xf1000529 // subs	x9, x9, #1
	WORD $0x54ffff81 // b.ne	LBB1_8

BB1_9:
	WORD $0x1e22c000 // fcvt	d0, s0
	WORD $0xfd000040 // str	d0, [x2]
	WORD $0xa8c17bfd // ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	WORD $0xd65f03c0 // ret
