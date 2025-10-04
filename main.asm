global _start

SECTION .bss
hello2: resb 64

SECTION .data
fb0 db "/dev/fb0", 0
filedesc dq 0
vinfo times 160 db 0
finfo times 88 db 0

SECTION .text

_start:
  mov rax, 2
  mov rdi, fb0
  mov rsi, 2
  mov rdx, 0
  syscall

  mov [filedesc], rax

  mov rax, 16
  mov rdi, [filedesc]
  mov rsi, 0x4600
  mov rdx, vinfo
  syscall 

  mov rax, 16
  mov rdi, [filedesc]
  mov rsi, 0x4602
  mov rdx, finfo
  syscall 

exit:
  mov rax, 60
  mov rdi, 0
  syscall
