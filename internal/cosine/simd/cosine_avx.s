//go:build !noasm && amd64
// AUTO-GENERATED BY GOCC -- DO NOT EDIT
DATA LCPI0_0<>+0x0000(SB)/4, $0x0000
GLOBL LCPI0_0<>(SB), (8+16), $4

TEXT ·f32_cosine_distance(SB), $0-32
	MOVQ x+0(FP), DI
	MOVQ y+8(FP), SI
	MOVQ size+16(FP), DX
	MOVQ result+24(FP), CX
	BYTE $0x55               // push	rbp
	WORD $0x8948; BYTE $0xe5 // mov	rbp, rsp
	BYTE $0x53               // push	rbx
	LONG $0xf8e48348         // and	rsp, -8
	LONG $0x08fa8348         // cmp	rdx, 8
	JB   LBB0_1
	LONG $0xf8428d48         // lea	rax, [rdx - 8]
	WORD $0x8949; BYTE $0xc1 // mov	r9, rax
	LONG $0x03e9c149         // shr	r9, 3
	WORD $0xff49; BYTE $0xc1 // inc	r9
	LONG $0x08f88348         // cmp	rax, 8
	JAE  LBB0_4
	LONG $0xc957f0c5         // vxorps	xmm1, xmm1, xmm1
	WORD $0x3145; BYTE $0xc0 // xor	r8d, r8d
	LONG $0xd257e8c5         // vxorps	xmm2, xmm2, xmm2
	LONG $0xc057f8c5         // vxorps	xmm0, xmm0, xmm0
	JMP  LBB0_6

LBB0_1:
	LONG $0xc057f8c5         // vxorps	xmm0, xmm0, xmm0
	WORD $0x3145; BYTE $0xc0 // xor	r8d, r8d
	LONG $0xd257e8c5         // vxorps	xmm2, xmm2, xmm2
	LONG $0xc957f0c5         // vxorps	xmm1, xmm1, xmm1
	JMP  LBB0_8

LBB0_4:
	WORD $0x894c; BYTE $0xc8 // mov	rax, r9
	LONG $0xfee08348         // and	rax, -2
	LONG $0xc957f0c5         // vxorps	xmm1, xmm1, xmm1
	WORD $0x3145; BYTE $0xc0 // xor	r8d, r8d
	LONG $0xd257e8c5         // vxorps	xmm2, xmm2, xmm2
	LONG $0xc057f8c5         // vxorps	xmm0, xmm0, xmm0

LBB0_5:
	LONG $0x107ca1c4; WORD $0x871c             // vmovups	ymm3, ymmword ptr [rdi + 4*r8]
	LONG $0x107ca1c4; WORD $0x8764; BYTE $0x20 // vmovups	ymm4, ymmword ptr [rdi + 4*r8 + 32]
	LONG $0x107ca1c4; WORD $0x862c             // vmovups	ymm5, ymmword ptr [rsi + 4*r8]
	LONG $0x107ca1c4; WORD $0x8674; BYTE $0x20 // vmovups	ymm6, ymmword ptr [rsi + 4*r8 + 32]
	LONG $0xb855e2c4; BYTE $0xcb               // vfmadd231ps	ymm1, ymm5, ymm3
	LONG $0xb865e2c4; BYTE $0xd3               // vfmadd231ps	ymm2, ymm3, ymm3
	LONG $0xb855e2c4; BYTE $0xc5               // vfmadd231ps	ymm0, ymm5, ymm5
	LONG $0xb84de2c4; BYTE $0xcc               // vfmadd231ps	ymm1, ymm6, ymm4
	LONG $0xb85de2c4; BYTE $0xd4               // vfmadd231ps	ymm2, ymm4, ymm4
	LONG $0xb84de2c4; BYTE $0xc6               // vfmadd231ps	ymm0, ymm6, ymm6
	LONG $0x10c08349                           // add	r8, 16
	LONG $0xfec08348                           // add	rax, -2
	JNE  LBB0_5

LBB0_6:
	LONG $0x01c1f641               // test	r9b, 1
	JE   LBB0_8
	LONG $0x107ca1c4; WORD $0x871c // vmovups	ymm3, ymmword ptr [rdi + 4*r8]
	LONG $0x107ca1c4; WORD $0x8624 // vmovups	ymm4, ymmword ptr [rsi + 4*r8]
	LONG $0xb85de2c4; BYTE $0xcb   // vfmadd231ps	ymm1, ymm4, ymm3
	LONG $0xb865e2c4; BYTE $0xd3   // vfmadd231ps	ymm2, ymm3, ymm3
	LONG $0xb85de2c4; BYTE $0xc4   // vfmadd231ps	ymm0, ymm4, ymm4
	LONG $0x08c08349               // add	r8, 8

