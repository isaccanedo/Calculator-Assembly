.MODEL SMALL
.DATA

M0 DB "           Calculator      $"
M1 DB "For Addition,type       :`1'$" 
M2 DB "For Subtraction,type    :`2'$"
M3 DB "Enter 2 numbers for Addition: $"
M4 DB "Enter 2 numbers for Subtraction: $"
M5 DB "Choose an option : $" 
M6 DB "               THANK YOU         $" 
M7 DB "For Another Calculation,type :`1'$"
M8 DB "To EXIT,type :`2'$"
M9 DB "Invalid input. $"
M10 DB "pls enter a Valid input $"
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,M0
    MOV AH,9
    INT 21H 
    
    START:
    
    CALL NL
    CALL NL
    
    LEA DX,M1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,M2
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,M5
    MOV AH,9
    INT 21H  
    
    CALC:
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    CALL NL
    CALL NL
    
    CMP BL,'1'
    JE ADDD
    
    CMP BL,'2'
    JE SUBB  
    
    LEA DX,M10
    MOV AH,9
    INT 21H
    
    JP CALC
 
    ADDD:
    
    LEA DX,M3
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,'+'
    INT 21H
           
    MOV AH,1       
    INT 21H 
    MOV CL,AL
    
    ADD BL,CL
    MOV BH,BL
    SUB BL,48
    CMP BL,'9'
    
    CALL NL
    CALL NL
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,M7
    MOV AH,9
    INT 21H
    CALL NL
    LEA DX,M8
   MOV AH,9
    INT 21H
    CALL NL
    LEA DX,M5
   MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
    
    JMP EXIT
    
    SUBB:
    
    LEA DX,M4
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,'-'
    INT 21H
    
    MOV AH,1
    INT 21H 
    MOV CL,AL
    CMP BL,CL
    
    SUB BL,CL
    CMP BL,'9' 
   
    ADD BL,48
    
    CALL NL
    CALL NL
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
   
    CALL NL  
    CALL NL
    
    LEA DX,M7
    MOV AH,9
    INT 21H
    CALL NL
    LEA DX,M8
    MOV AH,9
    INT 21H
    CALL NL
    LEA DX,M5
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    MOV BL,AL
    CMP BL,'1'
    JE START
    
    CALL NL
    CALL NL
    
    CALL TNX
     
    JMP EXIT 
    
    NL:
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    RET 
    
    TNX:
    
    LEA DX,M6
    MOV AH,9
    INT 21H  

    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
