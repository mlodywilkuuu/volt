.section ".text.boot"
.global _start

_start:
    // Ustaw stos na 0x80000 (bezpieczne miejsce w RAM)
    mov sp, #0x80000
    
    // Skocz do funkcji głównej kernela (którą napiszesz w C)
    bl kernel_main

    // Pętla nieskończona, jeśli kernel_main kiedyś wróci
halt:
    wfe
    b halt
