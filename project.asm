include printbar.asm
include usman1.asm
include usman2.asm
include cls.asm
include ball1.asm


; Macro to push the ball after flipping so it doesn't get stuck 

addball macro
mov dx, ball_speed

.if (bool_bottom == 1)
add ball_posy, dx
add black_bally, dx
.elseif (bool_top == 1)
sub ball_posy, dx
sub black_bally, dx
.endif
endm

; It updates and prints the updated score on collision with bricks

updateScore macro
add score2, 1d
mov dl, score2
.if (dl > 9)
inc score1
mov score2, 0
.endif
printword score2, score1
endm

; Same as above but adds double score

updateScore2 macro
add score2, 2d
mov dl, score2
.if (dl > 9)
inc score1
mov score2, 0
.endif
printword score2, score1
endm

; Same as above but adds triple score

updateScore3 macro
add score2, 3d
mov dl, score2
.if (dl > 9)
inc score1
mov score2, 0
.endif
printword score2, score1
endm

; Strucutre to contain the properties of brick

brick STRUCT
color db 0
brickx dw 0
bricky dw 0
brickx2 dw 0
bricky2 dw 0
power db 0
exist db 0
brick ENDS

pixel macro pos_x, pos_y, color
mov ah, 0ch
mov al, color
mov bh, 0
mov cx, pos_x
mov dx, pos_y
int 10h
endm

printRight macro x_pos, y_pos, color

pixel tempx, y_pos, 0
pixel x_pos, y_pos, color
dec xpos
dec tempx

endm

printLeft macro x_pos, y_pos, color

pixel x_pos, y_pos, 0
pixel tempx, y_pos, color
inc xpos
inc tempx

endm


; TO PRINT THE A CERTAIN STRUCTURED BRICK

construct macro obj

mov ax, obj.brickx
mov brick_x, ax
mov ax, obj.bricky
mov brick_y, ax
mov ax, obj.brickx2
mov brick_endx, ax
mov ax, obj.bricky2
mov brick_endy, ax
mov al, obj.power
mov health, al
mov al, obj.color
mov colors, al

call makebrick

endm

; ____________________MAIN PROGRAM________________________

.model small
.stack 100h

; _________________________DATA_________________________

.data

second db 0
second1 db 0

score1 db 0
score2 db 0
hearts db 3
named db 8 DUP(48)
value1 dw 0
value2 dw 0
rand dw 0
val1 dw 0
val2 dw 0
bval1 dw 0
bval2 dw 0
ball_posx dw 159d
black_ballx dw 158d
ball_posy dw 99d
black_bally dw 98d
time_aux db 0
xpos dw 159
ypos dw 180
var1 dw 0
var2 dw 0
pixelval dw 25
tempx dw 0
tempy dw 0
temp db 0
ball_speed dw 01h
reg_ah db 0
reg_al db 0
brick_x dw 0
brick_y dw 0
brick_endx dw 0
brick_endy dw 0
health db 0
colors db 0
colour db 0
colour1 db 0
bool_var db 0
bool_top db 0
bool_bottom db 1
bool_right db 0
bool_left db 1
sts db 9 dup(0)
st1 db 9 dup(0)
stinput db 9 dup(0)
Name2 db 9 dup(0)
fout db "Myfile.txt"
buffer db 50 dup(0)
file1 dw 0

fout1 db "Myfile1.txt"
buffer1 db 50 dup(0)
file2 dw 0

levelnum db 1

level db "Level 1"
boolean db 0
boolean1 db 0

score dw 0

; COLORED BRICKS

; B BRICK < color, xpos, ypos, xpos2, ypos2, power >

B1 brick<11,30,50,60,60,  1,1>
B2 brick<12,65,50,95,60,  1,1>
B3 brick<11,100,50,130,60, 1,1>
B4 brick<12,135,50,165,60,1,1>
B5 brick<11,170,50,200,60,1,1>
B6 brick<5,205,50,235,60, 1,1>
B7 brick<11,240,50,270,60, 1,1>
B8 brick<12,275,50,305,60, 1,1>

