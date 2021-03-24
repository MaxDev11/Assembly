# Assembly



## Functions
    - Handle return values from functions
    - Pass parameters to functions
    - Interact with external code



```
; The Stack
ESP = 32
EBP = 123
EAX = 1

[00] 0
[04] 0
[08] 0
[12] 0
[16] 0
[20] 123
[24] * return addr
[28] 21
[32] 0

; Code
_start:
    push 21
    call times2
    mov ebx, eax
    mov eax, 1
    int 0x80
times2:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, eax
    mov esp, ebp
    pop ebp
    ret
```

```
; ex10.asm

global main
extern printf

section .data
    msg db "Testing %i...:, 0x0a, 0x80

main:
    push ebp
    mov ebp, esp
    push 123
    push msg
    call printf
    mov eax, 0
    mov esp, ebp
    pop ebp
    ret

; $ nasm -f elf32 ex10.asm -o ex10.o
; $ gcc -m32 ex10.o -o ex10
; $ ./ex10
; Testing 123...
```
