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

.text
.global start
start:
    ldr r3, =long_vector
    ldr r3, [r3] @long vector
    ldr r2, =vector
    ldr r4, [r2] @menor empieza con el primer elem del vector

search_min_elem:
    ldr r1, [r2], #4
    cmp r4, r1
    ble es_menor
    mov r4, r1
es_menor:
    subs r3, r3, #1
    bne search_min_elem

fin:
    mov r0, #1
    mov r1, r4
    swi SWI_PrInt
    swi SWI_Exit
.end