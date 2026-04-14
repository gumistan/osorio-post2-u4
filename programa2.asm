; programa2.asm — Laboratorio Post2 Unidad 4
%include "macros.asm" ; incluir biblioteca de macros utilitarias

section .data
    titulo db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, 24h
    linea_a db "[Linea A] Primera impresion", 0Dh, 0Ah, 24h
    linea_b db "[Linea B] Segunda impresion", 0Dh, 0Ah, 24h
    msg_fin db "Fin del programa.", 0Dh, 0Ah, 24h

section .bss
    ; Reservaremos espacio para variables en el siguiente paso
    valor_a resw 1
    valor_b resw 1

section .text
    global main

main:
    ; Configuración del segmento de datos
    mov ax, data
    mov ds, ax

    ; --- Demostración de macros ---
    
    ; 1. Imprimir el título
    print_str titulo 
    
    ; 2. Demostración de macro repetir_str (con parámetros)
    repetir_str linea_a, 3 ; imprime linea_a 3 veces
    nueva_linea            ; baja de renglón
    
    repetir_str linea_b, 2 ; imprime linea_b 2 veces
    nueva_linea

    ; 3. Finalizar
    print_str msg_fin
    fin_dos ; cerrar programa