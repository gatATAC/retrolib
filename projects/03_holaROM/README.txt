Descripción
===========

Ver http://gatatac.org/projects/retrolib/wiki/03_holaROM para información más actualizada.

Este programa es un hola mundo en formato ROM desarrollado por Alberto Orante.  Puedes verlo en su página: 

http://psged.blogspot.com.es/2010/04/hello-world.html

Compilación
===========

Para compilarlo, simplemente se entra en el directorio build y se ejecuta 'make'.  El fichero resultante se llama HelloSC2.rom.

Como requisito, aparte de la retrolib, está el tener instalado el compilador SDCC.  También es necesario tener el make de GNU.

Comprobado con:

Linux Fedora 18 64 bits
GNU Make 3.82
SDCC v3.2.0 #8008

Ejecución
=========

Para ejecutarlo desde un MSX... bueno, tendrás que meterlo en un cartucho, y nosotros no sabemos!

Para ejecutarlo en un emulador openMSX, ejecutar cualquier máquina MSX e introducirle el fichero HelloSC2.rom en un slot de cartucho.  Arrancaremos la máquina y aparecerá el programa.

También puedes, simplemente, lanzar el comando:

> openmsx HelloSC2.rom

NOTAS: 
======

La compilación de MSX ROM ha dado problemas con SDCC 3.2.0 debido a un bug que hace aparecer un warning de que una línea de ensamblador no ha podido ser parseada.  

> Warning: z80instructionSize() failed to parse line node ld sp, (#0xFC4A)

Esto se soluciona actualizando a la 3.3.0.  Se ha probado satisfactoriamente con la 2.9.7 y la 3.3.0, y ha fallado con la 3.2.0.

Además, con la versión 3.3.0 es necesario usar un flag para que realice la ubicación de registros con el método antiguo, flag que no es necesario en la 2.9.7.

>  --oldralloc


(c) 2013 gatATAC en lo que no se reconozca expresamente la autoría a otra persona.
Licencia GPL v2.
