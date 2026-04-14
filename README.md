# osorio-post2-u4

## Descripción
Laboratorio 2 de la Unidad 4: Implementación de macros con parámetros, etiquetas locales y control de flujo (bucles y condicionales) en NASM.

## Prerrequisitos
- DOSBox 0.74+ 
- NASM 2.14+ 
- ALINK 
- Soporte DPMI (cwsdpmi.exe y ALINK.RSX) 

## Estructura del Proyecto
- `macros.asm`: Biblioteca modular que contiene un conjunto de macros reutilizables para operaciones frecuentes de DOS (finalizar programa, saltos de línea, impresión de cadenas, lectura de teclado y bucles controlados).

## Compilación y ejecución
nasm -f obj programa2.asm -o programa2.obj -l programa2.lst 
alink programa2.obj -oEXE -o programa2.exe -entry main 
Ejecutar programa2.exe dentro de DOSBox 