SECTIONS
{
    /* Punkt startowy dla większości urządzeń ARM */
    . = 0x80000;
    
    .text.boot : { *(.text.boot) }
    .text : { *(.text) }
    .rodata : { *(.rodata) }
    .data : { *(.data) }
    .bss : {
        . = ALIGN(16);
        __bss_start = .;
        *(.bss)
        __bss_end = .;
    }
}
