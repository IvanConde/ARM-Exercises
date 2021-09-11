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
string1:
	.asciz "Hola\n"
string2:
	.asciz "Chau\n"
.text
.global start
start:
    ldr r3, =string1
    bl imprimir
    ldr r3, =string2
    bl imprimir
    swi SWI_Exit
imprimir:
    mov r0, r3
    swi SWI_PrStrC
    mov pc, lr
.end
