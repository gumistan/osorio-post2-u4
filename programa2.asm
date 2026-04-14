; programa2.asm — Laboratorio Final Unidad 4
%include "macros.asm"

section .data
    titulo      db "=== PROGRAMA INTEGRADOR NASM ===", 0Dh, 0Ah, 24h
    linea_a     db "Repeticion de prueba...", 0Dh, 0Ah, 24h
    msg_suma    db "Suma de 1 a 3 es: ", 24h
    msg_mayor   db "El valor mayor es: ", 24h
    msg_iguales db "Los valores son iguales.", 0Dh, 0Ah, 24h
    msg_fin     db 0Dh, 0Ah, "Laboratorio finalizado con exito.", 0Dh, 0Ah, 24h

section .bss
    valor_a resw 1
    valor_b resw 1

section .text
    global main

main:
    mov ax, data
    mov ds, ax

    ; 1. Encabezado
    print_str titulo

    ; 2. Bucle con macro
    repetir_str linea_a, 3
    nueva_linea

    ; 3. Prueba de Suma (1+2+3 = 6)
    print_str msg_suma
    mov cx, 3
    call sumar_serie
    print_digito
    nueva_linea
    nueva_linea

    ; 4. Comparación 1: 9 vs 4 (Caso AX Mayor)
    mov ax, 9
    mov bx, 4
    call comparar_e_imprimir

    ; 5. Comparación 2: 5 vs 5 (Caso Iguales)
    mov ax, 5
    mov bx, 5
    call comparar_e_imprimir

    ; 6. Finalización
    print_str msg_fin
    fin_dos

; --- PROCEDIMIENTOS ---

sumar_serie:
    push cx
    xor ax, ax
.paso:
    add ax, cx
    loop .paso
    pop cx
    ret

comparar_e_imprimir:
    push ax
    push bx
    cmp ax, bx
    je .son_iguales
    jg .ax_mayor
    ; Caso BX mayor
    print_str msg_mayor
    mov al, bl
    print_digito
    jmp .fin_comp
.ax_mayor:
    print_str msg_mayor
    print_digito
    jmp .fin_comp
.son_iguales:
    print_str msg_iguales
.fin_comp:
    nueva_linea
    pop bx
    pop ax
    ret