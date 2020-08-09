.MODEL SMALL
.STACK 100
.DATA

	ARR DB 190, 5, 37, 66, 4   
	TEN DB 10
    HUN DB 100
    NEW DB 0DH, 0AH, "$"

.CODE
MAIN PROC
	
	MOV AX, @DATA
	MOV DS, AX

	MOV SI, 0
	MOV CX, 5
	L1:
		MOV AH, 0
		MOV AL, ARR[SI]    
		
		CMP AL, HUN
        JAE THREENUM

        CMP AL, TEN
        JAE TWONUM

        MOV BX, AX
        MOV BH, 0
        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H
        
        MOV AH, 09H
        LEA DX, NEW
        INT 21H
		
        CONTINUE:
		    INC SI
	LOOP L1

    JMP EXIT

    THREEDIGIT:
        DIV HUN

        MOV BX, AX

        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H

        MOV AL, BH
        MOV AH, 0

        DIV TEN
        
        MOV BX, AX

        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H

        MOV AH, 02H
        MOV DL, BH
        ADD DL, 30H
        INT 21H

        MOV AH, 09H
        LEA DX, NEW
        INT 21H

        MOV AX, 0

    JMP CONTINUE

    TWODIGIT:
        DIV TEN

        MOV BX, AX

        MOV AH, 02H
        MOV DL, BL
        ADD DL, 30H
        INT 21H

        MOV AH, 02H
        MOV DL, BH
        ADD DL, 30H
        INT 21H

        MOV AH, 09H
        LEA DX, NEW
        INT 21H

        MOV AX, 0

    JMP CONTINUE

	EXIT:	
		MOV AX, 4C00H
		INT 21H
MAIN ENDP	
END MAIN