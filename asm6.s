.data
height1:	.word 10# assumes a 64x64 display.  To set this up, do the following steps:    - Tools->Bitmap Display    - Set "Unit width/height in pixels" to 8    - Set "Display width/height in pixels" to 512    - Set "Base Address for display" to static data    - Click "Connect to MIPS" *after* the rest are set
width1:		.word 4
width2:		.word 6
offset:		.word 8
frames: 	.word 10
DISPLAY:
	.space  16384
END_OF_DISPLAY:
.text
main:
	la      $t0, DISPLAY
	addi    $t1, $zero,-1
	la      $t2, END_OF_DISPLAY
	lui     $t3, 0x0
	lw $t7, height1
	lw $t2, width1
	addi $t6, $t0, 6408#starting line for line 1
	addi $t5, $t0, 6584#starting line for line 1
	addi $t4, $t0, 5904#starting line for Horizontal line 1
	addi $t3, $t0, 6052#starting line for Horizontal line 2
LOOP: 			#Vertical parts of brackets
	sw $t1, 0($t6)  # first long length of the lenny face
	sw $t1, 0($t5)  # first long length of the lenny face
	sw $t1, 6156($t0)
	sw $t1, 8972($t0)
	sw $t1, 6324($t0)
	sw $t1, 9140($t0)
	addi $t6, $t6, 256 # go down one pixel
	addi $t5, $t5, 256
	addi $t7, $t7, -1
	bnez $t7, LOOP
LOOP2:
	sw $t1, 0($t4)
	sw $t1, 0($t3)
	addi $t4, $t4, 4 # go down one pixel
	addi $t3, $t3, 4
	sw $t1, 3324($t4)
	sw $t1, 3324($t3)
	addi $t2, $t2, -1
	bnez $t2, LOOP2
LOOP4:			   #nose and eyes
	sw $t1, 6488($t0) #nose
	sw $t1, 6744($t0)
	sw $t1, 7000($t0)
	sw $t1, 7256($t0)
	sw $t1, 7512($t0)
	sw $t1, 7772($t0)
	sw $t1, 7520($t0)
	sw $t1, 7524($t0)
	sw $t1, 7784($t0)
	sw $t1, 8040($t0)
	sw $t1, 8296($t0)
	sw $t1, 8544($t0)
	sw $t1, 8548($t0)
	sw $t1, 6456($t0) #Eye 1
	sw $t1, 6708($t0)
	sw $t1, 6964($t0)
	sw $t1, 7224($t0)
	sw $t1, 7228($t0)
	sw $t1, 6720($t0)
	sw $t1, 6976($t0)
	sw $t1, 6540($t0) #eye 2
	sw $t1, 6284($t0)
	sw $t1, 6792($t0)
	sw $t1, 7048($t0)
	sw $t1, 7308($t0)
	sw $t1, 7312($t0)
	sw $t1, 7060($t0)
	sw $t1, 6804($t0)
	addi $t6, $t0, 10764
	addi $t5, $t0, 10592
	addi $t4, $t0, 10932
	lw $t7, height1
LOOP5:
	sw $t1, 0($t6)  # first long length of the lenny face shirt
	sw $t1, 0($t5)  # second long length of the lenny face shirt
	sw $t1, 0($t4)  # third long length of the lenny face shirt
	addi $t6, $t6, 256 # go down one pixel
	addi $t5, $t5, 256
	addi $t4, $t4, 256
	addi $t7, $t7, -1
	bnez $t7, LOOP5
	sw $t1, 10512($t0) #shirt pixels
	sw $t1, 10260($t0)
	sw $t1, 10008($t0)
	sw $t1, 9756($t0)
	sw $t1, 9504($t0)
	sw $t1, 9632($t0)
	sw $t1, 9892($t0)
	sw $t1, 10152($t0)
	sw $t1, 10412($t0)
	sw $t1, 10672($t0)
	sw $t1, 9812 ($t0)
	sw $t1, 10072($t0)
	sw $t1, 10332($t0)
	sw $t1, 10340($t0)
	sw $t1, 10088($t0)
	sw $t1, 9836($t0)
	sw $t1, 10064($t0)
	sw $t1, 10096($t0)
	sw $t1, 10316($t0)
	sw $t1, 10572($t0)
	sw $t1, 10356($t0)
	sw $t1, 10612($t0)
	sw $t1, 6188 ($t0)
