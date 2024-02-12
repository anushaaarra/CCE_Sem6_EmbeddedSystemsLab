	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
    DCD 0x1001000
    DCD Reset_Handler
    ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
    LDR R0,=N1        
    LDR R1,=N2        
    LDRB R2,[R0]      
    LDRB R3,[R1]      
    LDR R6,=lcm     
    MOV R5,#0        
    MUL R7,R2,R3     
    LDR R4,=1        
up  SUB R7,R4        
    ADD R5,#1        
    CMP R7,#0       
    BNE up           
    STR R5,[R6]      
    B STOP           
STOP
    B STOP           
N1 DCD 4              
N2 DCD 3             
	AREA mydata, DATA, READWRITE
lcm DCD 0             
	END