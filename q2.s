.data

	q: .word 32  
	a: .word 0
	m: .word 5
	n: .word 32
.text

main:
	lw $t0,q	#divident =q / quotient
	lw $t1,m        #divisor =m
	lw $t2,a	#a /reminder
	lw $t3,n	#number of bits
	addi $s0,$s0,0   #s0=0
	addi $s1,$s1,1   #s1=1
	sll $t5,$s1,31
loop1:
	slt $s2,$0,$t3
	beq $s2,$0,Exit
        and $s3,$t5,$t0
	srl $s3,$s3,31
	sll $t2,$t2,1
	add $t2,$t2,$s3
	sll $t0,$t0,1
	sub $t2,$t2,$t1
	and $s4,$t2,$t5
	srl $s4,$s4,31
	beq $s4,$s0,loop2
	beq $s4,$s1,loop3

loop2:
	add $t0,$t0,$s1
	sub $t3,$t3,$s1
	j loop4
loop3:
	add $t2,$t2,$t1
	sub $t3,$t3,$s1
	j loop4
loop4:
	beq $t3,$s0,Exit
	j loop1
Exit:
	sw $t0,q
	sw $t2,a
	j $ra
