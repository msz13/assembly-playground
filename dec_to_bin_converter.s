; ----------------------------------------------------------------------------------------
; Writes "Hello, World" to the console using only system calls. Runs on 64-bit Linux only.
; To assemble and run:
;
;     nasm -felf64 hello.asm && ld hello.o && ./a.out
; ----------------------------------------------------------------------------------------

%include 'functions.s' 

          global    _start

          section   .text

_start:   
                                                            
          mov       ecx, 8      ; set counter for bin length 
          mov       eax, 127      ; set varable to convert
         
          

loop: 
          mov       ebx, 48     ; set 0 character
          mov       edx, 49     ; set 1 character
          dec       ecx
          shr       eax, 1      ; divide varable by 2 by shift right one position
          cmovc     ebx, edx      ; set character to "1" if carry (if reminder of division)
          mov       [message+ecx], bl  ; set character in message 
          cmp       eax, 0              ;loop if varable > 0
          jnz       loop 

         
print_bin:
          mov       rax, 1                  ; system call for write
          mov       rdi, 1                  ; file handle 1 is stdout
          mov       rsi, message            ; address of string to output
          mov       rdx, 10                  ; number of bytes
          syscall

          call exit
         
          section   .data
message:  db        "00000000", 0Ah      ; note the newline at the end