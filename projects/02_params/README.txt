Descripción
===========

Ver http://gatatac.org/projects/retrolib/wiki/02_Params para información más actualizada.

Este proyecto es una prueba sencilla de paso de argumentos de la línea de comandos MSX-DOS al programa.  Necesita la variante advanced de la inicialización.

Pertenece a la página de Avelino Herrera Morales: http://msx.atlantes.org/index_es.html

Hemos añadido también dos llamadas a dos funciones para probar que el usuario puede añadir otros ficheros fuente con nuestro Makefile.

Compilación
===========

Para compilarlo, simplemente se entra en el directorio build y se ejecuta 'make'.  El fichero resultante se llama params.com.

Como requisito, aparte de la retrolib, está el tener instalado el compilador SDCC.  También es necesario tener el make de GNU.

Comprobado con:

Linux Fedora 18 64 bits
GNU Make 3.82
SDCC v3.2.0 #8008

Ejecución
=========

Para ejecutarlo, copiarlo en un disquette y arrancarlo desde la línea de comandos de MSX-DOS con o sin argumentos, p.e.

> params pelota coche scalextric

Para ejecutarlo en un emulador openMSX, ejecutar una máquina emulada que tenga disquetera (recomendamos catapult) y decirle que una de las disqueteras sea un directorio de la máquina anfitrión (el PC).  En ese directorio copiaremos el programa y los ficheros necesarios para que se arranque el MSX-DOS (command.com y msxdos.sys).  Arrancaremos la máquina y desde la línea de comandos MSX-DOS ejecutaremos la prueba:

> params pelota coche scalextric

NOTAS
=====

Hemos hecho uso de las macros _MSX_CROSS_COMPILER para lograr que compile y ejecute también en GNU C sobre una máquina PC (Linux).

(c) 2013 gatATAC en lo que no se reconozca expresamente la autoría a otra persona.
Licencia GPL v2.
