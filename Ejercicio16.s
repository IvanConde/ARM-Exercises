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
numero:
    .word 1,2,3,4

.text
.global start
start:
    bl imprimir_enteros
    swi SWI_Exit

imprimir_enteros:
    stmfd sp!, {lr}
    ldr r2, =numero
    mov r3, #4 @tope
imprimir_enteros_:
    bl mostrar_elemento
    add r2, r2, #4
    subs r3, r3, #1 @agrego el s para modificar los flags
    bne imprimir_enteros_
    ldmfd sp!, {pc}

mostrar_elemento:
    stmfd sp!, {lr}
    mov r0, #1
    ldr r1, [r2]
    swi SWI_PrInt
    ldmfd sp!, {pc}

.end