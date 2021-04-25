@ Code section
.section .text

.global menuLoop
	
menuLoop:

	push	{r4-r10, lr}

	bl	readSNES
	mov	r4, r0
	
	@--------------------------------------------
	
	mov r5, #0xFFEF		@ move UP into register
	cmp r4, r5			@ if UP is pressed
	
	moveq	r6, #1			@ Quit if A is pressed
	
	@ Draw the 'select' indicator on top
	ldreq		r0, =select
	ldreq		r1, =selectDim
	
	ldreq		r2, =loc
	moveq		r4, #260
	moveq		r5, #210
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	@ Erase selection on bottom
	moveq		r0, #260
	moveq		r1, #280
	
	ldreq		r2, =dim
	moveq		r4, #32
	moveq		r5, #32
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		erase2
	
	@------------------------------------------
	
	mov	r5, #0xFFDF		@ move DOWN into register
	cmp r4, r5			@ if DOWN is pressed
	
	moveq	r6, #0			@ Start if A is pressed
	
	@ Draw the 'select' indicator on bottom
	ldreq		r0, =select
	ldreq		r1, =selectDim
	
	ldreq		r2, =loc
	moveq		r4, #260
	moveq		r5, #280
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	@ Erase selection on top
	moveq		r0, #260
	moveq		r1, #210
	
	ldreq		r2, =dim
	moveq		r4, #32
	moveq		r5, #32
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		erase2
	
	@------------------------------------------
	
	mov	r5, #0xFEFF		@ move A into register
	cmp r4, r5			@ if A is pressed
	beq	checkStart
	
	
	b			menuLoop
	
	haltLoop$:
		b	haltLoop$
		
		
checkStart:
	cmp		r6, #1
	beq		start
	bne		quit
	
@ Start Game
start:
	bl	drawBG
	
	pop		{r4-r10, lr}
	b	init_game

@ Quit Game
quit:
	mov		r0, #0
	mov		r1, #0
	
	ldr		r2, =dim
	mov		r4, #768
	mov		r5, #960
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	b		haltLoop$
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawBG
drawBG:
	push	{r4-r10, lr}

	ldr		r0, =background
	ldr		r1, =backgroundDim
	
	ldr		r2, =loc
	mov		r4, #0
	mov		r5, #0
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop	{r4-r10, lr}
	bx	lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawLives
drawLives:
	push	{r4-r10, lr}

	ldr		r0, =life
	ldr		r1, =lifeDim
	
	ldr		r2, =loc
	mov		r4, #768
	mov		r5, #0
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	//draw remaining lives
	
	ldr		r0, =lives
	ldr		r0, [r0]
	
	cmp		r0, #1			// one life
	beq		oneLife
	
	cmp		r0, #2
	beq		twoLife			// two lives
	
	cmp		r0, #3
	beq		threeLife		// three Lives

threeLife:	
	// draw three life
	ldr		r0, =ball
	ldr		r1, =ballDim
	
	ldr		r2, =loc
	mov		r4, #1040
	mov		r5, #25
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage	
	
twoLife:
	// draw two life
	ldr		r0, =ball
	ldr		r1, =ballDim
	
	ldr		r2, =loc
	mov		r4, #1000
	mov		r5, #25
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
oneLife:
	// draw one life
	ldr		r0, =ball
	ldr		r1, =ballDim
	
	ldr		r2, =loc
	mov		r4, #960
	mov		r5, #25
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop	{r4-r10, lr}
	bx	lr
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawBrick
@ Draw Brick

drawBrick:
	push	{r4-r10, lr}
	
	mov	r6, #0			// i counter for tile
	mov	r7, #0			// n counter for column
	mov	r8, #0			// m counter for row
	
	mov	r9, #32			// size of tile
	
