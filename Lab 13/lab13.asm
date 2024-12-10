        .ORIG x3000
        AND R0, R0, #0
        AND R1, R1, #0
        AND R2, R2, #0
        AND R3, R3, #0
        AND R4, R4, #0
	ADD R4, R4, #8	; 16 HEIGHT COUNTER
	ADD R4, R4, #8
        AND R5, R5, #0 

        GETC
        ST R0, BIT0
        GETC
        ST R0, BIT1

	LEA R1, STRING
INPUT	GETC
        STR R0, R1, #0
        ADD R3, R0, #-10
	BRz PROCESS
	ADD R1, R1, #1
        BRnzp INPUT

PROCESS LEA R1, BIT1

NEXTCHAR
	ADD R1, R1, #1
        LDR R0, R1, #0
	AND R3, R3, #0
        ADD R3, R0, #0
        ADD R3, R3, #-10
        BRz ENDROW

        ADD R0, R0, R0
        ADD R0, R0, R0
        ADD R0, R0, R0
        ADD R0, R0, R0

        LD R2, FONT_DATA
        ADD R2, R2, R0
	ADD R2, R2, R5 ; ADD OFFSET

NEXTROW ADD R4, R4, #0 ;Check if 16 rows printed
	BRz DONE
	AND R6, R6, #0
	ADD R6, R6, #8 ; COL COUNTER
	LDR R3, R2, #0

NEXTCOL ADD R6, R6, #0
	BRz NEXTCHAR
        ADD R3, R3, #0
        BRn ONEBIT
       
ZEROBIT	LD R0, BIT0
	OUT
	ADD R3, R3, R3
	ADD R6, R6, #-1
	BRzp NEXTCOL

ONEBIT	LD R0, BIT1
	OUT
	ADD R3, R3, R3
	ADD R6, R6, #-1
	BRzp NEXTCOL

ENDROW  LD R0, NEWLINE
        OUT
        ADD R4, R4, #-1	;decrement row counter by 1
	ADD R5, R5, #1 ; INCREASE OFFSET
	ADD R2, R2, #1
        LEA R1, BIT1
        BRnzp NEXTCHAR

DONE    HALT
NEWLINE .FILL x0A
BIT0    .BLKW 1
BIT1    .BLKW 1
STRING  .BLKW 11
FONT_DATA
        .FILL x4000

        .END
