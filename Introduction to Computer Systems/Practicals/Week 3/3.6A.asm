.DATA
    NAMESTR    DB 0DH,0AH,"Username: $"
    PW      DB 0DH,0AH,"Password: $"
    WRONG   DB 0DH,0AH,"Invalid Login!$"
    CORRECT DB 0DH,0AH,"Access Granted!$"
    
    UNAME   DB "ICS"
    UPSW    DB "1024"
    
    NUMID   DB 3
    INID    LABEL BYTE
    MAXID   DB 10
    ACTID   DB ?
    ACTINID DB 10 DUP("$")
    
    NUMPW   DB 4 
    INPW    LABEL BYTE
    MAXPW   DB 10
    ACTPW   DB ?
    ACTINPW DB 10 DUP("$")
    
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    JMP ID
    
    ID:
        MOV AH, 09H
        LEA DX, NAMESTR
        INT 21H
        
        INSERTID:
            MOV AH, 0AH
            MOV DX, OFFSET INID
            INT 21H
        
    PASSW:
        MOV AH, 09H
        LEA DX, PW
        INT 21H 
        
        MOV SI, 0
        
        INSERTPASSW:
            MOV AH, 07H
            INT 21H
            MOV ACTINPW[SI], AL
            
            MOV BL, ACTINPW[SI]
            CMP BL, 13
            JE COMPAREID
            
            INC SI
            JMP INSERTPASSW
        
        COMPAREID:
            
            MOV DI, 0
            MOV CH, 0
            MOV CL, NUMID
            
            COMPAREOFFSETID:
                MOV AL, ACTINID[DI]
                CMP AL, UNAME[DI]
                JNE INVALID
                
                INC DI
            LOOP COMPAREOFFSETID
            JMP COMPAREPW
            
        COMPAREPW:
            MOV DI, 0
            MOV CH, 0
            MOV CL, NUMPW
            
            COMPAREOFFSETPW:
                MOV AL, ACTINPW[DI]
                CMP AL, UPSW[DI]
                JNE INVALID
                
                INC DI
            LOOP COMPAREOFFSETPW
            JMP VALID
            
    INVALID:
        MOV AH, 09H
        LEA DX, WRONG 
        INT 21H 
        
        JMP ID
        
    VALID:
        MOV AH, 09H
        LEA DX, CORRECT
        INT 21H
        
        JMP QUIT
        
    QUIT:
        MOV AX, 4C00H
        INT 21H
MAIN ENDP
END MAIN
            
                
            