drawBrickLoop:
	ldr	r0, =tiles_len	// Check to see if gone through all tiles
	ldr	r0, [r0]
	cmp	r6, r0			// i < tiles_len
	bge	drawBrickEnd
	

	cmp	r7, #24			// Check if gone through all columns in a row
	movge	r7, #0		// Reset n = 0
	addge	r8, #1		// m++

	ldr	r0, =tiles		// Get tiles[i] (tiles[0] + (i * 4))
	ldr	r0, [r0, r6, lsl #2]
	
	mov	r10, r0			// store tile type
	
 	// Draw wall
	cmp			r10, #0
	//x = n * tile_size
	//y = m * tile_size

	ldreq		r0, =wall
	ldreq		r1, =wallDim
	
	ldreq		r2, =loc
	
	muleq		r4, r7, r9
	muleq		r5, r8, r9
	
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	// Draw brick1
	cmp			r10, #2
	ldreq		r0, =brick1
	ldreq		r1, =brick1Dim
	
	ldreq		r2, =loc
	
	muleq		r4, r7, r9
	muleq		r5, r8, r9
	
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	// Draw brick2
	cmp			r10, #3
	ldreq		r0, =brick2
	ldreq		r1, =brick2Dim
	
	ldreq		r2, =loc
	
	muleq		r4, r7, r9
	muleq		r5, r8, r9
	
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	// Draw brick3
	cmp			r10, #4
	ldreq		r0, =brick3
	ldreq		r1, =brick3Dim
	
	ldreq		r2, =loc
	
	muleq		r4, r7, r9
	muleq		r5, r8, r9
	
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage

	
drawBrickEndIf:
	add	r6, #1			// i++
	add	r7, #1			// n++

	b	drawBrickLoop

drawBrickEnd:
	pop		{r4-r10, lr}
	bx		lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global eraseBrick
eraseBrick:
	push	{r4-r10, lr}

	ldr		r0, =background
	ldr		r1, =brick1Dim
	ldr		r2, =temp_pos
	
	bl		drawImage

	pop	{r4-r10, lr}
	
	bx	lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawValue1
@ Draw Value Pack 1

drawValue1:
	push	{r4, r5, lr}

	ldr		r0, =value1
	ldr		r1, =value1Dim
	
	ldr		r2, =loc
	
	ldr		r4, =value_pk1_x
	ldr		r4, [r4]
	ldr		r5, =value_pk1_y
	ldr		r5, [r5]
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	bx		lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global eraseValue1
@ Erase Value Pack 1

eraseValue1:
	push	{r4-r10, lr}
	
	ldr		r0, =value_pk1_x
	ldr		r0, [r0]
	ldr		r1, =value_pk1_y
	ldr		r1, [r1]
	
	ldr		r2, =dim
	mov		r4, #64
	mov		r5, #32
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	pop		{r4-r10, lr}
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawValue2
@ Draw Value Pack 2

drawValue2:
	push	{r4, r5, lr}

	ldr		r0, =value2
	ldr		r1, =value2Dim
	
	ldr		r2, =loc
	
	ldr		r4, =value_pk2_x
	ldr		r4, [r4]
	ldr		r5, =value_pk2_y
	ldr		r5, [r5]
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	bx		lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global eraseValue2
@ Erase Value Pack 2

eraseValue2:
	push	{r4-r10, lr}
	
	ldr		r0, =value_pk2_x
	ldr		r0, [r0]
	ldr		r1, =value_pk2_y
	ldr		r1, [r1]
	
	ldr		r2, =dim
	mov		r4, #64
	mov		r5, #32
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	pop		{r4-r10, lr}
	bx		lr
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawPaddle
@ Draw Paddle

drawPaddle:
	push	{r4-r6, lr}
	
	ldr		r6, =paddle_w
	ldr		r6, [r6]		@ get width of paddle
	
	cmp		r6, #256
	beq		drawPaddle2

	ldr		r0, =paddle
	ldr		r1, =paddleDim
	
	ldr		r2, =loc
	
	ldr		r4, =paddle_x
	ldr		r4, [r4]
	ldr		r5, =paddle_y
	ldr		r5, [r5]
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4-r6, lr}
	bx		lr
	
	@ Draws the longer paddle
drawPaddle2:
	
	ldr		r0, =paddle2
	ldr		r1, =paddle2Dim
	
	ldr		r2, =loc
	
	ldr		r4, =paddle_x
	ldr		r4, [r4]
	ldr		r5, =paddle_y
	ldr		r5, [r5]
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4-r6, lr}
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global erasePaddle
@ Erase Paddle

