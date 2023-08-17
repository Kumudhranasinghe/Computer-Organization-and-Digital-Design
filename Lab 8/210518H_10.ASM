; ======================================================
; ===== 99sevseg.asm ===================================
; ===== Seven Segment Displays Port 02 =================
			; setting the 7-segment output to 0 0
	MOV	AL,00	; 0000 0000 into the AL register.
	OUT	02	; Send the data in AL to Port 02	
	
	MOV	AL,01	; 0000 0001 into the AL register.
	OUT	02	; Send the data in AL to Port 02

Start:			
	MOV	AL,0A	; 0000 1010 into the AL register.
	OUT	02	; Send the data in AL to Port 02	
	
	MOV	AL,FF	; 1111 1111 into the AL register.
	OUT	02	; Send the data in AL to Port 02

			
	MOV	BL,5	; A short delay is added to display the output for a longer period of time
Rep:
	DEC	BL	; Subtract one from BL.
	JNZ	REP	; Jump back to Rep if BL was not Zero. 	

	MOV	AL,1	; 0000 0001 into the AL register.
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,0	; 0000 0000 into the AL register.
	OUT	02	; Send the data in AL to Port 02

	JMP	Start	; Jump back to the start.
	END
; ======================================================