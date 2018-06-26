; Hello World
; Discussion 0
; Colin Martinez

TITLE MASM Template
INCLUDE irvine32.inc

.data
myHeaderInfo BYTE "Hello World!", 0dh, 0ah, 0

.code
main PROC

	; Printout myHeaderInfo
	mov edx, OFFSET myHeaderInfo
	call WriteString
	
	exit

main ENDP
END main