erasePaddle:
	push	{r4-r10, lr}
	
	ldr		r6, =paddle_w
	ldr		r6, [r6]		@ get width of paddle
	
	cmp		r6, #256
	beq		erasePaddle2
	
	ldr		r0, =paddle_x
	ldr		r0, [r0]
	ldr		r1, =paddle_y
	ldr		r1, [r1]
	
	ldr		r2, =dim
	mov		r4, #128
	mov		r5, #32
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	pop		{r4-r10, lr}
	bx		lr
	
erasePaddle2:
	ldr		r0, =paddle_x
	ldr		r0, [r0]
	ldr		r1, =paddle_y
	ldr		r1, [r1]
	
	ldr		r2, =dim
	mov		r4, #256
	mov		r5, #32
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	pop		{r4-r10, lr}
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global eraseBall
@ Erase Ball

eraseBall:
	push	{r4-r10, lr}
	
	ldr		r0, =ball_x
	ldr		r0, [r0]
	ldr		r1, =ball_y
	ldr		r1, [r1]
	
	ldr		r2, =dim
	mov		r4, #32
	mov		r5, #32
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		erase
	
	pop		{r4-r10, lr}
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawBall
@ Draw Ball

drawBall:
	push	{r4, r5, lr}

	ldr		r0, =ball
	ldr		r1, =ballDim
	
	ldr		r2, =loc
	
	ldr		r4, =ball_x
	ldr		r4, [r4]
	ldr		r5, =ball_y
	ldr		r5, [r5]
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	bx		lr

		
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawTitle
@ Draw Title

drawTitle:
	push	{r4, r5, lr}
	
	ldr		r0, =title		@ load title
	ldr		r1, =titleDim	@ load title dimensions
	
	ldr		r2,	=loc		@ location to draw title
	mov		r4, #0
	mov		r5, #0
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawPause
@ Draw Pause

drawPause:
	push	{r4, r5, lr}
	
	ldr		r0, =pause		@ load title
	ldr		r1, =pauseDim	@ load title dimensions
	
	ldr		r2,	=loc		@ location to draw title
	mov		r4, #200
	mov		r5, #200
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	
	bx		lr
		
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawWin
@ Draw Win

drawWin:
	push	{r4, r5, lr}
	
	ldr		r0, =win		@ load title
	ldr		r1, =winDim		@ load title dimensions
	
	ldr		r2,	=loc		@ location to draw title
	mov		r4, #150
	mov		r5, #400
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	
	bx		lr
		
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawLose
@ Draw Lose

drawLose:
	push	{r4, r5, lr}
	
	ldr		r0, =lose		@ load title
	ldr		r1, =loseDim		@ load title dimensions
	
	ldr		r2,	=loc		@ location to draw title
	mov		r4, #150
	mov		r5, #400
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	
	pop		{r4, r5, lr}
	
	bx		lr
		
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global erase
@ Erase Image
@ r0 - x
@ r1 - y
@ r2 - address of width x height to erase

