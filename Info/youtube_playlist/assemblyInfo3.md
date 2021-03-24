# Assembly



## Memory access and Stack operations

```
;ex5.asm

global _start
section .data
    addr db "yellow"
section .text
_start:
    mov [addr], byte 'H'
    mov [addr+5], byte '!'
    mov eax, 4      ; sys_write syscall
    mov ebx, 1      ; stdout file descriptor
    mov ecx, addr   ; bytes to write
    mov edx, 6      ; number of bytes to write
    int 0x80        ; interrupt syscalls
    mov eax, 1      ; sys_exit syscall
    mov ebx, 0      ; exit status is 0
    int 0x80        ; interrupt syscalls

; $ nasm -f elf32 ex5.asm -o ex5.o
; $ ld -m elf_i386 ex5.o -o ex5
; ./ex5
; Hello!
```



### Examples of common data types

```
section .data
    ; db is 1 byte
    name1 db "string"
    name2 db 0xff
    name3 db 100
    ; dw is 2 bytes
    name4 dw 1000
    ; dd is 4 bytes
    name5 dd 100000
```



## The stack
    - LIFO data structure
    - Is an array
    - Stack pointer (register)
    - Random access

```
; The Stack
; The pointer is at the highest from the start
; because that's exactly how the x86 machines work
; The stack pointer starts at the higher address
; in the memory and moves down with pushes and back
; up with pops
ESP = 28    ; stack pointer, register that holds the current location of the top of the stack

; [MemoryAddress] value
[00] 0      
[04] 0
[08] 0
[12] 357
[16] 246
[20] 8765
[24] 1234
[28] 0



; NASM code
push 1234
push 8765
push 246
sub esp, 4
mov [esp], dword 357
pop eax
```



```
; ex6.asm

global _start

_start:
    sub esp, 4
    mov [esp], byte 'H'
    mov [esp+1], byte 'e'
    mov [esp+2], byte 'y'
    mov [esp+3], byte '!'
    mov eax, 4      ; sys_write syscall
    mov ebx, 1      ; stdout file descriptor
    mov ecx, esp    ; pointer to bytes to write
    mov edx, 4      ; number of bytes to write
    int 0x80        ; perform syscall interrupt
    mov eax, 1      ; sys_exit syscall
    mov ebx, 0      ; exit status is 0
    int 0x80        ; perform syscall interrupt

; $ nasm -f elf32 ex6.asm -o ex6.o
; $ ld -m elf_i386 ex6.o -o ex6
; $ ./ex6
; Hey!
```

