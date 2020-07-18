.MODEL SMALL
.STACK 100
.DATA
    LOGO    DB 0DH, 0AH, "  _________                                                     _________"
            DB 0DH, 0AH, " /         \___                                             ___/         \"
		    DB 0DH, 0AH, " |             \__                                       __/             |"
		    DB 0DH, 0AH, "  \               \___                               ___/               /"
	    	DB 0DH, 0AH, "   \                  \___       _       _       ___/                  /"
	        DB 0DH, 0AH, "    \                     \_      \     /      _/                     /"
	    	DB 0DH, 0AH, "     \                      \_     \   /     _/                      /"
	    	DB 0DH, 0AH, "      \                       \_    \_/    _/                       /"
	    	DB 0DH, 0AH, "       \_                       \__ (_) __/                       _/"
	    	DB 0DH, 0AH, "         \__                       /   \_                      __/"
	    	DB 0DH, 0AH, "            \_______        _____//\ _ /\\_______        _____/"
	    	DB 0DH, 0AH, "               /    \______/     /  |_|  \       \______/  \"
	    	DB 0DH, 0AH, "              /               __/   |_|   \__               \"
	    	DB 0DH, 0AH, "              \            __/      |_|      \__            /"
	    	DB 0DH, 0AH, "               \        __/         |_|         \__        /"
	    	DB 0DH, 0AH, "                \______/            \-/            \______/"
	    	DB 0DH, 0AH, "              ==============================================="
	    	DB 0DH, 0AH, "              || Welcome to Queen Alexandra Butterfly Farm ||"
	    	DB 0DH, 0AH, "              ===============================================$"

.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	MOV AH, 09H
	LEA DX, LOGO
	INT 21H

	MOV AX, 4C00H
	INT 21H
MAIN ENDP
END MAIN