B9 brick<11,35,70,65,80,   1,1>
B10 brick<12,70,70,100,80,   1,1>
B11 brick<11,105,70,135,80, 1,1>
B12 brick<12,140,70,170,80,1,1>
B13 brick<5,175,70,205,80, 1,1>
B14 brick<11,210,70,240,80,1,1>
B15 brick<5,245,70,275,80,1,1>
B16 brick<12,280,70,310,80,1,1>

B17 brick<12,20,90,55,100,  1,1>
B18 brick<11,63,90,95,100,   1,1>
B19 brick<12,100,90,130,100, 1,1>
B20 brick<5,135,90,165,100,1,1>
B21 brick<12,170,90,200,100, 1,1>
B22 brick<11,205,90,235,100,1,1>
B23 brick<5,240,90,270,100,1,1>
B24 brick<12,275,90,305,100,1,1>

; BLACK BRICKS

D1 brick<0,30,48,60,  62,  0,0>
D2 brick<0,65,48,95,  62,  0,0>
D3 brick<0,100,48,130,62,  0,0>
D4 brick<0,135,48,165,62,  0,0>
D5 brick<0,170,48,200,62,  0,0>
D6 brick<0,205,48,235,62,  0,0>
D7 brick<0,240,48,270,62,  0,0>
D8 brick<0,275,48,305,62,  0,0>

D9 brick<0,35,68,65,82,    0,0>
D10 brick<0,70,68,100,82,   0,0>
D11 brick<0,103,67,137,84, 0,0>
D12 brick<0,140,68,170,82, 0,0>
D13 brick<0,175,68,205,82, 0,0>
D14 brick<0,210,68,240,82, 0,0>
D15 brick<0,245,68,275,82, 0,0>
D16 brick<0,280,68,310,82, 0,0>

D17 brick<0,18, 87,55, 103,0,0>
D18 brick<0,63, 88,95, 103,0,0>
D19 brick<0,100,88,130,103,0,0>
D20 brick<0,135,88,165,103,0,0>
D21 brick<0,170,88,200,103,0,0>
D22 brick<0,205,88,235,103,0,0>
D23 brick<0,240,88,270,103,0,0>
D24 brick<0,275,88,309,106,0,0>

; BRICKS TO COVER HEARTS

H1 brick<5,63,25,78,40,0,0>
H2 brick<5,48,25,78,40,0,0>
H3 brick<5,32,25,78,40,0,0>

; RANDOM BRICKS TO CLEAN UP WINDOW

resetbar brick<0,20,175,310,185,0,0>
ClearBarDots brick<0,20,172,310,180,0,0>
ClearBoundaryDots brick<0,20,45,310,50,0,0>


inputname db 'Input Name : $'

;___________________________CODE______________________________

.code
mov ax, @data
mov ds, ax


mov dx, offset inputname
mov ah, 09h
int 21h


mov dx, offset named
mov ah, 3fh
int 21h

; -------------------File Handling Start-------------------------;
mov ah,3ch
mov cx,0
mov dx,offset fout
int 21h

mov ah,3dh
mov al,2
mov dx,offset fout
int 21h

mov file1,ax
mov cx,0
mov dx,0
mov ah,42h
mov al,2
int 21h

mov ah,40h
mov bx,file1
mov cx,7
mov dx,offset named
int 21h

mov ah,40h
mov bx,file1
mov cx,7
mov dx,offset level
int 21h

mov ah,3eh
mov bx,file1
int 21h

mov ah,3dh
mov al,0
mov dx,offset fout
int 21h

mov file1,ax
mov ah,3fh
mov cx,10
mov dx,offset buffer
mov bx,file1
int 21h

mov dx,offset buffer
mov ah,09h
int 21h

;-------------------File Handling End---------------------;

mov ah, 00
mov al, 13
int 10h

jmp escaped
	
		mov ah, 09h
		mov bh, 00h
		mov al, 20h
		mov cx, 1000h
		mov bl, 00  
		int 10h
		
		mov ah,02h
		mov bx,0
		mov dh,7
		mov dl,28
		mov al,3
		int 10h

		
	mov cx, sizeof sts
	mov si, offset sts
	
	loop11:
	
		mov dl,[si]
		int 21h
		inc si
		
	loop loop11

