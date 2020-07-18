.MODEL SMALL
.STACK 100
.DATA
	WEL	DB 0DH, 0AH, "          **         **"
		DB 0DH, 0AH, "          ****     ****"
		DB 0DH, 0AH, "             **   **"
		DB 0DH, 0AH, "              *****"
		DB 0DH, 0AH, "               ***"
		DB 0DH, 0AH, "          ||    *    ||"
		DB 0DH, 0AH, "       ||  \  /***\  /   ||"
		DB 0DH, 0AH, "        \   \ ----- /    /"
		DB 0DH, 0AH, "         \   /  |  \    /"
		DB 0DH, 0AH, "          \_/   |   \ _/"
		DB 0DH, 0AH, "           |    |    |"
		DB 0DH, 0AH, "         __|    |    |__"
		DB 0DH, 0AH, "        /  \    |    /    \"
		DB 0DH, 0AH, "       /    =========      \"
		DB 0DH, 0AH, "      ||      =====        ||"
		DB 0DH, 0AH, "==================================="
		DB 0DH, 0AH, "|| Welcome to Royal Beetles Farm ||"
		DB 0DH, 0AH, "===================================$"

.CODE
	MOV AX, @DATA
	MOV DS, AX

	MOV AH, 09H
	LEA DX, WEL
	INT 21H

	MOV AX, 4C00H
	INT 21H
MAIN ENDP
END MAIN
