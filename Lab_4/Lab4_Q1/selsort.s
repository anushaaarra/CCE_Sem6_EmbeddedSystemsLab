	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
    DCD 0x10001000
    DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
    MOV R7, #10
    LDR R0, =SRC
    LDR R1, =DST

COPY_LOOP
    LDR R2, [R0], #4
    STR R2, [R1], #4
    SUBS R7, #1
    BNE COPY_LOOP

    MOV R7, #10
    LDR R0, =DST
    LDR R1, =DST

OUTER_LOOP
    LDR R2, [R0]
    MOV R8, R7
    LDR R4, [R0]

INNER_LOOP
    LDR R3, [R1]
    CMP R4, R3
    BLE NEXT
    LDR R4, [R1]
    MOV R11, R1

NEXT
    SUBS R8, #1
    ADD R1, #4
    BNE INNER_LOOP
    CMP R4, R2
    BEQ NXT
    STR R2, [R11]
    STR R4, [R0]

NXT
    SUBS R7, #1
    ADD R0, #4
    BNE OUTER_LOOP

STOP
    B STOP

SRC DCD 0xABCD3421, 0xA1B2D421, 0x1C2AB433, 0xD3C223CD, 0xD1C4BF45, 0xD123EF12, 0xF3241212, 0x54F34444, 0x543EEEEE, 0x122323EF
	AREA mydata, DATA, READWRITE
DST DCD 0
	END