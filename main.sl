//brainfuck interpreter in shortlang
//(c) lasermtv07, 2024
//this program is free software, released under the terms of WTFPL

prog=inp("Program: ").split("")
ib=inp("Input: ").split("")
ib+=0
ii=0
tape=[]
ev rng(0,300) { //add some basing buffering to tape
        tape+=0
}
tp=0
ptr=0
ls=[] //loop stack
>. ptr < (len(prog)) {
        prog[ptr]=="]" ? {
                tape[tp]>0 ? {
                        ptr=ls[len(ls)-1]
                }
                ls--
        }

        prog[ptr]=="," ? {
                        ib[ii]!=0 ? {
                                tape[tp]=ord(ib[ii])
                }
                ib[ii]==0 ? {
                        tape[tp]=0
                }
                ii++
        }

        prog[ptr] == ">" ? {
                tp++
        }
        prog[ptr]=="<" ? {
                tape[tp]>=0 ? tp--
        }
        prog[ptr]=="+" ? {
                tape[tp]=tape[tp]+1
        }
        prog[ptr]=="-" ? {
                tape[tp]=tape[tp]-1
        }
        prog[ptr]=="." ? {
                $$chr(tape[tp])
        }
        prog[ptr]=="[" ? {
                ls+=ptr
        }


        tape[tp]>255 ? { //wrapping cells
                tape[tp]=0
        }
        tape[tp]<0 ? {
                tape[tp]=255
        }
        tp==len(tape) ? {
                tape+=0
        }
        ptr++
}
