.MODEL SMALL
.STACK 100
.DATA
      STR1  DB  0DH, 0AH, "Quantity (unit) : $"
      QUAN  DB  ?
      STR2  DB  0DH, 0AH, "Unit Price (RM) : $"
      PRICE DB  ?
      STR3  DB  0DH, 0AH, "Total Amount is RM$"
      TOTAL DB  ?
      
      TEN   DB  10
      1     DB  ?
      2     DB  ?
      3     DB  ?
        
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

    MOV AH, 09H
    LEA DX, STR1
    INT 21H
    
NUM:    
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13
    JE PROCEED
    
    MOV AH, 0
    SUB AL, 48
    
    MUL TEN
    MOV QUAN, AL 
    
    MOV AH, 01H
    INT 21H
    CMP AL, 13
    JE PROCEED
    
    MOV AH, 0
    SUB AL, 48
    
    ADD QUAN, AL
    
    JMP PROCEED
    
    
PROCEED:    
    MOV AH, 09H
    LEA DX, STR2
    INT 21H
    
    MOV AH, 01H
    INT 21H
    SUB AL, 48
    MOV PRICE, AL
    
    MOV AL, QUAN
    MUL PRICE
    DIV TEN
    MOV 2, AL
    MOV 3, AH 
    
    MOV AL, 2
    DIV TEN
    MOV 1, AL
    MOV 2, AH 
    
    MOV AH, 09H
    LEA DX, STR3
    INT 21H
    
    MOV AH, 02H
    MOV DL, 1
    ADD DL, 30H
    INT 21H
    
    MOV AH, 02H
    MOV DL, 2
    ADD DL, 30H
    INT 21H
    
    MOV AH, 02H
    MOV DL, 3
    ADD DL, 30H
    INT 21H
	
	MOV AH, 4CH
	INT 21H
MAIN ENDP
END MAIN