;=======================================================		

	
	mov ah,02h
	mov bx,0
	mov dh,49
	mov dl,45
	int 10h
	
	
	mov cx, sizeof st1
	mov si, offset st1
	
	loo1:
	
		mov dl,[si]
		int 21h
		inc si
		
	loop loo1
	
;=======================================================		
	
	mov ah,02h
	mov bx,0
	mov dh,10
	mov dl,28
	mov al,3
	int 10h
	
	mov cx, sizeof stinput
	mov si, offset stinput
	
	input1:
	
		mov dl,[si]
		int 21h
		inc si
		
	loop input1
	
	mov si, offset Name2
	
	in1:
	mov cx, 2
	mov ah, 01h 		
	int 21h
	mov [si],al
	inc si
	cmp al,0dh	
	je escaped
	loop in1

jmp escaped ; DIRECT JUMP TO MENU

beep proc
mov al, 182        
out 43h, al        
mov ax, 400        
                            
out 42h, al       
mov al, ah        
out 42h, al 
in  al, 61h      
                           
or al, 00000011b  
out 61h, al      
mov bx, 2       
pause1:
mov cx, 65535
pause2:
dec cx
jne pause2
dec bx
jne pause1
in  al, 61h     
                                
and al, 11111100b   
out 61h, al


ret
beep endp

updateBoundaries PROC
	

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


ret
updateBoundaries ENDP

sound proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 0B6h        
        out     43h, al        
        mov     ax, 400                                      
        out     42h, al        
        mov     al, ah        
        out     42h, al 
        in      al, 61h                                       
        or      al, 00000011b   
        out     61h, al        
        mov     bx, 2          
p1:
        mov     cx, 65535
p2:
        dec     cx
        jne     p2
        dec     bx
        jne     p1
        in      al, 61h                                      
        and     al, 11111100b   
        out     61h, al         
        pop dx
        pop cx
        pop bx
        pop ax

ret
sound endp

makebrick Proc
mov dx, brick_y
L1:
mov cx, brick_x
L2:
mov ah,0CH
mov al, colors
int 10h
inc cx
CMP cx, brick_endx
jne L2
inc dx
cmp dx, brick_endy
jne L1
ret 
makebrick endp

trail PROC
horizontalp:
mov ah, 0ch
mov al, 00h
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, black_ballx
cmp ax, 04h
jng horizontalp
mov cx, black_ballx
inc dx
mov ax, dx
sub ax, black_bally
cmp ax, 04h
jng horizontalp
ret
trail ENDP

drawball PROC
horizontald:
mov ah, 0ch
mov al, 0fh
mov bh, 00h
int 10h
inc cx
mov ax, cx
sub ax, ball_posx
cmp ax, 04h
jng horizontald
mov cx, ball_posx
inc dx
mov ax, dx
sub ax, ball_posy
cmp ax, 04h
jng horizontald
ret
drawball ENDP

; ______________________INSTRUCTIONS________________________

instructions:

; ___________________CLEARING OLD SCREEN____________________


clearscreen

mov al, 5
mov bl, 00001111b
mov cx, msg4 - offset str1
mov dl, 14
mov dh, 4
push cs
pop es
mov bp, offset str1
mov ah, 13h
int 10h
jmp msg4
str1 db "Instructions"
msg4:

mov al, 1
mov bl, 00001111b
mov cx, msg5 - offset str2 
mov dl, 3
mov dh, 7
push cs
pop es
mov bp, offset str2
mov ah, 13h
int 10h
jmp msg5
str2 db "> Use Left-Arrow key to move left"
msg5:

mov al, 1
mov bl, 00001111b
mov cx, msg6 - offset str3 
mov dl, 3
mov dh, 9
push cs
pop es
mov bp, offset str3
mov ah, 13h
int 10h
jmp msg6
str3 db "> Use Right-Arrow key to move right"
msg6:

mov al, 1
mov bl, 00001111b
mov cx, msg8 - offset str5
mov dl, 3
mov dh, 11
push cs
pop es
mov bp, offset str5
mov ah, 13h
int 10h
jmp msg8
str5 db "> Game objective is to remove all         bricks by hitting with the ball."
msg8:

