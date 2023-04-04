OUTPUT_ARCH( "riscv" )
ENTRY(_start)

SECTIONS
{
  . = 0x80000000;
  .text : ALIGN(0x0010) { *(.text) }
  . = 0x80001000;
  .data : ALIGN(0x0010) { *(.data) }
  .tohost : ALIGN(0x0010) { *(.tohost) }
  .bss : ALIGN(0x0010) { *(.bss) }
  _end = .;
}