LBB0_8:
	LONG $0x197de3c4; WORD $0x01cb // vextractf128	xmm3, ymm1, 1
	LONG $0xc958e0c5               // vaddps	xmm1, xmm3, xmm1
	LONG $0xd916fac5               // vmovshdup	xmm3, xmm1
	LONG $0xc958e0c5               // vaddps	xmm1, xmm3, xmm1
	LONG $0x0579e3c4; WORD $0x01d9 // vpermilpd	xmm3, xmm1, 1
	LONG $0xc958e2c5               // vaddss	xmm1, xmm3, xmm1
	LONG $0x197de3c4; WORD $0x01d3 // vextractf128	xmm3, ymm2, 1
	LONG $0xd258e0c5               // vaddps	xmm2, xmm3, xmm2
	LONG $0xda16fac5               // vmovshdup	xmm3, xmm2
	LONG $0xd258e0c5               // vaddps	xmm2, xmm3, xmm2
	LONG $0x0579e3c4; WORD $0x01da // vpermilpd	xmm3, xmm2, 1
	LONG $0xd258e2c5               // vaddss	xmm2, xmm3, xmm2
	LONG $0x197de3c4; WORD $0x01c3 // vextractf128	xmm3, ymm0, 1
	LONG $0xc058e0c5               // vaddps	xmm0, xmm3, xmm0
	LONG $0xd816fac5               // vmovshdup	xmm3, xmm0
	LONG $0xc058e0c5               // vaddps	xmm0, xmm3, xmm0
	LONG $0x0579e3c4; WORD $0x01d8 // vpermilpd	xmm3, xmm0, 1
	LONG $0xc058e2c5               // vaddss	xmm0, xmm3, xmm0
	WORD $0x3949; BYTE $0xd0       // cmp	r8, rdx
	JAE  LBB0_15
	WORD $0x8949; BYTE $0xd1       // mov	r9, rdx
	WORD $0x294d; BYTE $0xc1       // sub	r9, r8
	LONG $0x10f98349               // cmp	r9, 16
	JAE  LBB0_11
	WORD $0x894c; BYTE $0xc0       // mov	rax, r8
	JMP  LBB0_14

LBB0_11:
	WORD $0x894d; BYTE $0xca       // mov	r10, r9
	LONG $0xf0e28349               // and	r10, -16
	LONG $0x10048d4b               // lea	rax, [r8 + r10]
	LONG $0xdb57e0c5               // vxorps	xmm3, xmm3, xmm3
	LONG $0x0c61e3c4; WORD $0x01c0 // vblendps	xmm0, xmm3, xmm0, 1
	LONG $0x0c61e3c4; WORD $0x01c9 // vblendps	xmm1, xmm3, xmm1, 1
	LONG $0x0c61e3c4; WORD $0x01d2 // vblendps	xmm2, xmm3, xmm2, 1
	LONG $0x871c8d4e               // lea	r11, [rdi + 4*r8]
	LONG $0x20c38349               // add	r11, 32
	LONG $0x86048d4e               // lea	r8, [rsi + 4*r8]
	LONG $0x20c08349               // add	r8, 32
	LONG $0xdb57e0c5               // vxorps	xmm3, xmm3, xmm3
	WORD $0xdb31                   // xor	ebx, ebx
	LONG $0xe457d8c5               // vxorps	xmm4, xmm4, xmm4
	LONG $0xed57d0c5               // vxorps	xmm5, xmm5, xmm5

