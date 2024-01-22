

prog=">++++++++[<+++++++++>-]<.>++++[<+++++++>-]<+.+++++++..+++.>>++++++[<+++++++>-]<++.------------.>++++++[<+++++++++>-]<+.<.+++.------.--------.>>>++++[<++++++++>-]<+.".split("")

//inpt=inp("Input").split("")
//iptr=1

tape=[]
ev rng(0,300) { //add some basing buffering to tape
	tape+=0
}
tp=0
ptr=0
ls=[] //loop stack
>. ptr < (len(prog)-1) {
	prog[ptr]=="]" ? {
		tape[tp]>0 ? {
			ptr=ls[len(ls)-1]
		}
		ls--
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
		$tape[tp]
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
	len(prog)==ptr ? br
}
