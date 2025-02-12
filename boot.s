

.section .text
.global _start
.global screens
.extern kernel_main
.global _switch_to_real_modes
_start:
        mov 0x21cd4cff,%eax
	mov $stack_top, %esp
	call kernel_main
_switch_to_real_modes:
    cli                   # Desativar interrupções
    
    movl %cr0, %eax
    andl $0x7FFFFFFE, %eax  # Desativar modo protegido e paginação
    movl %eax, %cr0
    ljmp $0x0, $real_mode   # Salto longo para o modo real
.code16gcc
real_mode:
    movw $0x0,%ax
    movw %ax,%ds
    movw %ax,%es
    movw %ax,%fs
    movw %ax,%gs
    movw %ax,%ss
    lidt gdt_real

    movb $0x0, %ah  # Imprimir mensagem com BIOS int 0x10
    movb $0x0, %al
    int $0x10
hlts:
jmp hlts
    hlt            # Entrar em estado de hibernação.section .data
gdt_real:
    .word 0x3ff,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
    .word 0xFFFF, 0, 0, 0x9F  # Segmento de código real
    .word 0xFFFF, 0, 0, 0x93  # Segmento de dados real


.section .multiboot
.align 4


.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:



