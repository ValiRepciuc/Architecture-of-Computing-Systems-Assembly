;Verificare daca un numar citit de la tastatura este >, < sau = cu 3
.model small
.stack 100
.data
	mesaj db "Introduceti numarul pe care doriti sa il comparati: $"
	mai_mare db 13,10,"Numarul introdus este mai mare.$"
	egal db 13,10,"Numarul introdus este egal.$"
	mai_mic db 13,10,"Numarul introdus este mai mic.$"

.code 


mov ax,@data					 ; mutam data in registrul ax
mov ds,ax					 ; initializam .data in ds
mov ah,9					 ; functia de affisare
mov dx, offset mesaj				 ; aparitia mesajului "Introduceti numarul pe care doriti sa il comparati:"
int 21h						 ; executam

mov ah, 01h					 ; adaugam elementul dorit de la tastatura pentru a compara cu 3
int 21h						 ; executam

and al,0fh					 ; 
cmp al,3					 ; comparam valoarea din al cu 3
jg  maimare					 ; daca valoarea din al este > decat 3 facem jump la maimare
jl maimic                                        ; daca valoarea din al este < decat 3 facem jump la maimic
mov ah, 9					 ; functia de afisare
mov dx, offset egal			         ; daca valoarea din al este = cu 3 va aparea mesajul "Numarul introdus este egal."
mov ah,09h			                 ; afiseaza mesaj
int 21h						 ; executam	
jmp final					 ; sare la final

maimare:
	mov ah, 9 				 ; functia de afisare
	mov dx,offset mai_mare			 ; aparitia mesajului "Numarul introdus este mai mare."
	mov ah,09h			   	 ; afiseaza mesaj
	int 21h					 ; executam
	jmp final				 ; sare la final

maimic:
	mov ah, 9 				 ; functia de afisare
	mov dx,offset mai_mic			 ; aparitia mesajului "Numarul introdus este mai mic."
	mov ah,09h			   	 ; afiseaza mesaj
	int 21h					 ; executam
	jmp final				 ; sare la final

final:
	mov ah,4ch				 ; terminare program
	int 21h					 ; executam

end						 ; final
