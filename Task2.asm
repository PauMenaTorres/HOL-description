.686
.model flat

.data
quo dw 0            ; Cociente de la división
rem dw 0            ; Residuo de la división


.code
_main proc
	xor edx, edx    ; Limpiar registro de residuo
    mov ax, 10    ; Dividendo
    mov bx, 2      ; Divisor
    xor ecx, ecx    ; Inicializar el contador de cociente a cero

    ; Realizar la división
    cmp ax, bx      ; Comparar dividendo y divisor
    jb fin          ; Si el dividendo es menor al divisor, terminar
    
dividir:
    sub ax, bx      ; Restar el divisor del dividendo
    inc ecx         ; Incrementar el cociente
    cmp ax, bx      ; Comparar dividendo y divisor
    jae dividir     ; Si el dividendo es mayor o igual al divisor, continuar
    
    ; Guardar el residuo en el registro EDX
    mov dx, ax      ; El residuo es el valor actual del dividendo
    jmp fin         ; Terminar el programa

fin:
    ; Resultado de la división
    mov quo, cx     ; Mover el cociente a una variable
    mov rem, dx     ; Mover el residuo a otra variable
    
    ; Salida del programa
    mov eax, 0      ; Establecer el código de salida en 0
    ret             ; Retornar de la función _main


_main endp

end _main