; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.

			; Turn off all the traffic lights.
	MOV AL,0	; Copy 00000000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

Start:			
	MOV AL,84	; Copy 10000100 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	MOV	BL,A	; A middle sized delay. 10 clock cycles
	CALL	30	; Call the procedure at address [30]

	MOV AL,48	; Copy 01001000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	MOV AL,30	; Copy 00110000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	MOV	BL,5	; A short delay. 5 clock cycles
	CALL	30	; Call the procedure at address [30]

	JMP Start	; Jump back to the start.


; ----- Time Delay Procedure Stored At Address [30] -------------
	ORG	30	; Generate machine code from address [30]

Rep:
	DEC	BL	; Subtract one from BL.
	JNZ	REP	; Jump back to Rep if BL was not Zero.

	RET		; Return from the procedure.
; ---------------------------------------------------------------
	END		; Program ends.
	
; ===== Program Ends ==========================================
