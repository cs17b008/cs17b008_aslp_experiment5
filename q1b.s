.data
a1: .word 1143330295
a2: .word 999999223
a3: .word 0
a4: .word 0

.text
 main:
	 lw $s1,a1
	 lw $s2,a2
	 mult $s1,$s2
	 mfhi $t0
	 mflo $t1
	 sw $t0,a3
	 sw $t1,a4
	 jr $ra
