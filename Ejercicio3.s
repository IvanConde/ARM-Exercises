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

.text
.global start
start:
    mov r0, #2
    mov r1, #3
    add r2, r0, r1
    sub r3, r0, r1
    mul r4, r0, r1
    swi SWI_Exit
.end
