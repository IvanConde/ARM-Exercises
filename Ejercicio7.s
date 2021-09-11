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
    @abrir archivo
    ldr r0, =filename        @ nombre de archivo de entrada
    mov r1, #0               @ modo: entrada
    swi SWI_Open             @ abre archivo
    bcs InFileError          @ chequear si hubo error
    ldr r1, =InFileHandle    @ cargar dirección donde almacenar el handler
    str r0, [r1]             @ almacenar handler

    ldr r0, =InFileHandle
    ldr r0,[r0]
    swi SWI_RdInt

    cmp r0, #0

    mov r3, #0
    submi r1, r3, r0

	mov r0, #1
	swi SWI_PrInt

    ldr r0, =InFileHandle
    ldr r0,[r0]
    swi SWI_Close

    swi SWI_Exit
	.end