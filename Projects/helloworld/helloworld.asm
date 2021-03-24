; db - define bytes
; hex value - 0xA (new line char)
; syscalls (/usr/include/asm/unistd_32.h) 
; write - write to a file descriptor
; int - interrupt

global _start

; Section with main code
section .text:

_start:
    mov eax, 0x4                ; use the write syscall
    mov ecx, 1                  ; use stdout as the fd
    mov ecx, message            ; use the message as the buffer
    mov edx, message_length     ; supply the length
    int 0x80                    ; invoke the syscall

    mov eax, 0x1    ; syscall for exit
    mov ebx, 0      ; specify the return value
    int 0x80        ; invoke the syscall


; Section with variables, lables (data)
section .data:
    message: db "Hello World!", 0xA
    message_length: equ $-message
