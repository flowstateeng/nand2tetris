// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

@SCREEN
D=A
@8191
D=D+A
@last
M=D


(SCREENCHECK)
@painted
M=0
@SCREEN
D=M
@SCREENUPDATE
D;JNE
@KBDCHECK
0;JMP
(SCREENUPDATE)
@painted
M=1
(KBDCHECK)
@pressed
M=0
@KBD
D=M
@KBDUPDATE
D;JNE
@DECIDE
D;JEQ
(KBDUPDATE)
@pressed
M=1


(DECIDE)
@SCREEN
D=A
@current
M=D
@pressed
D=M
@painted
D=D-M
@SCREENCHECK
D;JEQ
@PAINT
D;JGT
@CLEAR
D;JLT


(PAINT)
@current
D=M
A=D
M=-1
@last
D=M
@current
D=D-M
M=M+1
@SCREENCHECK
D;JEQ
@PAINT
0;JMP


(CLEAR)
@current
D=M
A=D
M=0
@last
D=M
@current
D=D-M
M=M+1
@SCREENCHECK
D;JEQ
@CLEAR
0;JMP


(END)
@END
0;JMP
