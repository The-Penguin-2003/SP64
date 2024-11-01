AS = nasm
ASFLAGS = -w+all -f bin

VM = qemu-system-x86_64
VMFLAGS = -enable-kvm -cpu host -vga std -fda SP64.img

.PHONY: all disk run clean

all: boot disk run

boot: boot/boot.bin

disk: boot/boot.bin
	dd if=/dev/zero of=SP64.img bs=512 count=2880
	dd if=boot/boot.bin of=SP64.img conv=notrunc

run: SP64.img
	$(VM) $(VMFLAGS)

boot/boot.bin: boot/boot.asm
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f boot/*.bin *.img
