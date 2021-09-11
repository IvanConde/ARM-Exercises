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
numero1:
    .word 8
numero2:
    .word 2

.text
.global start
start:

    mov r0, #1
    ldr r1, =numero1
    ldr r1, [r1]
    swi SWI_PrInt

    mov r0, #1
    ldr r1, =numero2
    ldr r1, [r1]
    swi SWI_PrInt

    mov r2, #4
    ldr r3, =numero1
    str r2, [r3]

    mov r0, #1
    ldr r1, =numero1
    ldr r1, [r1]
    swi SWI_PrInt

    mov r2, #6
    ldr r3, =numero2
    str r2, [r3]

    mov r0, #1
    ldr r1, =numero2
    ldr r1, [r1]
    swi SWI_PrInt

    swi SWI_Exit
.end