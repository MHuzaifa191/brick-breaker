;1
mymacro macro 

mov ah, 0
mov al, 13h  
int 10h


mov dx,17

c1:

mov cx, 10

c2:

mov al, 5
mov ah, 0CH 
INT 10H

inc cx
cmp cx,316
jne c2

inc dx

cmp dx,45
jne c1


mov dx,55

L1:

mov cx, 35

L2:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,50
jne L2

 

inc dx

cmp dx,70
jne L1

mov cx,0
mov dx,0
mov dx,55

L3:

mov cx, 51

L4:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,75
jne L4

 

inc dx

cmp dx,70
jne L3



;3
mov cx,0
mov dx,0
mov dx,55

L5:

mov cx, 76

L6:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,100
jne L6

 

inc dx

cmp dx,70
jne L5

;4

mov cx,0
mov dx,0
mov dx,55

L7:

mov cx, 101

L8:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,125
jne L8

 

inc dx

cmp dx,70
jne L7


;5


mov cx,0
mov dx,0
mov dx,55

L9:

mov cx, 126

L10:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,150
jne L10

 

inc dx

cmp dx,70
jne L9

;6
mov cx,0
mov dx,0
mov dx,55

L11:

mov cx, 151

L12:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,170
jne L12

 

inc dx

cmp dx,70
jne L11


;7
mov cx,0
mov dx,0
mov dx,55

L13:

mov cx, 171

L14:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,205
jne L14

 

inc dx

cmp dx,70
jne L13

;8
mov cx,0
mov dx,0
mov dx,55

L15:

mov cx, 206

L16:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,230
jne L16

 

inc dx

cmp dx,70
jne L15

;9
mov cx,0
mov dx,0
mov dx,55

L17:

mov cx, 231

L18:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,250
jne L18

 

inc dx

cmp dx,70
jne L17

;10
mov cx,0
mov dx,0
mov dx,55

L19:

mov cx, 251

L20:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,275
jne L20

 

inc dx

cmp dx,70
jne L19

;11
mov cx,0
mov dx,0
mov dx,55

L21:

mov cx, 276

L22:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,295
jne L22

 

inc dx

cmp dx,70
jne L21

mov cx,0
mov dx,0
mov dx,72

W1:

mov cx, 38

W2:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,63
jne W2

 

inc dx

cmp dx,87
jne W1

mov cx,0
mov dx,0
mov dx,72

W3:

mov cx, 64

W4:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,88
jne W4

 
inc dx

cmp dx,87
jne W3

mov dx,72
W5:

mov cx, 89

W6:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,113
jne W6

inc dx

cmp dx,87
jne W5

mov dx,72
W7:

mov cx, 114

W8:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,139
jne W8

inc dx

cmp dx,87
jne W7

mov dx,72
W9:

mov cx, 140

W10:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,165
jne W10

inc dx

cmp dx,87
jne W9

mov dx,72
W11:

mov cx, 166

W12:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,190
jne W12

inc dx

cmp dx,87
jne W11


mov dx,72
W13:

mov cx, 191

W14:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,215
jne W14

inc dx

cmp dx,87
jne W13

mov dx,72
W15:

mov cx, 216

W16:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,240
jne W16

inc dx

cmp dx,87
jne W15

mov dx,72
W17:

mov cx, 241

W18:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,265
jne W18

inc dx

cmp dx,87
jne W17

mov dx,72
W19:

mov cx, 266

W20:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,290
jne W20

inc dx

cmp dx,87
jne W19

mov dx,89

v1:

mov cx, 35

v2:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,50
jne v2

 

inc dx

cmp dx,104
jne v1


mov dx,89

v3:

mov cx, 51

v4:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,75
jne v4 

inc dx

cmp dx,104
jne v3


mov cx,0
mov dx,0
mov dx,89

v5:

mov cx, 76

v6:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,100
jne v6

 

inc dx

cmp dx,104
jne v5

;4

mov cx,0
mov dx,0
mov dx,89

v7:

mov cx, 101

v8:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,125
jne v8

 

inc dx

cmp dx,104
jne v7


;5


mov cx,0
mov dx,0
mov dx,89

v9:

mov cx, 126

v10:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,150
jne v10

 

inc dx

cmp dx,104
jne v9

;6
mov cx,0
mov dx,0
mov dx,89

v11:

mov cx, 151

