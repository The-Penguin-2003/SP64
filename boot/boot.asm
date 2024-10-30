;;; SP64 Bootloader (Stage 1) ;;;

[BITS 16]

jmp start_rm

%include "boot/boot_lib.asm"

start_rm:
	xor ax, ax
	mov ss, ax
	mov sp, 0x4000

	mov ax, 0x7C0
	mov ds, ax

	mov ah, 0x01
	mov cx, 0x2607
	int 0x10

	mov ah, 0x02
	xor bx, bx
	xor dx, dx
	int 0x10

	mov ah, 0x06
	xor al, al
	xor bx, bx
	mov bh, 0x07
	xor cx, cx
	mov dh, 24
	mov dl, 79
	int 0x10

	in al, 0x92
	or al, 2
	out 0x92, al

	mov si, boot_msg
	call puts_rm

	jmp $

boot_msg:
	db "SP64 Bootloader",0xA,0xD,0

times 510-($-$$) db 0
dw 0xAA55