mov al, 1
mov bl, 00001111b
mov cx, msg9 - offset str6
mov dl, 3
mov dh, 14
push cs
pop es
mov bp, offset str6
mov ah, 13h
int 10h
jmp msg9
str6 db "> The game ends if ball hits the          enclosure."
msg9:

mov al, 1
mov bl, 00001111b
mov cx, msg10 - offset str7
mov dl, 3
mov dh, 17
push cs
pop es
mov bp, offset str7
mov ah, 13h
int 10h
jmp msg10
str7 db "> If all bricks are eliminated            player wins the game."
msg10:


mov value1,10
mov value2,16

mov cx,307
ins1:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,value1
mov dx,value2
int 10h
inc value1
pop cx

loop ins1
mov value1,10
mov cx,173

ins2:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,value1
mov dx,value2
int 10h
inc value2
pop cx

loop ins2

mov value1,10
mov value2,189
mov cx,307
ins3:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,value1
mov dx,value2
int 10h
inc value1
pop cx

loop ins3


mov value1,316
mov value2,188
mov cx,172
ins4:
push cx
mov ah,0ch
mov al,7
mov bh,0
mov cx,value1
mov dx,value2
int 10h
dec value2
pop cx

loop ins4

mov ah, 00h
int 16h

; MENU

escaped:

; CLEARING SCREEN

clearscreen


mov al, 1
mov bl, 00001111b
mov cx, msg1end4 - offset string4; calculate message size. 
mov dl, 12
mov dh, 1
push cs
pop es
mov bp, offset string4
mov ah, 13h
int 10h
jmp msg1end4
string4 db "Brick Breaker Game"
msg1end4:




mov al, 1
mov bl, 00001111b
mov cx, msg1end5 - offset string5; calculate message size. 
mov dl, 16
mov dh, 4
push cs
pop es
mov bp, offset string5
mov ah, 13h
int 10h
jmp msg1end5
string5 db "New Game"
msg1end5:


mov var1,105
mov var2,26
mov cx,108
q1:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q1

mov bp,0
mov sp,0
mov var1,105
mov cx,19
mov dx,0
t1:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t1


mov bp,0
mov sp,0
mov dx,26
mov var2,dx
mov var1,0
mov var1,212
mov cx,19
mov dx,0
t3:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t3

mov var1,105
mov var2,44
mov cx,108
q2:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q2



mov al, 1
mov bl, 00001111b
mov cx, msg1end6 - offset string6; calculate message size. 
mov dl, 16
mov dh, 8
push cs
pop es
mov bp, offset string6
mov ah, 13h
int 10h
jmp msg1end6
string6 db " Resume "
msg1end6:

mov var1,0
mov var2,0
mov var1,105
mov var2,57
mov cx,108
q5:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q5


mov bp,0
mov sp,0
mov dx,57
mov var2,dx
mov var1,105
mov cx,18
mov dx,0
t5:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t5



mov bp,0
mov sp,0
mov dx,57
mov var2,dx
mov var1,212
mov cx,18
mov dx,0
t7:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t7


mov var1,0
mov var2,0
mov var1,105
mov var2,74
mov cx,108
q7:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q7

mov al, 1
mov bl, 00001111b
mov cx, msg1end7 - offset string7; calculate message size. 
mov dl, 14
mov dh, 11
push cs
pop es
mov bp, offset string7
mov ah, 13h
int 10h
jmp msg1end7
string7 db "Instructions"
msg1end7:

mov var1,0
mov var2,0
mov var1,105
mov var2,81
mov cx,108
q9:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q9

mov bp,0
mov sp,0
mov dx,81
mov var2,dx
mov var1,105
mov cx,18
mov dx,0
t9:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t9

mov bp,0
mov sp,0
mov dx,81
mov var2,dx
mov var1,212
mov cx,18
mov dx,0
t10:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t10

mov var1,0
mov var2,0
mov var1,105
mov var2,98
mov cx,108
q11:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q11

mov al, 1
mov bl, 00001111b
mov cx, msg1end8 - offset string8; calculate message size. 
mov dl, 14
mov dh, 14
push cs
pop es
mov bp, offset string8
mov ah, 13h
int 10h
jmp msg1end8
string8 db " High Score "
msg1end8:

