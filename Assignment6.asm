;------------------------------------
; Colin Martinez
; Assignment 6
; November 11, 2017
;------------------------------------
.386
.model flat,stdcall
.stack 4096
INCLUDE Irvine32.inc
ExitProcess PROTO, dwExitCode:DWORD

.data
	; Variable Declaration
	array DWORD 10 dup (?)
	a DWORD ?
	z DWORD ?
	
	
.code
main PROC
	; Procedure calls
	call Randomize
	call InitVar
	call FillArray
	call Crlf
	call InitVar
	call FillArray
	
	INVOKE ExitProcess,0
main ENDP

;----------------------------------------------
; Initvar
;
; Initializes variables with a random number.
; Validates that a<z before returning.
; Receives: eax,a,z,Random32
; Returns: a, z, eax
;----------------------------------------------
InitVar PROC
	Init:
		mov eax, 0
		call Random32
		mov a, eax
		call Random32
	    mov z, eax
		cmp a, eax
		ja Init
		ret

InitVar ENDP

;-----------------------------------------------
; FillArray
;
; Populates the array with random numbers that
; fit the condition (eax > a) and (eax < z). 
; Prints number to console before looping back.
; Receives: esi, ecx, eax, a, z, Random32
; Returns: eax, a, z, esi, ecx
;-----------------------------------------------
FillArray PROC
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
	Begin:
		call Random32
		cmp eax, a
		jb Begin
		cmp eax, z
		ja Begin
		jmp InitArray
		
	InitArray:
		call WriteDec
		call Crlf
		mov [esi], eax
		add esi, 4
		Loop Begin

	ret
FillArray ENDP


END main