v12:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,170
jne v12

 

inc dx

cmp dx,104
jne v11


;7
mov cx,0
mov dx,0
mov dx,89

v13:

mov cx, 171

v14:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,205
jne v14

 

inc dx

cmp dx,104
jne v13

;8
mov cx,0
mov dx,0
mov dx,89

v15:

mov cx, 206

v16:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,230
jne v16

 

inc dx

cmp dx,104
jne v15

;9
mov cx,0
mov dx,0
mov dx,89

v17:

mov cx, 231

v18:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,250
jne v18

 

inc dx

cmp dx,104
jne v17

;10
mov cx,0
mov dx,0
mov dx,89

v19:

mov cx, 251

v20:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,275
jne v20

 

inc dx

cmp dx,104
jne v19

;11
mov cx,0
mov dx,0
mov dx,89

v21:

mov cx, 276

v22:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,295
jne v22

 

inc dx

cmp dx,104
jne v21

mov dx,106
o1:

mov cx, 38

o2:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,63
jne o2

 

inc dx

cmp dx,121
jne o1

mov cx,0
mov dx,0
mov dx,106

o3:

mov cx, 64

o4:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,88
jne o4

 
inc dx

cmp dx,121
jne o3

mov dx,106
o5:

mov cx, 89

o6:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,113
jne o6

inc dx

cmp dx,121
jne o5

mov dx,106
o7:

mov cx, 114

o8:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,139
jne o8

inc dx

cmp dx,121
jne o7

mov dx,106
o9:

mov cx, 140

o10:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,165
jne o10

inc dx

cmp dx,121
jne o9

mov dx,106
o11:

mov cx, 166

o12:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,190
jne o12

inc dx

cmp dx,121
jne o11


mov dx,106
o13:

mov cx, 191

o14:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,215
jne o14

inc dx

cmp dx,121
jne o13

mov dx,106
o15:

mov cx, 216

o16:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,240
jne o16

inc dx

cmp dx,121
jne o15

mov dx,106
o17:

mov cx, 241

o18:

mov al, 4
mov ah, 0CH 
INT 10H

inc cx
cmp cx,265
jne o18

inc dx

cmp dx,121
jne o17

mov dx,106
o19:

mov cx, 266

o20:

mov al, 14
mov ah, 0CH 
INT 10H

inc cx
cmp cx,290
jne o20

inc dx

cmp dx,121
jne o19


mov dx,123

g1:

mov cx, 35

g2:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,50
jne g2

 

inc dx

cmp dx,138
jne g1


mov dx,123

g3:

mov cx, 51

g4:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,75
jne g4 

inc dx

cmp dx,138
jne g3


mov cx,0
mov dx,0
mov dx,123

g5:

mov cx, 76

g6:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,100
jne g6

 

inc dx

cmp dx,138
jne g5

;4

mov cx,0
mov dx,0
mov dx,123

g7:

mov cx, 101

g8:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,125
jne g8

 

inc dx

cmp dx,138
jne g7


;5


mov cx,0
mov dx,0
mov dx,123

g9:

mov cx, 126

g10:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,150
jne g10

 

inc dx

cmp dx,138
jne g9

;6
mov cx,0
mov dx,0
mov dx,123

g11:

mov cx, 151

g12:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,170
jne g12

 

inc dx

cmp dx,138
jne g11


;7
mov cx,0
mov dx,0
mov dx,123

g13:

mov cx, 171

g14:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,205
jne g14

 

inc dx

cmp dx,138
jne g13

;8
mov cx,0
mov dx,0
mov dx,123
g15:

mov cx, 206

g16:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,230
jne g16

 

inc dx

cmp dx,138
jne g15

;9
mov cx,0
mov dx,0
mov dx,123

g17:

mov cx, 231

g18:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,250
jne g18

 

inc dx

cmp dx,138
jne g17

;10
mov cx,0
mov dx,0
mov dx,123

g19:

mov cx, 251

g20:

mov al, 1
mov ah, 0CH 
INT 10H

inc cx
cmp cx,275
jne g20

 

inc dx

cmp dx,138
jne g19

;11
mov cx,0
mov dx,0
mov dx,123

g21:

mov cx, 276

g22:

mov al, 11
mov ah, 0CH 
INT 10H

inc cx
cmp cx,295
jne g22

 

inc dx

cmp dx,138
jne g21


endm
