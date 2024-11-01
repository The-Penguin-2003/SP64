;;; SP64 Bootloader (Stage 1) ;;;

[BITS 16]

jmp start_rm

%include "boot/boot_lib.asm"

start_rm:
	mov ax, 0x7C0
	add ax, 288
	mov ss, ax
	mov sp, 4096

	mov ax, 0x7C0
	mov ds, ax

	mov si, boot_msg
	call puts_rm

	jmp $

boot_msg:
	db "SP64 Bootloader",0xA,0xD,0

times 510-($-$$) db 0
dw 0xAA55
