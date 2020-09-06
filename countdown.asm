; ------------------------------------------------------------------------------
; Counts down from 9 to 0, printing each.
; To assemble and run:
;
;     $ nasm -felf64 -gdwarf countdown.asm
;     $ ld -o countdown countdown.o
;     $ ./countdown	
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        global    _start
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        section   .text

_start:
        ;; YOUR CODE GOES HERE.
        ;; Make the program print, one line at a time: 9, 8, 7, ..., 1, 0 
	mov       rsi, digit_str
top:    cmp       byte [rsi], "0"         ; see if int is still > 0
        jl        end                     ; if int <= 9, end loop
        mov       rax, 1
        mov       rdi, 1
        mov       rdx, 2      
        syscall                           ; print int
        dec       byte [rsi]              ; decrement int
        jmp       top

end:	mov       rax, 60                 ; system call for exit
        xor       rdi, rdi                ; exit code 0
        syscall                           ; invoke operating system to exit
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
        section   .data
digit_str:
	db        "9", 10                 ; The integer 10 is a newline char
; ------------------------------------------------------------------------------
