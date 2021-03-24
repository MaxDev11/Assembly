# Assembly language



## Instruction Pointer
    - EIP (internal pointer of CPU)
    - Location of execution (location of a machine code that a CPU is executing)
    - Not like a register (can't use operations like mov)
    - Changed by jump operations

```
; ex3.asm

global _start

section .text
_start:
    mov ebx, 42     ; exit status is 42
    mov eax, 1      ; sys_exit syscall
    jmp skip        ; jump to "skip" label
    mov ebx, 13     ; exit status is 13
skip:
    int 0x80        ; interrupt of exiting the program

; $ nasm -f elf32 ex3.asm -o ex3.o
; $ ld -m elf_i386 ex3.o -o ex3
; $ ./ex3
; $ echo $?
; 42    



global _start

section .text
_start:
    mov ecx 101     ; set ecx to 101
    mov ebx, 42     ; exit status is 42
    mov eax, 1      ; sys_exit syscall
    cmp ecx, 100    ; compare ecx to 100
    jl skip         ; jump if less than
    mov ebx, 13     ; exit status is 13
skip:
    int 0x80        ; interrupt of exiting the program

; $ nasm -f elf32 ex3.asm -o ex3.o
; $ ld -m elf_i386 ex3.o -o ex3
; $ ./ex3
; $ echo $?
; 13     

```  


```
; Common conditional jumps

je  A, B    ; Jump if equal
jne A, B    ; Jump if not equal
jg  A, B    ; Jump if greater
jge A, B    ; Jump if greater or equal
jl  A, B    ; Jump if less
jle A, B    ; Jump if less or equal

```


```
; ex4.asm
; 
; don't ever use an exit status for returning
; an useful result like in prev examples
; it has been done because it's the easiest way
; to show that the programs are actually generating
; a correct result but you should be returning 0
; in exit status, unless there is an error

global _start

section .text
_start:
    mov ebx, 1      ; start ebx at 1
    mov ecx, 4      ; number of iterations
label: 
    add ebx, ebx    ; ebx += ebx
    dec ecx         ; ecx -= 1
    cmp ecx, 0      ; compare ecx with 0
    jg label        ; jump to label if greater
    mov eax, 1      ; sys_exit system call
    int 0x80

; $ nasm -f elf32 ex4.asm -o ex4.o
; $ ld -m elf_i386 ex4.o -o ex4
; $ ./ex4
; $ echo $?
; 64

```

