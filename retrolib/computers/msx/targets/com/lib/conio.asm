;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #8008 (Jul 27 2012) (Linux)
; This file was generated Sun Sep  8 19:25:15 2013
;--------------------------------------------------------
	.module conio
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putdec
	.globl _puthex
	.globl _putchar
	.globl _puts
	.globl _puthex8
	.globl _puthex16
	.globl _putdec8
	.globl _putdec16
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/conio.c:7: void puts(char *s) {
;	---------------------------------
; Function puts
; ---------------------------------
_puts_start::
_puts:
;src/conio.c:8: while (*s != 0) {
	pop	bc
	pop	hl
	push	hl
	push	bc
00101$:
	ld	a,(hl)
	or	a, a
	ret	Z
;src/conio.c:9: putchar(*s);
	push	hl
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	hl
;src/conio.c:10: s++;
	inc	hl
	jr	00101$
	ret
_puts_end::
;src/conio.c:15: void puthex(int8_t nibbles, uint16_t v) {
;	---------------------------------
; Function puthex
; ---------------------------------
_puthex_start::
_puthex:
;src/conio.c:16: int8_t i = nibbles - 1;
	ld	hl, #2+0
	add	hl, sp
	ld	e, (hl)
	dec	e
;src/conio.c:17: while (i >= 0) {
00104$:
	bit	7, e
	ret	NZ
;src/conio.c:18: uint16_t aux = (v >> (i << 2)) & 0x000F;
	ld	a,e
	ld	l,a
	rla
	sbc	a, a
	ld	h,a
	add	hl, hl
	add	hl, hl
	ld	a,l
	inc	a
	push	af
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	pop	af
	jr	00117$
00116$:
	srl	h
	rr	l
00117$:
	dec	a
	jr	NZ,00116$
	ld	a,l
	and	a, #0x0F
;src/conio.c:19: uint8_t n = aux & 0x000F;
	and	a, #0x0F
	ld	l,a
;src/conio.c:20: if (n > 9)
	ld	a,#0x09
	sub	a, l
	jr	NC,00102$
;src/conio.c:21: putchar('A' + (n - 10));
	ld	a,l
	add	a, #0x37
	push	de
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	de
	jr	00103$
00102$:
;src/conio.c:23: putchar('0' + n);
	ld	a,l
	add	a, #0x30
	push	de
	push	af
	inc	sp
	call	_putchar
	inc	sp
	pop	de
00103$:
;src/conio.c:24: i--;
	dec	e
	jr	00104$
	ret
_puthex_end::
;src/conio.c:29: void puthex8(uint8_t v) {
;	---------------------------------
; Function puthex8
; ---------------------------------
_puthex8_start::
_puthex8:
;src/conio.c:30: puthex(2, (uint16_t) v);
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,#0x00
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_puthex
	pop	af
	inc	sp
	ret
_puthex8_end::
;src/conio.c:34: void puthex16(uint16_t v) {
;	---------------------------------
; Function puthex16
; ---------------------------------
_puthex16_start::
_puthex16:
;src/conio.c:35: puthex(4, v);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	a,#0x04
	push	af
	inc	sp
	call	_puthex
	pop	af
	inc	sp
	ret
_puthex16_end::
;src/conio.c:39: void putdec(int16_t digits, uint16_t v) {
;	---------------------------------
; Function putdec
; ---------------------------------
_putdec_start::
_putdec:
;src/conio.c:40: while (digits > 0) {
00101$:
	ld	a,#0x00
	ld	iy,#2
	add	iy,sp
	sub	a, 0 (iy)
	ld	a,#0x00
	sbc	a, 1 (iy)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	ret	P
;src/conio.c:41: uint16_t aux = v / digits;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__divuint_rrx_s
	pop	af
	pop	af
;src/conio.c:42: uint8_t n = aux % 10;
	ld	bc,#0x000A
	push	bc
	push	hl
	call	__moduint_rrx_s
	pop	af
	pop	af
	ld	a,l
;src/conio.c:43: putchar('0' + n);
	add	a, #0x30
	push	af
	inc	sp
	call	_putchar
	inc	sp
;src/conio.c:44: digits /= 10;
	ld	hl,#0x000A
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__divsint_rrx_s
	pop	af
	pop	af
	ld	iy,#2
	add	iy,sp
	ld	0 (iy),l
	ld	1 (iy),h
	jr	00101$
	ret
_putdec_end::
;src/conio.c:49: void putdec8(uint8_t v) {
;	---------------------------------
; Function putdec8
; ---------------------------------
_putdec8_start::
_putdec8:
;src/conio.c:50: putdec(100, (uint16_t) v);
	ld	iy,#2
	add	iy,sp
	ld	l,0 (iy)
	ld	h,#0x00
	push	hl
	ld	hl,#0x0064
	push	hl
	call	_putdec
	pop	af
	pop	af
	ret
_putdec8_end::
;src/conio.c:54: void putdec16(uint16_t v) {
;	---------------------------------
; Function putdec16
; ---------------------------------
_putdec16_start::
_putdec16:
;src/conio.c:55: putdec(10000, v);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl,#0x2710
	push	hl
	call	_putdec
	pop	af
	pop	af
	ret
_putdec16_end::
	.area _CODE
	.area _CABS (ABS)
