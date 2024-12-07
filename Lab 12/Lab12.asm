        .ORIG x3000

        GETC
        ST R0, BIT0
        GETC
        ST R0, BIT1
        GETC
        ST R0, CHAR0

        LD  R0, CHAR0
        ADD R0, R0, R0       ; Multiply by 2
        ADD R0, R0, R0       ; Multiply by 4
        ADD R0, R0, R0       ; Multiply by 8
        ADD R0, R0, R0       ; Multiply by 16
        LD  R1, FONT_DATA    ; x4000
        ADD R1, R1, R0       ; Find starting address of char (x4000 + ASCII * 16)
        AND R4, R4, #0
        ADD R4, R4, #8       ; row counter to 16
        ADD R4, R4, #8 

NEXTROW ADD R4, R4, #0      ; CHECK ROW COUNTER
        BRz DONE
        AND R2, R2, #0
        ADD R2, R2, #8      ; column counter to 8
        LDR R3, R1, #0

NEXTCOL ADD R2, R2, #0
        BRz ENDROW
        ADD R3, R3, #0
        BRn BIT_1
        BRzp BIT_0

BIT_0   LD R0, BIT0
        OUT
        ADD R3, R3, R3
        ADD R2, R2, #-1 ; decrement column counter
        BRzp NEXTCOL ; branch to next column if 8 columns havent been completed for this row

BIT_1   LD R0, BIT1
        OUT
        ADD R3, R3, R3
        ADD R2, R2, #-1 ; decrement column counter
        BRzp NEXTCOL ; branch to next column if 8 columns havent been completed for this row

ENDROW  LD R0, NEWLINE
        OUT
        ADD R4, R4, #-1
        ADD R1, R1, #1
        BRnzp NEXTROW

DONE    HALT
NEWLINE .FILL xA
BIT0    .BLKW 1
BIT1    .BLKW 1
CHAR0   .BLKW 1
FONT_DATA
        .FILL x4000

        .END