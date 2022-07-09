exit:
    mov       rax, 60                 ; system call for exit
    mov rdi, 0
    syscall
    ret
    