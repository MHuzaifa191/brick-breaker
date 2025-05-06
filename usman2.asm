

printword macro val1, val2
mov ah, val1
add ah, 48
mov al, val2
add al, 48
mov rand, ax
mov al,05
mov bh,0
mov bl,14
mov cx, 2
mov dl,22
mov dh,4
mov bp,seg rand
mov es,bp
mov bp, offset rand
mov ah,13h
int 10h
mov rand, 0
endm

updateHearts macro

.if (hearts == 2)
construct H1
.elseif (hearts == 1)
construct H2
.elseif (hearts == 0)
jmp endMenu


.endif

endm

printMenu macro

mov dx,17

Start:

mov cx, 10

INNER:

mov al, 5
mov ah, 0CH 
INT 10H

inc cx
cmp cx,316
jne INNER

inc dx

cmp dx,45
jne Start
mov al,4
mov cx,40
mov dx,30
int 10h

mov al,4
mov cx,39
mov dx,29
int 10h
mov al,4
mov cx,38
mov dx,28
int 10h

mov al,4
mov cx,37
mov dx,28
int 10h

mov al,4
mov cx,36
mov dx,28
int 10h
mov al,4
mov cx,35
mov dx,28
int 10h

mov al,4
mov cx,34
mov dx,29
int 10h

mov al,4
mov cx,34
mov dx,30
int 10h

mov al,4
mov cx,34
mov dx,31
int 10h

mov al,4
mov cx,35
mov dx,32
int 10h


mov al,4
mov cx,36
mov dx,33
int 10h


mov al,4
mov cx,37
mov dx,34
int 10h


mov al,4
mov cx,38
mov dx,35
int 10h

mov al,4
mov cx,39
mov dx,36
int 10h

mov al,4
mov cx,40
mov dx,37
int 10h

mov al,4
mov cx,41
mov dx,36
int 10h

mov al,4
mov cx,42
mov dx,35
int 10h

mov al,4
mov cx,43
mov dx,34
int 10h

mov al,4
mov cx,44
mov dx,33
int 10h

mov al,4
mov cx,45
mov dx,32
int 10h

mov al,4
mov cx,46
mov dx,31
int 10h

mov al,4
mov cx,46
mov dx,30
int 10h

mov al,4
mov cx,46
mov dx,29
int 10h

mov al,4
mov cx,45
mov dx,28
int 10h

mov al,4
mov cx,44
mov dx,28
int 10h

mov al,4
mov cx,43
mov dx,28
int 10h

mov al,4
mov cx,42
mov dx,29
int 10h

mov al,4
mov cx,41
mov dx,30
int 10h

mov al,4
mov cx,41
mov dx,31
int 10h

;2

mov al,4
mov cx,55
mov dx,30
int 10h

mov al,4
mov cx,54
mov dx,29
int 10h
mov al,4
mov cx,53
mov dx,28
int 10h

mov al,4
mov cx,52
mov dx,28
int 10h

mov al,4
mov cx,51
mov dx,28
int 10h
mov al,4
mov cx,50
mov dx,28
int 10h

mov al,4
mov cx,49
mov dx,29
int 10h

mov al,4
mov cx,49
mov dx,30
int 10h

mov al,4
mov cx,49
mov dx,31
int 10h

mov al,4
mov cx,50
mov dx,32
int 10h


mov al,4
mov cx,51
mov dx,33
int 10h


mov al,4
mov cx,52
mov dx,34
int 10h


mov al,4
mov cx,53
mov dx,35
int 10h

mov al,4
mov cx,54
mov dx,36
int 10h

mov al,4
mov cx,55
mov dx,37
int 10h

mov al,4
mov cx,56
mov dx,36
int 10h

mov al,4
mov cx,57
mov dx,35
int 10h

mov al,4
mov cx,58
mov dx,34
int 10h

mov al,4
mov cx,59
mov dx,33
int 10h

mov al,4
mov cx,60
mov dx,32
int 10h

mov al,4
mov cx,61
mov dx,31
int 10h

mov al,4
mov cx,61
mov dx,30
int 10h

mov al,4
mov cx,61
mov dx,29
int 10h

