TITLE  Stop Watch        (AddSub3.asm)

; Last update: 2/25/2023

INCLUDE Irvine32.inc

.data
msg1 Byte "STOP WATCH : ",0
msg2 Byte "<<.....................................PROGRAMMED BY ASAD BASHIR..................................................>>"
hour DWORD 00
mint DWORD 00
sec DWORD 00
seclimit DWORD 60
.code
main PROC
	;..........................................
	start:
	call Clrscr
	mov edx,offset msg2
	call writestring
	;.........................................
	mov dh,5
	mov dl,40
	call Gotoxy
	mov edx,offset msg1
	call writestring
	mov dh,5
	mov dl,62
	call Gotoxy
	mov eax,hour
	call writedec
	;..........................................
	mov dh,5
	mov dl,65
	call Gotoxy
	mov eax,mint
	call writedec
	cmp eax,60
	JE abc2

	;..........................................
	mov dh,5
	mov dl,68
	call Gotoxy
	mov eax,sec
	call writedec
	cmp eax,60
	JE abc
	;..........................................
	inc sec
	call crlf
	mov eax,1000
	call delay
	;..........................................
	mov eax,white + (blue * 16)
	call SetTextColor
	;..........................................	
	jmp start
	;.........................................	
	abc:
	inc mint
	mov sec,0
	jmp start
	abc2:
	inc hour
	mov mint,0
	jmp start

     	exit
main ENDP
END main
