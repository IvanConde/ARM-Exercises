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
min_header:	
    .asciz "Min: "
max_header:
    .asciz "Max: "
eol:
    .asciz "\n"
    .align
InFileHandle:
    .word 0

.text
.global start
start:
    ldr r0, =filename
    mov r1, #0
    swi SWI_Open
    bcs error_apertura
    ldr r1, =InFileHandle
    str r0, [r1]

    bl leer_numero
    mov r2, r0
    bl leer_numero
    mov r3, r0

    cmp r2, r3

    blt imprimir_numero @Si r3 es el mayor
    mov r0, r2
    mov r2, r3
    mov r3, r0

imprimir_numero:
    mov r0, #1
    ldr r1, =min_header
    swi SWI_PrStr

    mov r1, r2
    swi SWI_PrInt

    ldr r1, =eol
    swi SWI_PrStr

    ldr r1, =max_header
    swi SWI_PrStr

    mov r1, r3
    swi SWI_PrInt

    ldr r1, =eol
    swi SWI_PrStr

    b fin

leer_numero:
    ldr r0, =InFileHandle
    ldr r0, [r0]
    swi SWI_RdInt
    bcs eof_reached
    mov pc, lr

error_apertura:
eof_reached:
fin:
    swi SWI_Exit
.end