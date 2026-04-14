; programa2.asm — Laboratorio Post2 Unidad 4
%include "macros.asm" ; incluir biblioteca de macros utilitarias

section .data
    titulo      db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, 24h
    linea_a     db "[Linea A] Primera impresion", 0Dh, 0Ah, 24h
    linea_b     db "[Linea B] Segunda impresion", 0Dh, 0Ah, 24h
    msg_suma    db "Suma acumulada (1+2+3): ", 24h
    msg_mayor   db "El valor mayor es: ", 24h
    msg_iguales db "Los valores son iguales.", 0Dh, 0Ah, 24h
    msg_fin     db 0Dh, 0Ah, "Fin del programa.", 0Dh, 0Ah, 24h

section .bss
    valor_a resw 1
    valor_b resw 1

section .text
    global main

main:
    ; 1. Configuración inicial del segmento de datos
    mov ax, data
    mov ds, ax

    ; 2. Demostración de macros (Paso 3)
    print_str titulo 
    repetir_str linea_a, 3 
    nueva_linea            
    
    repetir_str linea_b, 2 
    nueva_linea

    ; 3. Ejecución de la Suma Acumulativa (Paso 4)
    print_str msg_suma
    mov cx, 3           ; N = 3 (1+2+3 = 6)
    call sumar_serie    ; El resultado queda en AX
    print_digito        ; Imprime el '6'
    nueva_linea
    nueva_linea

    ; 4. Ejecución de la Comparación (Paso 5)
    ; Caso de prueba: AX=7 vs BX=3
    mov ax, 7
    mov bx, 3
    call comparar_e_imprimir

    ; 5. Finalización
    print_str msg_fin
    fin_dos 

; ---------------------------------------------------------
; PROCEDIMIENTOS 
; ---------------------------------------------------------

; --- Procedimiento: sumar_serie ---
sumar_serie:
    push cx         ; Preservar contador
    xor ax, ax      ; Limpiar acumulador
.paso:
    add ax, cx      ; Sumar
    loop .paso      ; Decrementar CX y saltar si no es cero
    pop cx          ; Restaurar contador
    ret

; --- Procedimiento: comparar_e_imprimir ---
comparar_e_imprimir:
    push ax
    push bx
    cmp ax, bx      ; Comparar AX y BX
    je .son_iguales ; Salto si son iguales
    jg .ax_mayor    ; Salto si AX > BX
    
    ; Caso BX es mayor 
    print_str msg_mayor
    mov al, bl      ; Mover el mayor (BX) a AL para imprimir
    print_digito
    jmp .fin_comp   ; Saltar al final para evitar ejecutar el caso AX mayor

.ax_mayor:
    print_str msg_mayor
    print_digito    ; AX ya está en la parte baja (AL)
    jmp .fin_comp

.son_iguales:
    print_str msg_iguales

.fin_comp:
    nueva_linea
    pop bx
    pop ax
    ret