mov var1,0
mov var2,0
mov var1,105
mov var2,108
mov cx,108
q14:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q14


mov bp,0
mov sp,0
mov dx,108
mov var2,dx
mov var1,105
mov cx,18
mov dx,0
t11:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t11


mov bp,0
mov sp,0
mov dx,108
mov var2,dx
mov var1,212
mov cx,18
mov dx,0
t12:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t12



mov var1,0
mov var2,0
mov var1,105
mov var2,125
mov cx,108
q16:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q16

mov al, 1
mov bl, 00001111b
mov cx, msg1end9 - offset string9; calculate message size. 
mov dl, 17
mov dh, 18
push cs
pop es
mov bp, offset string9
mov ah, 13h
int 10h
jmp msg1end9
string9 db " Exit "
msg1end9:



mov bp,0
mov sp,0
mov dx,137
mov var2,dx
mov var1,105
mov cx,18
mov dx,0
t13:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t13

mov bp,0
mov sp,0
mov dx,137
mov var2,dx
mov var1,212
mov cx,18
mov dx,0
t14:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var2
pop cx

loop t14

mov var1,0
mov var2,0
mov var1,105
mov var2,137
mov cx,108
q18:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q18





mov var1,0
mov var2,0
mov var1,105
mov var2,155
mov cx,108

q20:
push cx
mov ah,0ch
mov al,14
mov bh,0
mov cx,var1
mov dx,var2
int 10h
inc var1
pop cx

loop q20

menuloop:

mov ah, 00
int 16h

cmp al, 49d
jne down

mov ball_posx, 159
mov ball_posy, 99
mov black_ballx, 159
mov black_bally, 99

jmp resumed

down:

cmp al, 50d 
je resumed

cmp al, 51d
je instructions

cmp al, 52d
je endMenu

jmp menuloop


; NEW GAME

resumed:


clearscreen
printMenu

construct B1
construct B2
construct B3
construct B4
construct B5
construct B6
construct B7
construct B8

construct B9
construct B10
construct B11
construct B12
construct B13
construct B14 
construct B15
construct B16  

construct B17
construct B18
construct B19
construct B20
construct B21
construct B22
construct B23
construct B24 



;jmp temporary

temporary:

; _______________PRINT BAR + MAIN GAME________________

printBar
mov ax, xpos
mov tempx, ax

mov byte ptr[xpos], 159

Loop2:

call updateBoundaries

mov ax, 0
mov bool_var, 0



mov ah, 01
int 16h
jz nokey

mov ah, 00
int 16h

mov reg_ah, ah
mov reg_al, al

mov bool_var, 1

; ___________CALLING MACRO TO PRINT BALL____________

nokey:

mov ax, ball_posx
mov black_ballx, ax
mov ax, ball_posy
mov black_bally, ax


; .if (ball_posy == 198d)
; 	sub ball_posy, 1
; 	flipY
; .endif

mov dx, ball_speed

mov ax, ypos
sub ax, 6

.if (ball_posy >= ax)
mov ax, tempx
mov bx, xpos
add ax, 2
sub bx, 2
	.if (ball_posx <= ax) && (ball_posx >= bx)
	flipY
	sub ball_posy, dx
	Construct ClearBarDots
	.endif 
	
.endif

; BRICK COLLISIONS 


;brick1

.if (B1.power >= 1)
mov ax, B1.bricky2
.if (ball_posy <= 60)
mov ax, B1.brickx
mov bx, B1.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B1.power == 1)
construct D1
;call beep
.endif
dec B1.power
flipY
addball
.endif
.endif
.endif

;brick2

.if (B2.power >= 1)
mov ax, B2.bricky2
.if (ball_posy <= 60)
mov ax, B2.brickx
mov bx, B2.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx)
updateScore2
.if (B2.power == 1)
construct D2
;call beep
.endif
dec B2.power
flipY
addball
.endif
.endif
.endif

;brick3

.if (B3.power >= 1)
mov ax, B3.bricky2
.if (ball_posy <= 60)
mov ax, B3.brickx
mov bx, B3.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B3.power == 1)
construct D3
;call beep
.endif
dec B3.power
flipY
addball
.endif
.endif
.endif


