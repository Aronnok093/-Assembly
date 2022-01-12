;AUTOR MD FARDIN JAMAN ARANYAK
;ID I90204093
;AUST_CSE

.MODEL SMALL
.STACK 100H
.DATA
FIRST DB 'ENTER THE FIRST ALPHABET : $'
SECOND DB 'ENTER THE SECOND ALPHABET: $'
RESULT DB 'THE FOLLOWING  ALPHABETICAL ORDER : $'

.CODE
    MAIN PROC
        ;DATA SEGMENT INITIALIZE
        
        MOV AX,@DATA
        MOV DS,AX        ;CONVERTING DATA SEGMENT INTO CODE SEGMENT
        
        
        ;PRINTING THE  STRING
        MOV AH,9
        LEA DX,FIRST
        INT 21H     
        
        ;TAKING 1ST USER INPUT
        MOV AH,1
        INT 21H
        MOV BL,AL 
    
    
        ;PRINTING NEW LINE
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
    
    
        ;PRINTING THE  STRING
        MOV AH,9
        LEA DX,SECOND
        INT 21H     
        
        ;TAKING 2ND USER INPUT
        MOV AH,1
        INT 21H
        MOV CL,AL 
        
         
        
        CMP CL,BL
        JLE EXCHANGE ; EXCHANGE IN 1ST CHAR IS GREATER THAN 2ND ONE
        JG PRINT     ; PRINT THE RESULT
        
        
         PRINT:
             ;PRINTING NEW LINE
             MOV AH,2
             MOV DL,0AH
             INT 21H
             MOV DL,0DH
             INT 21H
        
            
                ;PRINTING THE STRING
            
              MOV AH,9
              LEA DX,RESULT
              INT 21H
                
                
              MOV AH,2
              MOV DL,BL
              INT 21H 
                
              MOV AH,2
              MOV DL,'-'
              INT 21H 
                
              MOV AH,2
              MOV DL,CL
              INT 21H   
              JMP EXIT
        
        
        EXCHANGE:
        
           XCHG BL,CL  ; EXCHANGE FUNCTION
           JMP PRINT
        
        EXIT:
         
            MOV AH,4CH
            INT 21H
            
        MAIN ENDP
END MAIN  