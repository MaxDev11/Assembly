# Assembly language



## What is Assembly Language?
    - Not really a language
    - Almost no abstraction
    - Basically machine code
    - More control over CPU
    - More code to write
    - Not very portable (tied to specific CPU)



## Unerstanding the CPU

### Registers
    - Working memory (not for a long storage)
    - Different purposed
    - Fixed width (8bit, 16bit, 32bit, 64bit)
### The Stack
    - LIFO data structure
    - Is an array
    - Stack pointer (Push, Pop value)
    - Random access
### Assembler
    > Program responsible for converting
    assembly code into machine code 



## Assembly language
    - file.asm format
    - operation [operands, ...]

```
; ex1.asm

; First two lines of code for
; defyining the entry point of program

; This is where CPU starts executing
; instructions from

; global keyword is used to make
; an identifier accessible to the linker
global _start
; identifier followed by a colon will
; create a lable
; lables are used to name locations in our code
_start:
    ; syscall "1" - exit
    mov eax, 1  ; move instruction (move int 1 into "eax" register)
    ; syscall "42" - exit status
    mov ebx, 42 ; move instruction (move int 42 into "ebx" register)
    sub ebx, 29 ; substruction instruction (substract 29 from 42 in "ebx" register)
    ; 0x80 interrupt handler for syscalls
    int 0x80    ; perfoms an interrupt (CPU will transfer control to the interrupt handler)

; terminal

; -f elf32 - tells nasm to build a 32bit elf project file
; elf - executable and linking format
; $ nasm -f elf32 ex1.asm -o ex1.o

; ld - linker for building executable from object file
; -m - to specify that it's an x86 elf program
; ex1 - final executable program
; ld -m elf_i386 ex1.o -o ex1

; $ ./ex1
; $ echo $?
; 42
```

```
; Example of instructions

mov ebx, 123    ; ebx = 123
mov eax, ebx    ; eax = ebx
add ebx, ecx    ; ebx += ecx
sub ebx, edx    ; ebx -= edx
mul ebx         ; eax *= ebx
div edx         ; eax /= edx
```

```
; ex2.asm

global _start

section .data
    msg db "Hello, world!", 0x0a
    len equ $-msg

section .text
_start:
    mov eax, 4      ; sys_write syscall
    mov ebx, 1      ; stdout file descriptor
    mov ecx, msg    ; bytes to write
    mov edx, len    ; number of bytes to write
    int 0x80        ; interrupt for system call

    mov eax, 1      ; sys_exit syscall
    mov ebx, 0      ; exit status is 0
    int 0x80        ; interrupt for system call

; $ nasm -f elf32 ex2.asm -o ex2.o
; $ ld -m elf_i386 ex2.o -o ex2
; $ ./ex2
; Hello world!
```
