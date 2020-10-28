.MODEL SMALL
.STACK 100
.DATA
    NUM     DB 6, 12, 7, 5, 9, 11, 13, 16, 8
    AV      DB 0 
    
    SUM     DB 0DH, 0AH,"SUM: $"
    AVE     DB 0DH, 0AH,"Ave: $"
    
    TOTAL   DB 0 
    TEN     DB 10
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ;SUM
    MOV AH, 09H
    LEA DX, SUM
    INT 21H
    
    ;LOOP instruction
    MOV CX, 9  
    MOV SI, 0
    
    L1:
        MOV AL, NUM[SI]
        ADD TOTAL, AL
        
        INC SI 
        INC AV
    LOOP L1

;   CMP instruction    
;   MOV SI, 0
;    
;   L1:
;       MOV AL, NUM[SI]
;       ADD TOTAL, AL
;        
;       INC SI 
;       INC AV
;        
;       CMP SI, 9
;       JNE L1
    
    MOV AH, 0
    MOV AL, TOTAL
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
    
    ;AVERAGE
    MOV AH, 0
    MOV AL, TOTAL
    DIV AV
    MOV BX, AX 
    
    MOV AH, 09H
    LEA DX, AVE
    INT 21H
    
    MOV AH, 02H
    MOV DL, BL
    ADD DL, 30H
    INT 21H
    
    MOV AH, 02H
    MOV DL, "."
    INT 21H
    
    MOV AH, 02H
    MOV DL, BH
    ADD DL, 30H
    INT 21H
    
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
    
    
        
        
    
    
     
    