;brick4

.if (B4.power >= 1)
mov ax, B4.bricky2
.if (ball_posy <= 60)
mov bx, B4.brickx2
mov ax, B4.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B4.power == 1)
construct D4
;call beep
.endif
dec B4.power
flipY
addball
.endif
.endif
.endif


;brick5

.if (B5.power >= 1)
mov ax, B5.bricky2
.if (ball_posy <= 60)
mov bx, B5.brickx2
mov ax, B5.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B5.power == 1)
construct D5
;call beep
.endif
dec B5.power
flipY
addball
.endif
.endif
.endif

;brick6

.if (B6.power >= 1)
mov ax, B6.bricky2
.if (ball_posy <= 60)
mov bx, B6.brickx2
mov ax, B6.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore3
.if (B6.power == 1)
construct D6
;call beep
.endif
dec B6.power
flipY
addball
.endif
.endif
.endif

;brick7

.if (B7.power >= 1)
mov ax, B7.bricky2
.if (ball_posy <= 60)
mov ax, B7.brickx
mov bx, B7.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B7.power == 1)
construct D7
;call beep
.endif
dec B7.power
flipY
addball
.endif
.endif
.endif

;brick8

.if (B8.power >= 1)
mov ax, B8.bricky2
.if (ball_posy <= 60)
mov bx, B8.brickx2
mov ax, B8.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B8.power == 1)
construct D8
;call beep
.endif
dec B8.power
flipY
addball
.endif
.endif
.endif

;brick9

.if (B9.power >= 1)
mov ax, B9.bricky2
.if (ball_posy <= 80)
mov ax, B9.brickx
mov bx, B9.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B9.power == 1)
construct D9
;call beep
.endif
dec B9.power
flipY
addball
.endif
.endif
.endif

;brick10

.if (B10.power >= 1)
mov ax, B10.bricky2
.if (ball_posy <= 80)
mov ax, B10.brickx
mov bx, B10.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B10.power == 1)
construct D10
;call beep
.endif
dec B10.power
flipY
addball
.endif
.endif
.endif

;brick11

.if (B11.power >= 1)
mov ax, B11.bricky2
.if (ball_posy <= 80)
mov ax, B11.brickx
mov bx, B11.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B11.power == 1)
construct D11
;call beep
.endif
dec B11.power
flipY
addball
.endif
.endif
.endif

;brick12

.if (B12.power >= 1)
mov ax, B12.bricky2
.if (ball_posy <= 80)
mov ax, B12.brickx
mov bx, B12.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B12.power == 1)
construct D12
;call beep
.endif
dec B12.power
flipY
addball
.endif
.endif
.endif

;brick13

.if (B13.power >= 1)
mov ax, B13.bricky2
.if (ball_posy <= 80)
mov ax, B13.brickx
mov bx, B13.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore3
.if (B13.power == 1)
construct D13
;call beep
.endif
dec B13.power

flipY
addball

.endif
.endif
.endif

;brick14

.if (B14.power >= 1)
mov ax, B14.bricky2
.if (ball_posy <= 80)
mov ax, B14.brickx
mov bx, B14.brickx2
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B14.power == 1)
construct D14
;call beep
.endif
dec B14.power
flipY
addball
.endif
.endif
.endif

;brick15

.if (B15.power >= 1)
mov ax, B15.bricky2
.if (ball_posy <= 80)
mov ax, B15.brickx
mov bx, B15.brickx2
sub ax, 2
add bx, 2 
.if (ball_posx > ax) && (ball_posx < bx) 
updateScore3
.if (B15.power == 1)
construct D15
;call beep
.endif
dec B15.power
flipY
addball
.endif
.endif
.endif

;brick16

.if (B16.power >= 1)
mov ax, B16.bricky2
.if (ball_posy <= 80)
mov ax, B16.brickx
mov bx, B16.brickx2
sub ax, 2
add bx, 2 
.if (ball_posx > ax) && (ball_posx < bx) 
updateScore2
.if (B16.power == 1)
construct D16
;call beep
.endif
dec B16.power
flipY
addball
.endif
.endif
.endif