LBB0_12:
	LONG $0x107cc1c4; WORD $0x9b74; BYTE $0xe0 // vmovups	ymm6, ymmword ptr [r11 + 4*rbx - 32]
	LONG $0x107cc1c4; WORD $0x9b3c             // vmovups	ymm7, ymmword ptr [r11 + 4*rbx]
	LONG $0x107c41c4; WORD $0x9844; BYTE $0xe0 // vmovups	ymm8, ymmword ptr [r8 + 4*rbx - 32]
	LONG $0x107c41c4; WORD $0x980c             // vmovups	ymm9, ymmword ptr [r8 + 4*rbx]
	LONG $0xb83de2c4; BYTE $0xce               // vfmadd231ps	ymm1, ymm8, ymm6
	LONG $0xb835e2c4; BYTE $0xe7               // vfmadd231ps	ymm4, ymm9, ymm7
	LONG $0xb84de2c4; BYTE $0xd6               // vfmadd231ps	ymm2, ymm6, ymm6
	LONG $0xb845e2c4; BYTE $0xef               // vfmadd231ps	ymm5, ymm7, ymm7
	LONG $0xb83dc2c4; BYTE $0xc0               // vfmadd231ps	ymm0, ymm8, ymm8
	LONG $0xb835c2c4; BYTE $0xd9               // vfmadd231ps	ymm3, ymm9, ymm9
	LONG $0x10c38348                           // add	rbx, 16
	WORD $0x3949; BYTE $0xda                   // cmp	r10, rbx
	JNE  LBB0_12
	LONG $0xd258d4c5                           // vaddps	ymm2, ymm5, ymm2
	LONG $0x197de3c4; WORD $0x01d5             // vextractf128	xmm5, ymm2, 1
	LONG $0xd558e8c5                           // vaddps	xmm2, xmm2, xmm5
	LONG $0x0579e3c4; WORD $0x01ea             // vpermilpd	xmm5, xmm2, 1
	LONG $0xd558e8c5                           // vaddps	xmm2, xmm2, xmm5
	LONG $0xea16fac5                           // vmovshdup	xmm5, xmm2
	LONG $0xd558eac5                           // vaddss	xmm2, xmm2, xmm5
	LONG $0xc958dcc5                           // vaddps	ymm1, ymm4, ymm1
	LONG $0x197de3c4; WORD $0x01cc             // vextractf128	xmm4, ymm1, 1
	LONG $0xcc58f0c5                           // vaddps	xmm1, xmm1, xmm4
	LONG $0x0579e3c4; WORD $0x01e1             // vpermilpd	xmm4, xmm1, 1
	LONG $0xcc58f0c5                           // vaddps	xmm1, xmm1, xmm4
	LONG $0xe116fac5                           // vmovshdup	xmm4, xmm1
	LONG $0xcc58f2c5                           // vaddss	xmm1, xmm1, xmm4
	LONG $0xc058e4c5                           // vaddps	ymm0, ymm3, ymm0
	LONG $0x197de3c4; WORD $0x01c3             // vextractf128	xmm3, ymm0, 1
	LONG $0xc358f8c5                           // vaddps	xmm0, xmm0, xmm3
	LONG $0x0579e3c4; WORD $0x01d8             // vpermilpd	xmm3, xmm0, 1
	LONG $0xc358f8c5                           // vaddps	xmm0, xmm0, xmm3
	LONG $0xd816fac5                           // vmovshdup	xmm3, xmm0
	LONG $0xc358fac5                           // vaddss	xmm0, xmm0, xmm3
	WORD $0x394d; BYTE $0xd1                   // cmp	r9, r10
	JE   LBB0_15

LBB0_14:
	LONG $0x1c10fac5; BYTE $0x87 // vmovss	xmm3, dword ptr [rdi + 4*rax]
	LONG $0x2410fac5; BYTE $0x86 // vmovss	xmm4, dword ptr [rsi + 4*rax]
	LONG $0xb959e2c4; BYTE $0xcb // vfmadd231ss	xmm1, xmm4, xmm3
	LONG $0xb961e2c4; BYTE $0xd3 // vfmadd231ss	xmm2, xmm3, xmm3
	LONG $0xb959e2c4; BYTE $0xc4 // vfmadd231ss	xmm0, xmm4, xmm4
	WORD $0xff48; BYTE $0xc0     // inc	rax
	WORD $0x3948; BYTE $0xc2     // cmp	rdx, rax
	JNE  LBB0_14

LBB0_15:
	LONG $0xc259fac5         // vmulss	xmm0, xmm0, xmm2
	LONG $0xd051fac5         // vsqrtss	xmm2, xmm0, xmm0
	LONG $0xc057f8c5         // vxorps	xmm0, xmm0, xmm0
	LONG $0xd02ef8c5         // vucomiss	xmm2, xmm0
	JE   LBB0_17
	LONG $0xc25ef2c5         // vdivss	xmm0, xmm1, xmm2
	QUAD $0x000000000d10fac5 // vmovss	xmm1, dword ptr [rip + .LCPI0_0]
	LONG $0xc05cf2c5         // vsubss	xmm0, xmm1, xmm0

LBB0_17:
	LONG $0x0111fac5         // vmovss	dword ptr [rcx], xmm0
	LONG $0xf8658d48         // lea	rsp, [rbp - 8]
	BYTE $0x5b               // pop	rbx
	BYTE $0x5d               // pop	rbp
	WORD $0xf8c5; BYTE $0x77 // vzeroupper
	BYTE $0xc3               // ret
