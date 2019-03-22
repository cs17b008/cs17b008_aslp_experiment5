.data
	q: .word 8
	m: .word 4
	a: .word 0
	
.text
main:
	lw $s1,m
	lw $s2,q
	lw $s3,a
	addi $t1,$t1,32
	addi $s6,$s6,1
	sll $s7,$s6,31
	j loop1
	
loop1:
     slt $t2,$0,$t1
     beq $t2,$0,Exit
     and $s4,$s3,$s7
     srl $s4,$s4,31
     beq $s4,$0,loop3
     beq $s4,$s6,loop2  
loop2:
	and $t4,$s7,$s2
	srl $t4,$t4,31
	addu $s3,$s3,$t4
	sll $s2,$s2,1
	sll $s3,$s3,1
	addu $s3,$s3,$s1
	j loop4
	
loop3:
	and $t4,$s7,$s2
	srl $t4,$t4,31
	add $s3,$s3,$t4
	sll $s2,$s2,1
	sll $s3,$s3,1
	subu $s3,$s3,$s1
 	j loop4
	
loop4:
	and $t5,$s7,$s3
	srl $t5,$t5,31
	beq $t5,$s6,loop5
	beq $t5,$0,loop6

loop5:
	subu $t1,$t1,$s6
	beq $t1,$0,loop7
	j loop1
	
loop6:
	addiu $s2,$s2,1
	subu $t1,$t1,$s6
	beq $t1,$0,loop7
	j loop1
	
loop7:
	and $t5,$s7,$s3
	srl $t5,$t5,31	
	beq $t5,$s6,loop8
	beq $t5,$s8,Exit
	
loop8:
       add $s3,$s3,$s1
       j Exit
       
       
       
       
 Exit:
 
 	sw $s2,q
 	sw $s3,a
 	jr $ra
