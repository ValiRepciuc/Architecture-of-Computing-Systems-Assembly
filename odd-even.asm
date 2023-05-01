;Par/Impar

.model small
.stack 100
.data 
	mesaj db "Introduceti un numar: $ "
	nr_par db 13,10,"Numarul este par.$"
	nr_impar db 13,10,"Numarul este impar.$"
.code
	
	mov ax,@data				   ; mutam data in registrul ax
	mov ds,ax				   ; initialiam .data in ds
	mov ah,9			           ; functia de afisare
	mov dx,offset mesaj			   ; aparitia mesajului "Introduceti un numar:"
	int 21h					   ; executam
	mov ah, 1				   ; citirea unui numar de la tastatura
	int 21h					   ; se transforma din caracter in numar
	sub al,30h				   ; convertste din caracter in numar
	mov ah,0				   ; citim un caracter si il notam in 
	mov bl,2				   ; pentru a imparti cu 2
	div bl					   ; il impartim pe bl
	
	cmp ah,1     				   ; comparam valoarea din ah cu 1
	je impar				   ; daca instructiunea de mai sus este adevarata sarim la flagul impar
	par:    				   ; altfel continuam cu flagul par
		mov ah, 9			   ; functia de afisare
		mov dx,offset nr_par		   ; aparitia mesajului "Numarul este par"
		mov ah,09h			   ; afiseaza mesaj
		int 21h				   ; executam
		jmp final                     	   ; sare la final
		
	impar:					  
	
		mov ah, 9 			   ; functia de afisare	
		mov dx,offset nr_impar		   ; aparitia mesajului "Numarul este impar"
		mov ah,09h			   ; afiseaza mesaj
		int 21h				   ; executare
		jmp final			   ; sarim la final
		
	final:					   
		
		mov ah,4ch			   ; terminare program
		int 21h				   ; executam
		
end
