#include <unistd.h> // para las llamadas al sistema read() y write()

#define BUFFER_SIZE 256 // Tamano del buffer para almacenar la cadena

int main () {
    char buffer[BUFFER_SIZE]; // Buffer para almacenar la cadena
    ssize_t bytes_read, bytes_written; // Variables para almacenar el numero de bytes leidos y escritos

    // Leer desde la entrada estandar (teclado)
    bytes_read = read(STDIN_FILENO, buffer, BUFFER_SIZE);

    // Verificar si la lectura fue exitosa
    if (bytes_read > 0) {
        // Escribir en la salida estandar (pantalla)
        bytes_written = write(STDOUT_FILENO, buffer, bytes_read);

    // Verificar si la escritura fue exitosa
    if (bytes_written != bytes_read) {
        write(STDERR_FILENO, "Error escribiendo en la salida estandar. \n", 40);
        return 1; // Error al escribir
    }
 }else {
    write(STDERR_FILENO, "Error leyendo desde la entrada estandar. \n", 40);
    return 1; // Error al leer
 }

  return 0; // Exito
}
