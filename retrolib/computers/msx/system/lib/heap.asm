;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #8008 (Jul 27 2012) (Linux)
; This file was generated Sun Sep  8 19:21:41 2013
;--------------------------------------------------------
	.module heap
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _malloc
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
;src/heap.c:7: void *malloc(uint16_t size) {
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc_start::
_malloc:
;src/heap.c:8: uint8_t *ret = heap_top;
	ld	de,(_heap_top)
;src/heap.c:9: heap_top += size;
	ld	hl,#2
	add	hl,sp
	push	de
	ld	iy,#_heap_top
	push	iy
	pop	de
	ld	a,(de)
	add	a, (hl)
	ld	(de),a
	inc	de
	ld	a,(de)
	inc	hl
	adc	a, (hl)
	ld	(de),a
;src/heap.c:10: return (void *) ret;
	pop	hl
	ret
_malloc_end::
	.area _CODE
	.area _CABS (ABS)
