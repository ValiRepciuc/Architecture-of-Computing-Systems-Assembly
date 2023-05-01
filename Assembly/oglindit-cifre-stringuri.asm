;Manipularea unui sir

.model small
.stack 100
.data
mesaj db 13,10,'Introduceti sirul:','$'
sir db 80 dup ('$')           		    ; reevaluam stringul
.code
    mov ax, @data                           ; mutam data in registrul ax
    mov ds, ax                              ; initializam .data in ds
    mov ah, 9                               ; functia de afisare
    mov dx, offset mesaj                    ; aparitia mesajului "Introduceti sirul:"
    int 21h                                 ; executam
    mov ah, 0ah            	            ; creste sirul
    mov dx, offset sir                      ; tinem adresa sirului in dx
    int 21h                                 ; executam 
    mov ah, 02h                             ; setam modul de afisare
    mov dl, 0ah                             ; linie noua
    int 21h                                 ; executam
parcurgere: 				    ; calculam distanta de la baza la caracterul $
    mov al, [sir + si + 2]                  ; aduna baza cu indexul si +2
    inc si                                  ; incrementam.
    cmp al, 24H                             ; este caracterul curent $?
    jne parcurgere                          ; daca nu continuam pana ajungem la caracterul $
afisare: 			            ; implicit sarim aici cu un scop, mergem invers prin decrementam
    mov al, [sir + si]                      ; reinitializam AL incepand exact de la adresa pozitiei lui $
    dec si                                  ; decrementam
    mov dl, al                              ; mutam acel continut pe display pentru a arata inversat
    int 21h                                 ; executam
    cmp si, 01h                             ; revenim la indexul de baza +1?
    jne afisare                             ; daca nu sarim inapoi pana ajungem la 0
    mov ax, 4c00h                           ; executia finala
    int 21h                                 ; executam
end					    ; final
