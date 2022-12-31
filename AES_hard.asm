include win64a.inc
; ���������� ���������� AES

; AESENC � ��������� ���� ����� ���������� AES.
; AESENCLAST- ��������� ��������� ����� ���������� AES.

.data 

; ������ ��� ����������.

Secret_data   db 'Lorem ipsum dolor sit amet',0  ; ��������� �����.
Crypted_data  db '                          ',0  ; ������������� ������.
Pass_data     dd 99h                             ; ������ ��� ����������.

.code 

WinMain proc

    movdqu xmm0, [offset Secret_data] ; ��������� ������.
    movdqu xmm1, [offset Pass_data]  ; ������.

; ����������
    aesenc xmm0, xmm1          ; ������� ���� ������. ������������� ���� � �������� xmm0.
    aesenclast xmm0, xmm2      ; ��������� ��������� ����� ����������.
            
; ������������                   
    aesimc xmm1,xmm1           ; �������� Mix Columns.
    aesdec xmm0, xmm1          ; ��������� ���� �� �������� xmm0.
    aesdeclast xmm0, xmm2;     ; ��������� ����� ������������.


 invoke ExitProcess,0

WinMain endp



end	