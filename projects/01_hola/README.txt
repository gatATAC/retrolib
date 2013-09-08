Descripción
===========

Ver http://gatatac.org/projects/retrolib/wiki/01_Hola para información más actualizada.

Este programa es el típico "Hola, mundo".

Pertenece a la página de Avelino Herrera Morales: http://msx.atlantes.org/index_es.html  En dicha página su nombre era ej.c y se ha cambiado por hola.c.

Compilación
===========

Para compilarlo, simplemente se entra en el directorio build y se ejecuta 'make'.  El fichero resultante se llama hola.com.

Como requisito, aparte de la retrolib, está el tener instalado el compilador SDCC.  También es necesario tener el make de GNU.

Comprobado con:

Linux Fedora 18 64 bits
GNU Make 3.82
SDCC v3.2.0 #8008

Ejecución
=========

Para ejecutarlo, copiarlo en un disquette y arrancarlo desde la línea de comandos de MSX-DOS sin argumentos, p.e.

> ej

Para ejecutarlo en un emulador openMSX, ejecutar una máquina emulada que tenga disquetera (recomendamos catapult) y decirle que una de las disqueteras sea un directorio de la máquina anfitrión (el PC).  En ese directorio copiaremos el programa y los ficheros necesarios para que se arranque el MSX-DOS (command.com y msxdos.sys).  Arrancaremos la máquina y desde la línea de comandos MSX-DOS ejecutaremos la prueba:

> ej

(c) 2013 gatATAC en lo que no se reconozca expresamente la autoría a otra persona.
Licencia GPL v2.
