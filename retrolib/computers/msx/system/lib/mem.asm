;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #8008 (Jul 27 2012) (Linux)
; This file was generated Sun Sep  8 19:21:41 2013
;--------------------------------------------------------
	.module mem
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _memset
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
;src/mem.c:7: void memcpy(uint8_t *dest, uint8_t *src, uint16_t n) {
;	---------------------------------
; Function memcpy
; ---------------------------------
_memcpy_start::
_memcpy:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/mem.c:8: while (n > 0) {
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	a,6 (ix)
	ld	-2 (ix),a
	ld	a,7 (ix)
	ld	-1 (ix),a
	ld	c,8 (ix)
	ld	b,9 (ix)
00101$:
	ld	a,b
	or	a,c
	jr	Z,00104$
;src/mem.c:9: *dest = *src;
	pop	hl
	push	hl
	ld	a,(hl)
	ld	(de),a
;src/mem.c:10: dest++;
	inc	de
;src/mem.c:11: src++;
	inc	-2 (ix)
	jr	NZ,00111$
	inc	-1 (ix)
00111$:
;src/mem.c:12: n--;
	dec	bc
	jr	00101$
00104$:
	ld	sp,ix
	pop	ix
	ret
_memcpy_end::
;src/mem.c:17: void memset(uint8_t *s, uint8_t c, uint16_t n) {
;	---------------------------------
; Function memset
; ---------------------------------
_memset_start::
_memset:
;src/mem.c:18: while (n > 0) {
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #5
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a,b
	or	a,c
	ret	Z
;src/mem.c:19: *s = c;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	(de),a
;src/mem.c:20: s++;
	inc	de
;src/mem.c:21: n--;
	dec	bc
	jr	00101$
	ret
_memset_end::
	.area _CODE
	.area _CABS (ABS)
