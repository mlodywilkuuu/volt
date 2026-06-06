# Ustawienia kompilatora
CC = aarch64-none-elf-gcc
AS = aarch64-none-elf-as
CFLAGS = -ffreestanding -O2 -Wall -Wextra -nostdlib

# Pliki źródłowe
SRCS = boot.s kernel.c
OBJS = $(SRCS:.s=.o)

# Główny cel
kernel.elf: boot.o kernel.o
	$(CC) -T linker.ld -o $@ -ffreestanding -O2 -nostdlib $^

%.o: %.s
	$(AS) -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o *.elf
