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

    ldr r0, =filename
    mov r1, #0
    swi SWI_Open
    bcs error_apertura
    ldr r1, =InFileHandle
    str r0, [r1]

    bl leer_numero
    mov r1, #1

factorial:
    cmp r0, #0
    beq fin
    mul r1, r1, r0
    bl print_int
    sub r0, r0, #1
    b factorial

print_int:
    stmfd sp!, {r0,r1,lr}
    mov r0, #1
    swi SWI_PrInt
    ldr r1, =eol
    swi SWI_PrStr
    ldmfd sp!, {r0,r1,pc}

leer_numero:
    ldr r0, =InFileHandle
    ldr r0, [r0]
    swi SWI_RdInt
    bcs eof_reached
    mov pc, lr

fin:
    bl print_int
    swi SWI_Exit
.end