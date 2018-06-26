; Colin Martinez
; SubtractTwo.asm - subtracts two 32-bit integers.
; October 12, 2017

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax,6				
	sub	eax,5				

	invoke ExitProcess,0
main endp
end main