;brick17

.if (B17.power >= 1)
mov ax, B17.bricky2
.if (ball_posy <= 100)
mov ax, B17.brickx
mov bx, B17.brickx2
sub ax, 2
add bx, 2 
.if (ball_posx > ax) && (ball_posx < bx) 
updateScore2
flipY
addball
.if (B17.power == 1)
construct D17
;call beep
.endif
dec B17.power

.endif
.endif
.endif

;brick18

.if (B18.power >= 1)
mov ax, B18.bricky2
.if (ball_posy <= 100)
mov bx, B18.brickx2
mov ax, B18.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B18.power == 1)
construct D18
;call beep
.endif
dec B18.power
flipY
addball
.endif
.endif
.endif

;brick19

.if (B19.power >= 1)
mov ax, B19.bricky2
.if (ball_posy <= 100)
mov bx, B19.brickx2
mov ax, B19.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B19.power == 1)
construct D19
;call beep
.endif
dec B19.power
flipY
addball
.endif
.endif
.endif

;brick20

.if (B20.power >= 1)
mov ax, B20.bricky2
.if (ball_posy <= 100)
mov bx, B20.brickx2
mov ax, B20.brickx
.if (ball_posx >= ax) && (ball_posx <= bx)
updateScore3
.if (B20.power == 1)
construct D20
;call beep
.endif
dec B20.power
flipY
addball
.endif
.endif
.endif


;brick21

.if (B21.power >= 1)
mov ax, B21.bricky2
.if (ball_posy <= 100)
mov bx, B21.brickx2
mov ax, B21.brickx
.if (ball_posx >= ax) && (ball_posx <= bx)
updateScore2
.if (B21.power == 1)
construct D21
;call beep
.endif
dec B21.power
flipY
addball
.endif
.endif
.endif


;brick22

.if (B22.power >= 1)
mov ax, B22.bricky2
.if (ball_posy <= 100)
mov bx, B22.brickx2
mov ax, B22.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore
.if (B22.power == 1)
construct D22
;call beep
.endif
dec B22.power
flipY
addball
.endif
.endif
.endif

;brick23

.if (B23.power >= 1)
mov ax, B23.bricky2
.if (ball_posy <= 100)
mov bx, B23.brickx2
mov ax, B23.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore3
.if (B23.power == 1)
construct D23
;call beep
.endif
dec B23.power
flipY
addball
.endif
.endif
.endif

;brick24

.if (B24.power >= 1)
mov ax, B24.bricky2
.if (ball_posy <= 100)
mov bx, B24.brickx2
mov ax, B24.brickx
.if (ball_posx >= ax) && (ball_posx <= bx) 
updateScore2
.if (B24.power == 1)
construct D24
;call beep
.endif
dec B24.power
flipY
addball
.endif
.endif
.endif

.if (B1.power == 0) && (B3.power == 0) && (B4.power == 0) && (B7.power == 0) && (B8.power == 0) && (B2.power == 0) && (B5.power == 0)
mov ah, 2ch
int 21h

mov second, dh
mov second1, dh
add second1, 3
clearscreen


.while (dh != second1)

	mov al, 1
	mov bh, 0
	mov bl, 00111011b
	mov cx, msg1end20 - offset msg20 ; calculate message size. 
	mov dl, 16
	mov dh, 11
	push cs
	pop es
	mov bp, offset msg20
	mov ah, 13h
	int 10h
	jmp msg1end20
	msg20 db "LEVEL 2"
	msg1end20:

mov ah, 2ch
int 21h

.endw


mov B1.power,  2
mov B2.power,  2
mov B3.power,  2
mov B4.power,  2
mov B5.power,  2
mov B6.power,  2
mov B7.power,  2
mov B8.power,  2
mov B9.power,  2
mov B10.power, 2
mov B11.power, 2
mov B12.power, 2
mov B13.power, 2
mov B14.power, 2
mov B15.power, 2
mov B16.power, 2
mov B17.power, 2
mov B18.power, 2
mov B19.power, 2
mov B20.power, 2
mov B21.power, 2
mov B22.power, 2
mov B23.power, 2
mov B24.power, 2

clearscreen

