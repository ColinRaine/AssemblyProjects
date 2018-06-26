; Colin Martinez
; Assignment 4


.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
; declare variables here
fibArray BYTE 6 DUP(?)

.code
main PROC
	; write your code here
	mov edi, OFFSET fibArray	; edi = address of array
	mov ecx, 5					; initialize loop counter
	mov bl, 1					; current number
	mov dl, bl					; previous number
	mov [edi], bl				; moves 1 to element 0 in array
	inc edi						; increments array to next byte
	mov [edi], dl				; moves 1 to element 1 in array
	inc edi						; increments array to next byte

L1:							
	add bl, dl					; adds previous number to current number
	xchg [edi], bl				; xchanges current number for value in edi
	mov bl, dl					; copies value from previous number into current number
	mov dl, [edi]				; copies value in edi into previous number
	inc edi						; increments array to next byte
	loop L1						; loops back to label 
	
	


INVOKE ExitProcess,0
main ENDP
END main