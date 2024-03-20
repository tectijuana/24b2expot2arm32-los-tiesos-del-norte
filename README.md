
<!---
   Para comentarios usar este bloque para documentar pendientes, secuencias, etc.
--->


![](https://s3.amazonaws.com/videos.pentesteracademy.com/videos/badges/low/arm-assembly.png)

Borrar y modificar README

# Utilizar los dos directorios

- code  - ahi depositar sus programas los ***archivos extensión *.s****  (Source File) algunos autores en x86 de ponen .asm y en otras plataformas ARM compatibles la extension *.s
- Todo programa lleva su comentario en la parte de arriba, objetivo y nombre del programador minimo, como templete
- images  - de haber algo de pantallas ahi se presentaran, su busca documentarlas en MARKDOWN el código es:

``` ![](images/---archivo.jpg---) recordar que no lleva espacios```

<!---
  Los nombres de las imagenes no deben cambiar de preferenci el nombre del programa como:  KIOSKO.cpp (su pantallas serian KISOCO.jpg, KIOSCO-1.jpg, KIOSCO-2.jpg ... )
  Y asi procurar estar agrupados.
--->



- Programa en MarkDown es inicia con tres tildes * (`) sin espacio, seguido de el lenguaje de programacion, al final del codigo se poner otra vez los mismos tilder..

No se usan espacios en nombres de archivos, usar los nombres estilo camelCase (primera palabra minusculas, mayuscula solo la 1ra letra de cada palabra subsecuente):  ejemplo: sensorHumo, etc.

Suerte.



------

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

Alumnos:
Aguiñaga Flores Luis Fernando - 21210354
Perez Gonzalez Kevin William - 21212019
Luna Bernal Juan Francisco - 21210393
Martinez Flores Manuel Andres - 21210396
Gamboa Hernández Esmeralda - 21210374

	</p>

</pre>

<pre>

	<p align=left>

Repositorio en el cual se desarrollaron distintos ejercicios en el lenguaje de 
programacion c++, tomados del libro "Problemas para resolver con computadora" 
1ra edicion (1985), por el autor Donald D. Spencer. 

Los ejercicios corresponden al capitulo 6 del libro, entre las paginas 77 a 86.
Se realizaron 25 problemas debido a la entrega fuera del limite de tiempo.

CONDICIONES:

	EXTEMPORÁNEOS DE LA FECHA DE ENTREGA, despues del 25 de marzo y 1 segundo:

	-Solo 25 problemas a resolver y están en aleatorio las condiciones de uso, 
		algunos simples otros de recordar, etc. CAPITULO 6 en adelante.

	-Agregar las indicaciones de los criterios de la rùbrica
	
RÚBRICA:

        Todo problema es necesario siga el templete OBLIGATORIO para entregar el 
		problema codificado, usted puede correr sus programas con su estilo 
		pero ya que este funcionando, debe arreglarlo a presentación para su 
		evaluación.

        MODIFICAR LA PORTADA CON MARKDOWN Y ACTUALIZARLA, esta libre de cambiar 
		todo.
        Los archivos deben tener su extensión .CPP (no .txt, etc.)

	Los problemas están en la relación siguiente:
	
	- 100% Sigue el templete proporcionado por el docente y corren 10 
		Problemas (o si incremento en programas por supuesta dificultad) 
		completamente en GITHUB Classroom (no repositorio personal),  los 
		archivos deben tener su extensión .CPP (no .txt, .EXE, etc.) acomodados 
		en dentro de un directorio  (sin acentos o simbolos) SOLO FUENTES, y 
		modifica el README.md que sea una portada.
	- 80% Sigue el templete proporcionado por el docente y corre 8 Problemas 
		(o si incremento en programas por supuesta dificultad) completamente 
		en GITHUB Classroom (no repositorio personal), los archivos deben 
		tener su extensión .CPP (no .txt, etc.) acomodados en dentro de un 
		directorio (sin acentos o simbolos) SOLO FUENTES, y modifica el 
		README.md que sea una portada.
	- 70% Sigue el templete proporcionado por el docente y corre 7 Problemas 
		(o si incremento en programas por supuesta dificultad) completamente 
		en GITHUB Classroom (no repositorio personal), los archivos deben 
		tener su extensión .CPP (no .txt, etc.) acomodados en dentro de un 
		directorio (sin acentos o simbolos) SOLO FUENTES, y modifica el 
		README.md que sea una portada.
	- 50 % EVITA Y NO USA el templete proporcionado por el docente sus Problemas 
		(o si incremento en programas por supuesta dificultad) completamente 
		en GITHUB Classroom (no repositorio personal) con mas de 7 problemas 
		resueltos, los archivos NO tener su extensión .CPP y  puede o no estar 
		acomodados en dentro de un directorio (sin acentos o simbolos) 
		SOLO FUENTES, y modifica el README.md que sea una portada.

ENTREGA:

	URL del GitHub Classroom, y recuerde arreglar la PORTADA, quitar todos los 
		elementos extras del templete, acomodarlo bien para su presentación 
		solo lo necesario.

	</p>

</pre>

# 6. Llamadas al sistema y entrada/salida
# Marco Teórico:
En sistemas operativos basados en Linux, las llamadas al sistema son la forma en que un programa solicita servicios del núcleo del sistema operativo. Estas llamadas permiten a los programas acceder a recursos del sistema como archivos, dispositivos de hardware, y otros servicios del kernel. Las llamadas al sistema proporcionan una interfaz entre el espacio de usuario y el espacio del kernel, permitiendo a los programas ejecutarse de manera segura y eficiente.

Para operaciones de entrada/salida, los programas pueden utilizar llamadas al sistema como read() y write(), que permiten leer y escribir datos desde y hacia dispositivos, archivos o flujos de datos. Estas llamadas al sistema están optimizadas para interactuar eficientemente con el hardware y proporcionar una interfaz estándar para los programas.

En sistemas embebidos como Raspberry Pi, el mapeo de periféricos en memoria es una técnica común para acceder y controlar hardware externo. Esto implica asignar direcciones de memoria a los registros de control de los periféricos, lo que permite a los programas interactuar directamente con ellos como si estuvieran accediendo a la memoria.

# Programa Ejemplo:

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
