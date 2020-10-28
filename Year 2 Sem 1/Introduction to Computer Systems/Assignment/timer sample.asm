.DATA
    TIME DB 1
    STR DB 0DH, 0AH, "TIME!$" 
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
MOV BL, 0

TOP:
MOV AH,2CH
INT 21H
MOV BH,CL  ; DH has current second   


GETSEC:      ; Loops until the current second is not equal to the last, in BH
MOV AH,2CH
INT 21H 
CMP BH,CL  ; Here is the comparison to exit the loop and print 'A'
JNE PRINTA
JMP GETSEC


PRINTA:
MOV AH,02H
MOV DL,41
INT 21H

INC BL
CMP BL, TIME
JGE JUMP

JMP TOP 

JUMP:
MOV AH, 09H
LEA DX, STR
INT 21H

MOV AX, 4C00H
INT 21H

MAIN ENDP
END MAIN