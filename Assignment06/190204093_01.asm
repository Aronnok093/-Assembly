;AUTOR MD FARDIN JAMAN ARANYAK
;ID I90204093
;AUST_CSE

.MODEL SMALL
.STACK 100H
.DATA
   FIRST      DB  'PLEASE ENTER A HEX DIGIT CHARACTER : $'
   DECIMAL    DB  'DECIMAL EQUIVALENT : $'
   CONTINUE   DB  'PRESS 'Y' FOR CONTINUE 'N' FOR EXIT : $'
   ILLEGAL    DB  'Illegal Input $'
  

.CODE
    MAIN PROC
        ;DATA SEGMENT INITIALIZE
        
        MOV AX,@DATA
        MOV DS,AX        ;CONVERTING DATA SEGMENT INTO CODE SEGMENT
    
        
         INPUT: 
           ;PRINTING THE STRING                   
           MOV AH, 9                  
           LEA DX, FIRST             
           INT 21H
    
           ;TAKING USER INPUT                  
           MOV AH, 1                  
           INT 21H
           MOV BL,AL
           
             
            
           
                                        
            CMP BL,48               ; COMPARING WITH LESS THAN 0
            JL  MSG 
            
            
         
            CMP BL,70               ;COMPARING WITH BIGGER THAN F        
            JG  MSG  
            
           
         
         
            CMP BL,57               ; IF IT IS BETWEEN 0-9
            JLE HEXA  
            
            
            ;NEW LINE
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
           
          
            MOV AH,9
            LEA DX,DECIMAL
            INT 21H
         
            SUB BL,17
         
            MOV AH,2
            MOV DL,49             ;PRINTING 1 IN FIRST PLACE 
            INT 21H
            MOV DL,BL             ;PRINTING EQUIVALENT VALUE
            INT 21H      
            JMP CONTINUE_MSG
           
          
           
           
              
           
           
           
       CONTINUE_MSG:
          
            ;NEW LINE
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
              
            MOV AH,9
            LEA DX,CONTINUE
            INT 21H 
               
            MOV AH,1
            INT 21H
            MOV CL,AL
               
            CMP CL,'Y'
               
            ;NEW LINE
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
               
            JE INPUT           ;IF Y THEN REPEAT
               
            CMP CL,'N'
            JE EXIT            ;IF N THEN STOP
               
            JMP CONTINUE_MSG   ;OTHERWISE WRONG
               
           
        HEXA: 
           
             ;NEW LINE
             MOV AH,2
             MOV DL,0AH
             INT 21H
             MOV DL,0DH
             INT 21H
               
             MOV AH,9
             LEA DX,DECIMAL
             INT 21H
             
             MOV AH,2
             MOV DL,BL           ;IF 0-9 THEN AS IT IS
             INT 21H
             JMP CONTINUE_MSG
        
    
          MSG: 
          
             ;NEW LINE
              MOV AH,2
              MOV DL,0AH
              INT 21H
              MOV DL,0DH
              INT 21H
              
              
              MOV AH, 9                  
              LEA DX, ILLEGAL           
              INT 21H
               
              ;NEW LINE
              MOV AH,2
              MOV DL,0AH
              INT 21H
              MOV DL,0DH
              INT 21H
               
              JMP INPUT
    
    
    
        EXIT:
         
            MOV AH,4CH
            INT 21H
        MAIN ENDP
        
END MAIN  