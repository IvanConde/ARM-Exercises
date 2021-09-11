.equ SWI_PrChr, 0x00
.equ SWI_PrStrC, 0x02
.equ SWI_Exit, 0x11

.equ SWI_Open, 0x66
.equ SWI_Close, 0x68

.equ SWI_PrStr, 0x69
.equ SWI_RdStr, 0x6a

.equ SWI_PrInt, 0x6B
.equ SWI_RdInt, 0x6C

.equ Stdout, 1

.data
filename:
	.asciz "nombre.extension"
eol:
    .asciz "\n"
    .align
InFileHandle:
    .word 0

.text
.global start
start:
    mov r2, #0
start_:
    cmp r2, #10
    bpl fin

    mov r0, #1
    mov r1, r2
    swi SWI_PrInt
    add r2, r2, #1

    b start_

fin:
    swi SWI_Exit
.end