include win64a.inc
; Аппаратное шифрование AES

; AESENC — Выполнить один раунд шифрования AES.
; AESENCLAST- Выполнить последний раунд шифрования AES.

.data 

; Данные для шифрования.

Secret_data   db 'Lorem ipsum dolor sit amet',0  ; Шифруемая фраза.
Crypted_data  db '                          ',0  ; Зашифрованные данные.
Pass_data     dd 99h                             ; Пароль для шифрования.

.code 

WinMain proc

    movdqu xmm0, [offset Secret_data] ; Шифруемые данные.
    movdqu xmm1, [offset Pass_data]  ; Пароль.

; Шифрование
    aesenc xmm0, xmm1          ; Шифруем блок данных. Зашифрованный блок в регистре xmm0.
    aesenclast xmm0, xmm2      ; Выполняем последний раунд шифрования.
            
; Дешифрование                   
    aesimc xmm1,xmm1           ; Обратный Mix Columns.
    aesdec xmm0, xmm1          ; Дешифруем блок из регистра xmm0.
    aesdeclast xmm0, xmm2;     ; Последний раунд дешифрования.


 invoke ExitProcess,0

WinMain endp



end	