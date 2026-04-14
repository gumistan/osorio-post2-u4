; macros.asm — biblioteca de macros utilitarias [cite: 28, 29]

%macro fin_dos 0
    mov ax, 4C00h
    int 21h
%endmacro [cite: 30, 31, 32]

%macro nueva_linea 0
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
%endmacro [cite: 40, 42, 44, 45, 46, 47, 48]

%macro print_str 1
    mov ah, 09h
    mov dx, %1
    int 21h
%endmacro [cite: 51, 53, 55, 56, 58]

%macro print_char 1
    mov ah, 02h
    mov dl, %1
    int 21h
%endmacro [cite: 61, 63, 65, 66, 67]

%macro leer_char 0
    mov ah, 07h
    int 21h
%endmacro [cite: 70, 71, 72, 73]

%macro repetir_str 2
    mov cx, %2
%%ciclo:
    mov ah, 09h
    mov dx, %1
    int 21h
    loop %%ciclo
%endmacro [cite: 80, 82, 83, 85, 87, 94, 95, 96]

%macro print_digito 0
    push ax
    and al, 0Fh
    add al, 30h
    mov ah, 02h
    mov dl, al
    int 21h
    pop ax
%endmacro [cite: 100, 104, 105, 106, 107, 109, 111, 112, 114, 115]