# Assembly 



```
; add42.h
int add42(int x);

; main.c
#include <stdio.h>
#include "add42.h"

int main() {
    int result;
    result = add42(30);
    printf("Result: %i\n", result);
    return 0;
}

; add42.asm

global add42
add42:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add eax, 42
    mov esp, ebp
    pop ebp
    ret

; $ nasm -f elf32 add42.asm -o add42.o
; $ gcc -m32 add42.o main.c -o ex11
; $ ./e11
; Result: 72
```
