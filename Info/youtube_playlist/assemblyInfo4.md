# Assembly



## Functions in assembly
> Chunk of code that we can jump to,
perform some operations and then jump back to
where we came from
    - reuse code
    - interact bi-directionaly with c code or other langs



### Call
    - Pushes EIP to stack
    - Performs a jump



```
; ex7.asm

global _start

_start:
    call func
    mov eax, 1
    int 0x80

func:
    mov ebx, 42
    ; "ret" instruction (return)
    pop eax
    jmp eax

; $ nasm -f elf32 ex7.asm
; $ ld -m elf_i386 ex7.o -o ex7
; ./ex7
; echo $?
; 42



; ex8.asm

_start:
    call func
    mov eax, 1
    mov ebx, 0
    int 0x80

func:
    push ebp        ; preserving stack and allocating space
    mov ebp, esp    ; this portion is known as the
    sub esp, 2      ; prologue of the function
    mov [esp], byte 'H'
    mov [esp+1], byte 'i'
    mov eax, 4      ; sys_write syscall
    mov ebx, 1      ; stdout fd
    mov ecx, esp    ; bytes to write
    mov edx, 2      ; number of bytes
    int 0x80        ; perform syscall interrupt
    mov esp, ebp    ; restoring the stack and returning
    pop ebp         ; this portion is known as the
    ret             ; epilogue of the function

; $ nasm -f elf32 ex8.asm -o ex8.o
; $ ld -m elf_i386 ex8.o -o ex8
; $ ./ex8
; Hi
```
