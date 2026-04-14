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
- `programa2.asm`: Programa principal que utiliza `%include` para invocar las macros y realizar impresiones repetitivas.
- `Procedimiento sumar_serie`: Implementa un bucle `LOOP` para realizar la suma acumulada de 1 hasta N, demostrando el uso de la pila (`push`/`pop`) y el registro acumulador `AX`.
- `Procedimiento comparar_e_imprimir`: Lógica de decisión mediante saltos condicionales.

## Compilación y ejecución
Para compilar y enlazar el programa en DOSBox:
## Compilación y ejecución
nasm -f obj programa2.asm -o programa2.obj -l programa2.lst 
alink programa2.obj -oEXE -o programa2.exe -entry main 
Ejecutar programa2.exe dentro de DOSBox 