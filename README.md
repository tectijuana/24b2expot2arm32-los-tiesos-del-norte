<pre>

	<p align=center>

Tecnológico Nacional de México
Instituto Tecnológico de Tijuana

Departamento de Sistemas y Computación
Ingeniería en Sistemas Computacionales

Semestre:
Febrero - Junio 2022

Materia:
Lenguajes de interfaz

Docente:
M.C. Rene Solis Reyes 

Unidad:
1

Título del trabajo:
Exposiciones

Estudiante:
Aguiñaga Flores Luis Fernando - 21210354
Perez Gonzalez Kevin William - 21212019
Luna Bernal Juan Francisco - 21210393
Martinez Flores Manuel Andres - 21210396
Gamboa Hernández Esmeralda - 21210374

	</p>

</pre>



	
# 6. Llamadas al sistema y entrada/salida

<pre>
	<p align=center>
<b>Introducción</b>
		</p>
	<p align=left>
En este proyecto lo que mostraremos es un programa en el que al ingresar una línea de texto, el programa nos arroje el mismo 
resultado que escribimos anteriormente. a su vez contamos con información en el marco teórico que revela los puntos más 
importantes del proyecto en cuanto a teoría.

	</p>
</pre>

<pre>
	<p align=center>
<b>Marco Teórico: </b>
	</p>

	<p align=left>
En sistemas operativos basados en Linux, las llamadas al sistema son la forma en que un programa solicita servicios del núcleo 
del sistema operativo. Estas llamadas permiten a los programas acceder a recursos del sistema como archivos, dispositivos de 
hardware, y otros servicios del kernel. Las llamadas al sistema proporcionan una interfaz entre el espacio de usuario y el espacio 
del kernel, permitiendo a los programas ejecutarse de manera segura y eficiente.

Para operaciones de entrada/salida, los programas pueden utilizar llamadas al sistema como read() y write(), que permiten leer y 
escribir datos desde y hacia dispositivos, archivos o flujos de datos. Estas llamadas al sistema están optimizadas para interactuar 
eficientemente con el hardware y proporcionar una interfaz estándar para los programas.

En sistemas embebidos como Raspberry Pi, el mapeo de periféricos en memoria es una técnica común para acceder y controlar hardware 
externo. Esto implica asignar direcciones de memoria a los registros de control de los periféricos, lo que permite a los programas 
interactuar directamente con ellos como si estuvieran accediendo a la memoria.
</pre>

 <pre>
	<p align=center>
<b> Concepto de llamadas al sistema (system calls): </b>
		</p>

Las llamadas al sistema son interfaces proporcionadas por el sistema operativo para permitir que los programas soliciten servicios 
del núcleo del sistema operativo. 
Las llamadas al sistema son el mecanismo fundamental a través del cual los programas en el espacio de usuario pueden acceder a
recursos y servicios del sistema operativo.
 </pre>

 <pre>

	<p align=center>
<b> Cómo emplear las llamadas al sistema: </b>
		</p>
La mayor parte del código de Linux está escrito en C. Aunque técnicamente, se puede invocar una llamada al sistema desde cualquier 
lenguaje de programación, optaremos por el C, ya que es el lenguaje nativo del sistema operativo. Uno podría argumentar que analizar 
las llamadas al sistema desde un lenguaje ensamblador sería una aproximación más directa, pero esto no es del todo preciso. Linux 
está diseñado para funcionar en una variedad de arquitecturas, cada una con su propia manera de expresar las llamadas al sistema en
código máquina. En C, estos detalles se vuelven transparentes, ya que es un lenguaje de nivel superior que está menos ligado a la 
arquitectura subyacente. No obstante, mencionaremos algunos aspectos.
 </pre>

 <pre>
	<p align=center>
<b> Tipos de llamadas al sistema: </b>
		</p>
Las llamadas al sistema pueden clasificarse en diferentes categorías, como operaciones de administración de procesos, gestión 
de memoria, operaciones de entrada/salida, comunicación entre procesos, gestión de archivos y sistemas de archivos, y operaciones 
de red, entre otros.

<b>- Operaciones de entrada/salida (I/O): </b>
La entrada/salida (I/O) es un aspecto fundamental del funcionamiento de los sistemas informáticos, ya que implica la transferencia 
de datos entre el sistema y dispositivos externos.
Las operaciones de entrada/salida pueden ser sincrónicas o asíncronas, dependiendo de si el programa espera o no a que se complete
la operación antes de continuar con otras tareas.

<b>- Llamadas al sistema relacionadas con entrada/salida:</b>
Las llamadas al sistema como read() y write() son utilizadas por los programas para leer y escribir datos desde y hacia dispositivos 
de entrada/salida como archivos, sockets de red y dispositivos de hardware.
Otras llamadas al sistema relacionadas con entrada/salida incluyen open(), close(), ioctl(), fcntl(), select(), poll(), entre otras, 
que proporcionan diversas funcionalidades para gestionar y controlar operaciones de entrada/salida.

<b>- Optimización de entrada/salida:</b>
Los sistemas operativos implementan técnicas de optimización para mejorar el rendimiento de las operaciones de entrada/salida, como 
la utilización de búferes de entrada/salida, operaciones asíncronas y técnicas de multiplexación para gestionar múltiples operaciones 
de entrada/salida de manera eficiente.

<b>- Gestión de periféricos en sistemas embebidos: </b>
En sistemas embebidos, como Raspberry Pi, el mapeo de periféricos en memoria es una técnica común para acceder y controlar hardware 
externo, lo que permite a los programas interactuar directamente con los periféricos como si estuvieran accediendo a la memoria del 
sistema.

	</p>

</pre>

<pre>
	<p align=center>
<b># Programa Ejemplo: </b>
		</p>

Este programa utiliza las llamadas al sistema read() y write() para leer una cadena desde la entrada estándar (teclado) y escribirla 
en la salida estándar (pantalla). La entrada y salida estándar están representadas por los descriptores de archivo STDIN_FILENO y 
STDOUT_FILENO respectivamente.
</pre>
```C
User
#include <unistd.h> // Para las llamadas al sistema read() y write()

#define BUFFER_SIZE 256 // Tamaño del buffer para almacenar la cadena

int main() {
    char buffer[BUFFER_SIZE]; // Buffer para almacenar la cadena
    ssize_t bytes_read, bytes_written; // Variables para almacenar el número de bytes leídos y escritos

    // Leer desde la entrada estándar (teclado)
    bytes_read = read(STDIN_FILENO, buffer, BUFFER_SIZE);

    // Verificar si la lectura fue exitosa
    if (bytes_read > 0) {
        // Escribir en la salida estándar (pantalla)
        bytes_written = write(STDOUT_FILENO, buffer, bytes_read);
        
        // Verificar si la escritura fue exitosa
        if (bytes_written != bytes_read) {
            write(STDERR_FILENO, "Error escribiendo en la salida estándar.\n", 40);
            return 1; // Error al escribir
        }
    } else {
        write(STDERR_FILENO, "Error leyendo desde la entrada estándar.\n", 40);
        return 1; // Error al leer
    }

    return 0; // Éxito
}


```
