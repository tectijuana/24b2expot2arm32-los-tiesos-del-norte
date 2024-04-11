    .global main
    .text

main:
    movq $BUFFER_SIZE, %rdi         # RDI = Tamaño del buffer
    movq $buffer, %rsi              # RSI = Dirección de inicio del buffer
    call read_input                  # Llamada a la función para leer la entrada estándar
    
    testq %rax, %rax                # Comprobar si se leyeron bytes
    jle read_error                  # Si no se leyeron bytes, ir a read_error
    
    movq %rax, %rdx                 # RDX = Número de bytes leídos
    
    movq $1, %rdi                   # RDI = Descriptor de archivo (STDOUT_FILENO)
    movq $buffer, %rsi              # RSI = Dirección de inicio del buffer
    movq %rdx, %rdx                 # RDX = Número de bytes leídos
    call write_output               # Llamada a la función para escribir en la salida estándar
    
    testq %rax, %rax                # Comprobar si se escribieron todos los bytes
    jne write_error                 # Si no se escribieron todos los bytes, ir a write_error
    
    xorq %rax, %rax                 # RAX = 0 (indicando éxito)
    ret                             # Retornar del programa
    
read_input:
    movq $0, %rax                   # RAX = 0 (syscall number for read)
    syscall                         # Invocar la llamada al sistema read
    ret                             # Retornar del subprograma read_input

write_output:
    movq $1, %rax                   # RAX = 1 (syscall number for write)
    syscall                         # Invocar la llamada al sistema write
    ret                             # Retornar del subprograma write_output

read_error:
    movq $40, %rdi                  # RDI = Longitud del mensaje de error
    movq $error_read, %rsi          # RSI = Dirección del mensaje de error
    call write_error_msg            # Llamada a la función para escribir mensaje de error
    jmp end_program                 # Saltar al final del programa
    
write_error:
    movq $40, %rdi                  # RDI = Longitud del mensaje de error
    movq $error_write, %rsi         # RSI = Dirección del mensaje de error
    call write_error_msg            # Llamada a la función para escribir mensaje de error
    jmp end_program                 # Saltar al final del programa
    
write_error_msg:
    movq $2, %rdi                   # RDI = Descriptor de archivo (STDERR_FILENO)
    movq %rsi, %rsi                 # RSI = Dirección del mensaje de error
    call write_output               # Llamada a la función para escribir en la salida estándar
    ret                             # Retornar del subprograma write_error_msg

end_program:
    movq $1, %rax                   # RAX = 1 (indicando error)
    ret                             # Retornar del programa
    
.data
buffer:
    .skip BUFFER_SIZE               # Reservar espacio para el buffer

error_read:
    .string "Error leyendo desde la entrada estándar.\n"

error_write:
    .string "Error escribiendo en la salida estándar.\n"