Start_Loop_Final:
	lui    $t3, 0x000000
	lw $t2, frames
	lw $t7, width2
	addi $t6, $t0, 6188
	addi $t5, $t0, 6272 
	addi $t4, $t0, 9304
LOOP3: #draws lowered eyebrows#brows
 	sw $t1, 6692($t0)
	sw $t1, 6440($t0)
	sw $t1, 6468($t0)
	sw $t1, 6728($t0)#mouth
	sw $t1, 9044($t0)
	sw $t1, 8784($t0)
	sw $t1, 9072($t0)
	sw $t1, 8820($t0)#brows
	sw $t1, 6776($t0)
	sw $t1, 6524($t0)
	sw $t1, 6552($t0)
	sw $t1, 6812($t0)
	sw $t1,	0($t6)
	sw $t1,	0($t5)
	sw $t1,	0($t4)
	addi $t6, $t6, 4
	addi $t5, $t5, 4
	addi $t4, $t4, 4
	addi $t7, $t7, -1
	bnez $t7, LOOP3
	li $v0, 32          #syscall for sleep 
	li $a0, 200            
    	syscall   
	lw $t7, width2
	addi $t6, $t0, 5932
	addi $t5, $t0, 6016 
LOOP00: #draws eyebrows at higher level
	sw $t1, 6436($t0) #hardcoded eyebrow curves
	sw $t1, 6184($t0)
	sw $t1, 6212($t0)
	sw $t1, 6472($t0)
	sw $t1, 6520($t0)	#hardcoded eyebrow curves
	sw $t1, 6268($t0)
	sw $t1, 6296($t0)
	sw $t1, 6556($t0)
	sw $t1,	0($t6)
	sw $t1,	0($t5)
	addi $t6, $t6, 4
	addi $t5, $t5, 4
	addi $t7, $t7, -1
	bnez $t7, LOOP00
	li $v0, 32          #syscall for sleep 
	li $a0, 200            
    	syscall  
	lw $t7, width2
	addi $t6, $t0, 6188
	addi $t5, $t0, 6272 
LOOP0:	#blacks out original eyebrows
	sw $t3, 6692($t0) #brow 1
	sw $t3, 6440($t0)
	sw $t3, 6468($t0)
	sw $t3, 6728($t0)
	sw $t3, 6776($t0)#brow 2
	sw $t3, 6524($t0)
	sw $t3, 6552($t0)
	sw $t3, 6812($t0)
	sw $t3,	0($t6)
	sw $t3,	0($t5)
	addi $t6, $t6, 4
	addi $t5, $t5, 4
	addi $t7, $t7, -1
	bnez $t7, LOOP0
	li $v0, 32          #syscall for sleep 
	li $a0, 200            
    	syscall   
	lw $t7, width2
	addi $t6, $t0, 5932
	addi $t5, $t0, 6016 
LOOP000: #blacks out eyebrows at higher level
	sw $t3, 6436($t0)
	sw $t3, 6184($t0)
	sw $t3, 6212($t0)
	sw $t3, 6472($t0)
	sw $t3, 6520($t0)
	sw $t3, 6268($t0)
	sw $t3, 6296($t0)
	sw $t3, 6556($t0)
	sw $t3,	0($t6)
	sw $t3,	0($t5)
	addi $t6, $t6, 4
	addi $t5, $t5, 4
	addi $t7, $t7, -1
	bnez $t7, LOOP000
LoopFinal:
	addi $t2, $t2, -1
	bnez $t2, Start_Loop_Final
	
	
