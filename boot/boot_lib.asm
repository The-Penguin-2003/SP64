;;; SP64 Boot Library ;;;

[BITS 16]

puts_rm:
	mov ah, 0x0E

	.loop:
		lodsb
		test al, al
		je .done
		int 0x10
		jmp .loop
	.done:
		ret
