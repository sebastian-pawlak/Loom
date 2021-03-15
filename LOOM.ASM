; "Loom", Atari XL/XE Intro 32B
; (32 bytes of code + 6 bytes of header)
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; release date: 2021-03-13

rowcrs	equ $0054
colcrs	equ $0055
color2	equ $02c6
atachr	equ $02fb
consol	equ $d01f
random	equ $d20a
osgraph	equ $ef9c
osdraw	equ $f9c2


	org $0080

	lda #$08
	jsr osgraph
	sty atachr
	sta color2
loop1	ldx #$01
loop2	lda random
	sta consol		; audio
	and #%11100000
	asl
	sta rowcrs,x
	dex
	bpl loop2
	jsr osdraw
	bvc loop1

	;run start