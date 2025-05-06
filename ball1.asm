printball macro

mov cx, black_ballx
mov dx, black_bally

call trail                 

mov cx, ball_posx
mov dx, ball_posy

call drawball

endm

setspeed macro
mov ah, 2ch
int 21h

cmp dl, TIME_AUX
je nojump

mov TIME_AUX, dl
mov ax, ball_speed
endm

flipY macro

.if (boolean==1)
mov bool_top, 1
mov bool_bottom, 0
mov boolean, 0
.else
mov bool_top, 0
mov bool_bottom, 1
mov boolean, 1
.endif

endm

flipX macro

.if (boolean1==1)
mov bool_right, 0
mov bool_left, 1
mov boolean1, 0
.else
mov bool_right, 1
mov bool_left, 0
mov boolean1, 1
.endif

endm


;_________________ BLACK BALL__________________

clear_trail macro
mov cx, black_ballx
mov dx, black_bally

horizontal1:
mov ah, 0ch
mov al, 00h
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, black_ballx
cmp ax, 04h
jng horizontal1
mov cx, black_ballx
inc dx
mov ax, dx
sub ax, black_bally
cmp ax, 04h
jng horizontal1
endm

clear_trail2 macro
mov cx, black_ballx
mov dx, black_bally

horizontal2:
mov ah, 0ch
mov al, 00h
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, black_ballx
cmp ax, 04h
jng horizontal2
mov cx, black_ballx
inc dx
mov ax, dx
sub ax, black_bally
cmp ax, 04h
jng horizontal2
endm


clear_trail3 macro
mov cx, black_ballx
mov dx, black_bally

horizontal3:
mov ah, 0ch
mov al, 00h
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, black_ballx
cmp ax, 04h
jng horizontal3
mov cx, black_ballx
inc dx
mov ax, dx
sub ax, black_bally
cmp ax, 04h
jng horizontal3
endm


clear_trail4 macro
mov cx, black_ballx
mov dx, black_bally

horizontal4:
mov ah, 0ch
mov al, 00h
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, black_ballx
cmp ax, 04h
jng horizontal4
mov cx, black_ballx
inc dx
mov ax, dx
sub ax, black_bally
cmp ax, 04h
jng horizontal4
endm


;___________________WHITE BALL_____________________


draw_ball macro
mov cx, ball_posx
mov dx, ball_posy

horizontal5:
mov ah, 0ch
mov al, 0fh
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, ball_posx
cmp ax, 04h
jng horizontal5
mov cx, ball_posx
inc dx
mov ax, dx
sub ax, ball_posy
cmp ax, 04h
jng horizontal5
endm


draw_ball2 macro
mov cx, ball_posx
mov dx, ball_posy

horizontal6:
mov ah, 0ch
mov al, 0fh
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, ball_posx
cmp ax, 04h
jng horizontal6
mov cx, ball_posx
inc dx
mov ax, dx
sub ax, ball_posy
cmp ax, 04h
jng horizontal6
endm



draw_ball3 macro
mov cx, ball_posx
mov dx, ball_posy

horizontal7:
mov ah, 0ch
mov al, 0fh
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, ball_posx
cmp ax, 04h
jng horizontal7
mov cx, ball_posx
inc dx
mov ax, dx
sub ax, ball_posy
cmp ax, 04h
jng horizontal7
endm

draw_ball4 macro
mov cx, ball_posx
mov dx, ball_posy

horizontal8:
mov ah, 0ch
mov al, 0fh
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, ball_posx
cmp ax, 04h
jng horizontal8
mov cx, ball_posx
inc dx
mov ax, dx
sub ax, ball_posy
cmp ax, 04h
jng horizontal8
endm





