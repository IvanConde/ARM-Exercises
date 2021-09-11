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
vector:
    .word 8,1,8,-1,4,8
long_vector:
    .word 6
array_destino:
	.word 0, 0, 0, 0, 0, 0
constante:
	.word 2

.text
.global start
start:
    ldr r3, =long_vector
    ldr r3, [r3] @long vector
    ldr r2, =vector
    ldr r4, =array_destino
    ldr r5, =constante
    ldr r5, [r5]

recorrer:
    ldr r1, [r2], #4
    add r1, r1, r5
    str r1, [r4]
    add r4, r4, #4
recorrer_:
    subs r3, r3, #1
    bne recorrer
    ldr r3, =long_vector
    ldr r3, [r3] @long vector
    ldr r2, =array_destino

loop_mostrar:
	cmp r3, #0
	beq fin

	mov r0, #1
	ldr r1, [r2]
	swi SWI_PrInt

	add r2, r2, #4
	sub r3, r3, #1
	b loop_mostrar

fin:
    swi SWI_Exit
.end