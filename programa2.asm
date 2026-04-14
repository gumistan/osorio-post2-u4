; programa2.asm — Laboratorio Post2 Unidad 4
%include "macros.asm" ; incluir biblioteca de macros utilitarias

section .data
    titulo db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, 24h
    linea_a db "[Linea A] Primera impresion", 0Dh, 0Ah, 24h
    linea_b db "[Linea B] Segunda impresion", 0Dh, 0Ah, 24h
    msg_suma db "Resultado de la suma (1+2+3): ", 24h
    msg_fin db "Fin del programa.", 0Dh, 0Ah, 24h

section .bss
    valor_a resw 1
    valor_b resw 1

section .text
    global main

main:
    ; Configuración del segmento de datos
    mov ax, @data
    mov ds, ax

    ; 1. Imprimir el título
    print_str titulo 
    
    ; 2. Demostración de macro repetir_str
    repetir_str linea_a, 3 
    nueva_linea            
    
    repetir_str linea_b, 2 
    nueva_linea

    ; --- PASO 4: Lógica de la suma acumulativa ---
    print_str msg_suma  ; Imprime el texto de la suma
    
    mov cx, 3           ; Queremos sumar 1+2+3
    call sumar_serie     ; Llamamos al procedimiento (el resultado queda en AX)
    
    print_digito        ; Macro que convierte el 6 de AX a texto y lo imprime
    nueva_linea
    nueva_linea

    ; 3. Finalizar
    print_str msg_fin
    fin_dos ; cerrar programa

; ---------------------------------------------------------
; Procedimiento: suma acumulativa 1+2+3+...+N
; Entrada: CX = N 
; Salida: AX = suma total
; ---------------------------------------------------------
sumar_serie:
    push cx         ; Guardamos CX para no perder el contador original
    xor ax, ax      ; AX = 0 (aquí empezamos a sumar)
.paso:
    add ax, cx      ; Sumamos el valor actual de CX a AX
    loop .paso      ; Resta 1 a CX y salta a .paso si CX no es 0
    pop cx          ; Recuperamos el valor original de CX
    ret             ; Regresamos a donde nos llamaron