mov al,4
mov cx,60
mov dx,28
int 10h

mov al,4
mov cx,59
mov dx,28
int 10h

mov al,4
mov cx,58
mov dx,28
int 10h

mov cx,57
mov dx,29
int 10h

mov al,4
mov cx,56
mov dx,30
int 10h

;3

mov al,4
mov cx,70
mov dx,30
int 10h

mov al,4
mov cx,69
mov dx,29
int 10h
mov al,4
mov cx,68
mov dx,28
int 10h

mov al,4
mov cx,67
mov dx,28
int 10h

mov al,4
mov cx,66
mov dx,28
int 10h

mov al,4
mov cx,65
mov dx,28
int 10h

mov al,4
mov cx,64
mov dx,29
int 10h

mov al,4
mov cx,64
mov dx,30
int 10h

mov al,4
mov cx,64
mov dx,31
int 10h

mov al,4
mov cx,65
mov dx,32
int 10h


mov al,4
mov cx,66
mov dx,33
int 10h


mov al,4
mov cx,67
mov dx,34
int 10h


mov al,4
mov cx,68
mov dx,35
int 10h

mov al,4
mov cx,69
mov dx,36
int 10h

mov al,4
mov cx,70
mov dx,37
int 10h

mov al,4
mov cx,71
mov dx,36
int 10h

mov al,4
mov cx,72
mov dx,35
int 10h

mov al,4
mov cx,73
mov dx,34
int 10h

mov al,4
mov cx,74
mov dx,33
int 10h

mov al,4
mov cx,75
mov dx,32
int 10h

mov al,4
mov cx,76
mov dx,31
int 10h

mov al,4
mov cx,76
mov dx,30
int 10h

mov al,4
mov cx,76
mov dx,29
int 10h

mov al,4
mov cx,75
mov dx,28
int 10h

mov al,4
mov cx,74
mov dx,28
int 10h

mov al,4
mov cx,73
mov dx,28
int 10h

mov cx,72
mov dx,29
int 10h

mov al,4
mov cx,71
mov dx,30
int 10h

updateHearts

mov al, 5
mov bl, 00001111b
mov cx, msg1end - offset string; calculate message size. 
mov dl, 16
mov dh, 4
push cs
pop es
mov bp, offset string
mov ah, 13h
int 10h
jmp msg1end
string db "Score : "
msg1end:


mov al,05
mov bh,0
mov bl,15
mov cx,lengthof named
mov dl,31
mov dh,4
mov bp,seg named
mov es,bp
mov bp,offset named
mov ah,13h
int 10h

.if (levelnum == 1)
mov al, 1
mov bl, 00001111b
mov cx, msg1end1 - offset string1; calculate message size. 
mov dl, 30
mov dh, 1
push cs
pop es
mov bp, offset string1
mov ah, 13h
int 10h
jmp msg1end1
string1 db "Level: 1"
msg1end1:
.elseif (levelnum == 2)
mov al, 1
mov bl, 00001111b
mov cx, msglevel - offset stringlevel; calculate message size. 
mov dl, 30
mov dh, 1
push cs
pop es
mov bp, offset stringlevel
mov ah, 13h
int 10h
jmp msglevel
stringlevel db "Level: 2"
msglevel:
.endif


; mov al, 5
; mov bl, 00001111b
; mov cx, msg1end2 - offset string2; calculate message size. 
; mov dl, 32
; mov dh, 3
; push cs
; pop es
; mov bp, offset string2
; mov ah, 13h
; int 10h
; jmp msg1end2
; string2 db "Huzaifa"
; msg1end2:



mov val1,10
mov val2,16

mov cx,307
s1:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,val1
mov dx,val2
int 10h
inc val1
pop cx

loop s1
mov val1,10
mov cx,173

s2:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,val1
mov dx,val2
int 10h
inc val2
pop cx

loop s2

mov val1,10
mov val2,189
mov cx,307
s3:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,val1
mov dx,val2
int 10h
inc val1
pop cx

loop s3


mov val1,316
mov val2,188
mov cx,172
s4:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,val1
mov dx,val2
int 10h
dec val2
pop cx

loop s4
endm