mov ball_speed, 02h

; LEVEL 2 

inc levelnum

	construct resetbar
	mov xpos, 160
	mov tempx, 250
	call updateBoundaries
	construct ClearBoundaryDots
	jmp resumed

.endif


collided:

; WALL COLLISIONS

.if (ball_posy <= 46d)
	mov ax, ball_speed
	add ball_posy, ax
	flipY
	construct ClearBoundaryDots
.endif	

.if (ball_posx >= 312d)	
	mov ax, ball_speed
	sub ball_posx, ax
	flipX
.endif

.if (ball_posx <= 10d)
	mov ax, ball_speed
	add ball_posx, ax
	flipX
.endif

.if (ball_posy >= 200d)
    dec hearts
	updateHearts
	mov ball_posx, 159
	mov ball_posy, 99
	construct resetbar
	mov xpos, 159
	mov tempx, 250
	call updateBoundaries
	construct ClearBoundaryDots
	jmp temporary
.endif


.if (bool_top==1)
setspeed
.if (bool_right==1)
sub ball_posy, ax
add ball_posx, ax
.elseif (bool_left==1)
sub ball_posy, ax
sub ball_posx, ax
.endif
printball
.endif

.if (bool_right==1)
setspeed
.if (bool_top==1)
add ball_posx, ax
sub ball_posy, ax
.elseif (bool_bottom==1)
add ball_posx, ax
add ball_posy, ax
.endif
printball
.endif

.if (bool_bottom==1)
setspeed
.if (bool_right==1)
add ball_posy, ax
add ball_posx, ax
.elseif (bool_left==1)
add ball_posy, ax
sub ball_posx, ax
.endif
printball
.endif

.if (bool_left==1)
setspeed
.if (bool_top==1)
sub ball_posx, ax
sub ball_posy, ax
.elseif (bool_bottom==1)
sub ball_posx, ax
add ball_posy, ax
.endif
printball
.endif




; -------------------File Handling Start-------------------------;
mov ah,3ch
mov cx,0
mov dx,offset fout1
int 21h

mov ah,3dh
mov al,2
mov dx,offset fout1
int 21h

mov file2,ax
mov cx,0
mov dx,0
mov ah,42h
mov al,2
int 21h

mov ah,40h
mov bx,file1
mov cx,7
mov dl,score1
mov dh,score2
int 21h

mov ah,3eh
mov bx,file1
int 21h

mov ah,3dh
mov al,0
mov dx,offset fout1
int 21h

mov file2,ax
mov ah,3fh
mov cx,10
mov dx,offset buffer1
mov bx,file2
int 21h

mov dx,offset buffer1
mov ah,09h
int 21h

;-------------------File Handling End---------------------;

nojump:
mov ax, 0

cmp bool_var, 0
je nomove

mov ah, reg_ah
mov al, reg_al

nomove:

cmp al, 01bh
je escaped

cmp ah, 4dh
jne left

.if (xpos <= 250d) && (levelnum == 1)
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
.elseif (xpos <= 280d) && (levelnum == 2)
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
printLeft xpos, ypos, 14
.endif

left:
cmp ah, 4bh
jne Loop2

.if (tempx >= 77d) && (levelnum == 1)
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
.elseif (tempx >= 49d) && (levelnum == 2)
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
printRight xpos, ypos, 14
.endif

jmp Loop2


; ENDING OF PROGRAM


endMenu:




clearscreen



	mov al, 1
	mov bh, 0
	mov bl, 00111011b
	mov cx, msg1end10 - offset msg1 ; calculate message size. 
	mov dl, 16
	mov dh, 12
	push cs
	pop es
	mov bp, offset msg1
	mov ah, 13h
	int 10h
	jmp msg1end10
	msg1 db "THE END"
	msg1end10:

	mov al, 1
	mov bh, 0
	mov bl, 00111011b
	mov cx, msg1end11 - offset msg11 ; calculate message size. 
	mov dl, 16
	mov dh, 23
	push cs
	pop es
	mov bp, offset msg11
	mov ah, 13h
	int 10h
	jmp msg1end11
	msg11 db "_______"
	msg1end11:





mov ah, 4ch
int 21h

end