; ======================================================
; ================= factorial five =====================
; === displayed by 7-segment display through port 02 ===

			; setting the 7-segment output to 0 0
	MOV	AL,00	; 0000 0000 into the AL register.
	OUT	02	; Send the data in AL to Port 02	
	
	MOV	AL,01	; 0000 0001 into the AL register.
	OUT	02	; Send the data in AL to Port 02

Start:
 	MOV	AL,5	; Copying 5 into AL register
	MOV	BL,1	; Copying 1 into BL register
	CALL	30	; Call the procedure at address [30]


	MOV	AL,8A	; 1000 1010 into the AL register.	
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,FF	; 1111 1111 into the AL register.
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,5	; A short delay is added to display the output for a longer period of time
	MOV	BL,1	; The same procedure used to calculate 5! is used here
	CALL	30	; Call the procedure at address [30]	 	

	MOV	AL,1	; 0000 0001 into the AL register.	
	OUT	02	; Send the data in AL to Port 02

	MOV	AL,0	; 0000 0000 into the AL register.
	OUT	02	; Send the data in AL to Port 02

	JMP	Start	; Jump back to the start.

; ----- 5! calculating Procedure Stored At Address [30] ---------
	ORG	30	; Generate machine code from address [30]
Rep:	
	MUL 	BL,AL	; Multiply AL with BL. Answer goes into BL.
	DEC	AL	; Subtract one from AL.
	JNZ	REP	; Jump back to Rep if AL was not Zero.
	ADD	CL,BL	; Moving calculated 5! from BL to CL register
	RET		; Return from the procedure.
; ---------------------------------------------------------------
	END
; ======================================================		 