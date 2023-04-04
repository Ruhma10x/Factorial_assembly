 .globl _start            
.text              




_start:
li a0, 6
li t2, 1
jal factorial
la t3,result
sw a0,0(t3)
addi a1, a0, 0          
addi a0, x0, 1
j write_tohost # Print Result





factorial:


bgt a0, t2, elsefact
#addi t0,x0,1
j exit

elsefact:
addi sp,sp,-8
sw ra,0(sp)
addi t1,a0,0
sw t1,4(sp)
addi a0,a0,-1
jal factorial

lw ra,0(sp)
lw t1,4(sp)
addi sp,sp,8
#addi t1,a0,0

mul a0,t1,a0



exit:
ret
endcode:




write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 


.align 2
num:
.word 6
result:
.word 0



.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 