erase:
	push	{r4-r10, lr}
	
	mov		r4, r0			@ copy x
	mov		r5, r1			@ copy y
	mov		r6, r2			@ copy dimensions
	
	mov		r7,	#0			@ total pixels drawn
	mov		r8, #0			@ current col
	mov		r9, #0			@ current row
	
	ldr		r0, [r6]		@ width
	ldr		r1, [r6, #4]	@ height
	mul		r10, r0, r1		@ width*height = total pixels needed
	
	b		eraseEnd
	
eraseLoop:
	mov		r0, r4 			@ x
	mov		r1, r5			@ y
	ldr		r2, =background @ color to 'erase'

	add		r0, r8			@ x+col
	add		r1, r9			@ y+row
	ldr		r2, [r2, r7, lsl #2]	@ colour = addr + pixel number offset by 4
	bl		drawPixel
	
	add		r7, #1			@ pixel++
	add		r8, #1			@ col++ ; next col
	
	ldr		r0, [r6]		@ load width
	cmp		r8, r0			@ compare current col and width
	blt		eraseLoop
	
	mov		r8, #0			@ reset col
	add		r9, #1			@ row++ ; next row
	
	ldr		r0, [r6, #4]	@ load height
	cmp		r9, r0			@ compare height with current row
	blt		eraseLoop
	
eraseEnd:
	cmp		r7,	r10			@ compare total pixels drawn vs needed
	blt		eraseLoop
	
	pop		{r4-r10, lr}
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global erase2
@ Erase Title/Menu
@ r0 - x
@ r1 - y
@ r2 - address of width x height to erase

erase2:
	push	{r4-r10, lr}
	
	mov		r4, r0			@ copy x
	mov		r5, r1			@ copy y
	mov		r6, r2			@ copy dimensions
	
	mov		r7,	#0			@ total pixels drawn
	mov		r8, #0			@ current col
	mov		r9, #0			@ current row
	
	ldr		r0, [r6]		@ width
	ldr		r1, [r6, #4]	@ height
	mul		r10, r0, r1		@ width*height = total pixels needed
	
	b		erase2End
	
erase2Loop:
	mov		r0, r4 			@ x
	mov		r1, r5			@ y
	ldr		r2, =eraseTitle	@ color to 'erase'

	add		r0, r8			@ x+col
	add		r1, r9			@ y+row
	ldr		r2, [r2, r7, lsl #2]	@ colour = addr + pixel number offset by 4
	bl		drawPixel
	
	add		r7, #1			@ pixel++
	add		r8, #1			@ col++ ; next col
	
	ldr		r0, [r6]		@ load width
	cmp		r8, r0			@ compare current col and width
	blt		erase2Loop
	
	mov		r8, #0			@ reset col
	add		r9, #1			@ row++ ; next row
	
	ldr		r0, [r6, #4]	@ load height
	cmp		r9, r0			@ compare height with current row
	blt		erase2Loop
	
erase2End:
	cmp		r7,	r10			@ compare total pixels drawn vs needed
	blt		erase2Loop
	
	pop		{r4-r10, lr}
	bx		lr
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawPixel
		
@ Draw Pixel
@  r0 - x
@  r1 - y
@  r2 - colour

drawPixel:
	push	{r4, r5, lr}

	offset	.req	r4

	ldr		r5, =frameBufferInfo	

	@ offset = (y * width) + x
	ldr		r3, [r5, #4]		@ r3 = width
	mul		r1, r3
	add		offset,	r0, r1
	
	@ offset *= 4 (32 bits per pixel/8 = 4 bytes per pixel)
	lsl		offset, #2

	@ store the colour (word) at frame buffer pointer + offset
	ldr		r0, [r5]			@ r0 = frame buffer pointer
	str		r2, [r0, offset]

	pop		{r4, r5, lr}
	bx		lr
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
.global drawImage

@ Draw Image
@ r0 - address of image
@ r1 - address of image dimensions
@ r2 - address of x,y pair

drawImage:
	push	{r4-r10, lr}
	
	mov		r4, r0			@ copy address
	mov		r5, r1			@ copy dimensions
	mov		r6, r2			@ copy (x,y)
	
	mov		r7,	#0			@ total pixels drawn
	mov		r8, #0			@ current col
	mov		r9, #0			@ current row
	
	ldr		r0, [r5]		@ width
	ldr		r1, [r5, #4]	@ height
	mul		r10, r0, r1		@ width*height = total pixels needed
	
	b		drawImageEnd
	
drawImageLoop:
	ldr		r0, [r6]		@ x
	ldr		r1, [r6, #4]	@ y

	add		r0, r8			@ x+col
	add		r1, r9			@ y+row
	ldr		r2, [r4, r7, lsl #2]	@ colour = addr + pixel number offset by 4
	bl		drawPixel
	
	add		r7, #1			@ pixel++
	add		r8, #1			@ col++ ; next col
	
	ldr		r0, [r5]		@ load width
	cmp		r8, r0			@ compare current col and width
	blt		drawImageLoop
	
	mov		r8, #0			@ reset col
	add		r9, #1			@ row++ ; next row
	
	ldr		r0, [r5, #4]	@ load height
	cmp		r9, r0			@ compare height with current row
	blt		drawImageLoop
	
drawImageEnd:
	cmp		r7,	r10			@ compare total pixels drawn vs needed
	blt		drawImageLoop
	
	pop		{r4-r10, lr}
	bx		lr
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	

@ Data section
.section .data

.global	loc
loc:
	.int	0, 0
	
.global dim
dim:
	.int	0, 0

.global	gpio_ptr
gpio_ptr:
.word		0

.align

.global frameBufferInfo
frameBufferInfo:
	.int	0	@ frame buffer pointer
	.int	0	@ screen width
	.int	0	@ screen height
