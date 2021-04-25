@ SNES Device Driver, CPSC 359 Assign3
@ Produced by Kevin Vo and Wesley Tang

@ Code section
.section .text


.global snesIni
.global readSNES
snesIni:	
	
	push	{lr}

	@ Initializing SNES
	bl		getGpioPtr		@ Address for GPFSEL0
	ldr		r1, =gpio_ptr	@ Retrieve address of label
	str		r0, [r1]		@ Store gpio address at label

	@ Setting LATCH line
	mov		r0, #9
	mov		r1, #1
	bl		initGPIO

	@ Setting DATA line
	mov		r0, #10
	mov		r1, #0
	bl		initGPIO

	@ Setting CLOCK line
	mov		r0, #11
	mov		r1, #1
	bl		initGPIO
	
	pop		{lr}
	
	bx		lr
	
snesLoop:
	ldr		r0, =prompt		@ String pointer
	bl		printf			@ Print prompt

press:
	bl		readSNES
	
	mov		r4, #0xffff
	cmp		r0, r4
	beq		press		@ Checks if no button is pressed
	
	mov		r1, #0		@ testing for 12 bits, r1 = 0
	
testing:
	tst		r0, #1
	beq		check
	
	lsr		r0, #1		@ shift to next bit
	
	add		r1, #1
	cmp		r1, #12
	blt		testing
	
	b		snesLoop

check:		
	cmp		r1, #0
	ldreq	r0,	=bBtn
	
	cmp		r1, #1
	ldreq	r0, =yBtn
	
	cmp		r1, #2
	ldreq	r0, =slBtn
	
	cmp		r1, #3
	ldreq	r0, =stBtn
	
	cmp		r1, #4
	ldreq	r0, =upBtn
	
	cmp		r1, #5
	ldreq	r0, =dnBtn
	
	cmp		r1, #6
	ldreq	r0, =lfBtn
	
	cmp		r1, #7
	ldreq	r0, =rtBtn
	
	cmp		r1, #8
	ldreq	r0, =aBtn
	
	cmp		r1, #9
	ldreq	r0, =xBtn
	
	cmp		r1, #10
	ldreq	r0, =lBtn
	
	cmp		r1, #11
	ldreq	r0, =rBtn
	
printBtn:					@ Prints all buttons
	bl		printf
	b		snesLoop
	
end:		
	ldr		r0, =terminate
	bl		printf

	b		haltLoop$
    
/////////////////////////////////// SUBROUTINES //////////////////////////////////////////

initGPIO:
	@ Initializes GPIO lines
	@ r0 = line number
	@ r1 = function code
	
	ldr		r2,	=gpio_ptr
	ldr		r2, [r2]
	
initGPIOLoop:
	cmp		r0, #9		@ Check line number
	subhi	r0, #10
	addhi	r2, #4
	bhi		initGPIOLoop
	
	add		r0, r0, lsl #1
	lsl		r1, r0
	
	mov		r3, #7
	lsl		r3, r0
	
	ldr		r0, [r2]
	bic		r0, r3
	orr		r0, r1
	str		r0, [r2]
	
	bx		lr


writeLatch:
    @ Writes 1 or 0 to the LATCH
    @ r0 = value to write
    
    ldr		r2, =gpio_ptr		@ gpio base address
    ldr		r2, [r2]
    
    mov  	r1, #9				@ r1 = pin 9, LATCH
    mov		r3, #1
    lsl		r3, r1				@ align with pin 9
    
    teq		r0, #0				@ value to write
    streq	r3, [r2, #40]		@ GPCLR0
    strne	r3, [r2, #28]		@ GPSET0

    bx		lr
    
writeClock:
    @ Writes 1 or 0 to the CLOCK
    @ r0 = value to write
    
    ldr		r2, =gpio_ptr		@ gpio base address
    ldr		r2, [r2]
    
    mov		r1, #11				@ r1 = pin 11, CLOCK
    mov		r3, #1
    lsl		r3, r1				@ align with pin 11
    
    teq		r0, #0				@ value to write
    streq	r3, [r2, #40]		@ GPCLR0
    strne	r3, [r2, #28]		@ GPSET0
    
    bx		lr
    
readData:
    @ reads value in GPLEV0
    @ Returns: 0 or 1 in r0
    
    mov		r0, #10			@ r0 = pin 10, DATA
    ldr		r1, =gpio_ptr   @ base GPIO address
    ldr		r1, [r1]
    
    ldr		r2, [r1, #52]   @ GPLEV0
    mov		r3, #1
    lsl		r3, r0          @ align with pin 10
    
    and		r2, r3          @ mask everything else
    teq		r2, #0
    
    moveq	r0, #0      @ return 0
    movne	r0, #1      @ return 1
    
    bx		lr
    
    
readSNES:
	@ Reads buttons pressed on the SNES
	
	push	{r4, r5, r7, lr}
	
	
	@ Set GPFSET11 to clock
    mov		r0, #1
    bl		writeClock

	@ Set GPFSET09 to latch
    mov   	r0, #1
    bl		writeLatch
    
	@ Delay for 12 us
	mov		r0, #12
	bl		delayMicroseconds
	
	@ Set GPFCLR09 to latch
    mov		r0, #0
    bl		writeLatch

	mov		r5, #0		@ Start counter at 0 to track which button pressed, i = 0
	mov		r7, #0		@ Initialize sample button register
	
pulseLoop:
	mov		r0, #6		@ Delay for 6 us
	bl		delayMicroseconds
	
	@ GPFCLR11 to clock
    mov  	r0, #0
    bl		writeClock
		
	mov		r0, #6		@ Delay for 6 us
	bl		delayMicroseconds

	@ GPFLEV10 to data
    bl  	readData

	@ Shift buttons register left, orr 1 or 0 depending on read bit
	lsl		r0, r5		@ shift by bit i
	orr		r7, r0		@ orr sample button
	
	@ GPFSET clock
    mov		r0, #1
    bl		writeClock
	
	add		r5,	#1
	cmp		r5,	#16
	blt		pulseLoop
	
	mov		r0, r7		@ returns buttons pressed
	
	pop		{r4, r5, r7, lr}
    bx		lr
    
haltLoop$:
	b	haltLoop$

@ Data section
.section .data

gpio_ptr:
.word		0

creators:
.asciz		"Created by: Kevin Vo and Wesley Tang\r\n"

prompt:
.asciz		"Please press a button...\r\n"

terminate:
.asciz		"Program is terminating...\r\n"

bBtn:
.asciz		"You have pressed B\r\n"

yBtn:
.asciz		"You have pressed Y\r\n"

slBtn:
.asciz		"You have pressed SELECT\r\n"

stBtn:
.asciz		"You have pressed START\r\n"

upBtn:
.asciz		"You have pressed Joy-pad UP\r\n"

dnBtn:
.asciz		"You have pressed Joy-pad DOWN\r\n"

lfBtn:
.asciz		"You have pressed Joy-pad LEFT\r\n"

rtBtn:
.asciz		"You have pressed Joy-pad RIGHT\r\n"

aBtn:
.asciz		"You have pressed A\r\n"

xBtn:
.asciz		"You have pressed X\r\n"

lBtn:
.asciz		"You have pressed LEFT\r\n"

rBtn:
.asciz		"You have pressed RIGHT\r\n"
