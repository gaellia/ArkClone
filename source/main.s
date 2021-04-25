 // CPSC 359 - Assignment 4 - Arkanoid
//
// Created by: Wesley Tang & Kevin Vo 
//

.section .text
tileTemplate:
	.int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0
.global tiles_len
tiles_len:
	.int	(.-tileTemplate)/4		// Gets the number of tiles

// Tile dimensions
tile_size:	.int 32

// Brick dimensions (2 tiles by 1)
brick_w:	.int 64

.global paddle_y
paddle_y:	.int 800	// screen_h - 4 tiles - paddle hieght
paddle_h:	.int 32		// 1 tile height

ball_w:		.int 32		// 1 tile
ball_h:		.int 32		// 1 tile

screen_w:	.int 768	// 24 * 32px
screen_h:	.int 960	// 30 * 32px

max_score:	.int 825	// Score of all bricks	
	
.global main
main:
	@ Initialize Frame Buffer Info
	ldr	r0, =frameBufferInfo
	bl	initFbInfo
	
	bl	snesIni
	
	bl	drawTitle

	
	@ Draw the 'select' indicator on bottom
	ldr		r0, =select
	ldr		r1, =selectDim
	
	ldr		r2, =loc
	mov		r4, #260
	mov		r5, #280
	str		r4, [r2]
	str		r5, [r2, #4]
	
	bl		drawImage
	b		menuLoop		// GOTO Start Menu
	
	// Initailize values at the beginning
	.global init_game
init_game:
// Variable init
	mov	r4, #0
	ldr	r0, =score
	str	r4, [r0]

	mov	r4, #3
	ldr	r0, =lives
	str	r4, [r0]

// Paddle init
	mov	r4, #128
	ldr	r0, =paddle_w
	str	r4, [r0]

	// Set paddle x
	ldr	r0, =screen_w	// screen_w >> 1
	ldr	r5, [r0]
	lsr	r5, #1
	
	ldr	r0, =paddle_w	// paddle_w
	ldr	r6, [r0]
	
	sub	r5, r6, LSR #1
	ldr	r0, =paddle_x	// paddle_x = screen_w >> 1 - paddle_w >> 1
	str	r5, [r0]	// Start in the middle of the screen
	
	mov	r4, #1
	ldr	r0, =paddle_speed
	str	r4, [r0]

// Ball init
	bl	init_ball

// Value packs init
	mov	r4, #-1
	ldr	r0, =value_pk1_x
	str	r4, [r0]

	ldr	r0, =value_pk1_y
	str	r4, [r0]

	ldr	r0, =value_pk2_x
	str	r4, [r0]

	ldr	r0, =value_pk2_y
	str	r4, [r0]

// Flags init
	mov	r4, #0
	ldr	r0, =win_flag
	strb	r4, [r0]

	ldr	r0, =lose_flag
	strb	r4, [r0]

// Restore tiles
	mov	r4, #0			// i = 0

set_tiles_loop:
	ldr	r0, =tiles_len		// Check to see if gone through all tiles
	ldr	r0, [r0]
	cmp	r4, r0			// i < tiles_len
	bge	draw_screen		// If done, draw game and start

	ldr	r0, =tileTemplate	// Get tileTemplate[i]
	ldr	r1, [r0, r4, lsl #2]	// r1 = defualt tile
	ldr	r2, =tiles		// Get the address of tiles[i]
	str	r1, [r2, r4, lsl #2]	// Set tiles[i] = tileTemplate[i]

	add	r4, #1			// Increment i

	b	set_tiles_loop		// Loop again

draw_screen:
	bl		drawBG
	bl		drawBrick
	bl		drawBall
	bl		drawPaddle
	bl		drawLives
	
// Main game loop ---------------------------------
game_loop:
	// Check end game conditions
	ldr	r0, =win_flag
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	game_over
	ldr	r0, =lose_flag
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	game_over

	// Transition game state
	bl	move_ball

	bl	move_valuepacks

	bl	update_player

	// Set flags
	mov	r1, #1

	// Check if set lose condition
	ldr	r0, =lives
	ldrb	r0, [r0]
	cmp	r0, #0
	ldreq	r0, =lose_flag
	streqb	r1, [r0]

	// Check if win
	ldr	r0, =score
	ldrb	r4, [r0]
	ldr	r0, =max_score
	ldr	r5, [r0]

	cmp	r4, r5		// score >= max_score
	ldrge	r0, =win_flag
	strgeb	r1, [r0]	

	// Delay for 60 frames per second
	mov	r0, #16667
	bl	delayMicroseconds

	b	game_loop

// Game Over
game_over:
	ldr	r0, =win_flag
	ldrb	r0, [r0]
	cmp	r0, #1
	beq	show_win
// Lose screen
	bl	drawLose

	b	wait_input
show_win:
	bl	drawWin
// Wait for user to press something to go to main menu
wait_input:
	bl	readSNES
	mov	r1, #0xFFFF
	cmp	r0, r1
	beq	wait_input	// Loop while it is 0 (or FFFF where all buttons not pressed)
	b	main		// Restart to main menu
	
// Game SUBROUTINES ---------------------------

move_ball:
	push {r4-r8, lr}
	// Do nothing if speed is 0
	ldr	r0, =ball_speed
	ldr	r0, [r0]
	cmp	r0, #0
	beq	move_ball_end

	bl	eraseBall

	// Calculate newBall_x into r4
	ldr	r0, =ball_x
	ldr	r4, [r0]

	ldr	r0, =ball_dx
	ldr	r5, [r0]

	ldr	r0, =ball_speed
	ldr	r6, [r0]

	mul	r5, r6			// ball_dx * ball_speed
	add	r4, r5			// newBall_x = ball_x + ball_dx * ball_speed
	
	// Calculate newBall_y into r5
	ldr	r0, =ball_y
	ldr	r5, [r0]

	ldr	r0, =ball_dy
	ldr	r6, [r0]

	ldr	r0, =ball_speed
	ldr	r7, [r0]

	mul	r6, r7			// ball_dy * ball_speed
	add	r5, r6			// newBall_y = ball_y + ball_dy * ball_speed

	// Check if ball goes out of bounds
	ldr	r0, =ball_h
	ldr	r0, [r0]
	add	r1, r5, r0		// newBall_y + ball_h

	ldr	r0, =screen_h
	ldr	r0, [r0]
	cmp	r1, r0			// newBall_y + ball_h >= screen_h
	blt	ball_out_endif
	
	// Lose life
	ldr	r0, =lives
	ldr	r1, [r0]
	sub	r1, #1
	str	r1, [r0]
	
	bl	drawLives

	bl	init_ball
	pop	{r4-r8, lr}
	bx	lr

ball_out_endif:
	
	// Check if ball hits the walls on the side
	ldr	r0, =ball_w
	ldr	r0, [r0]
	add	r1, r4, r0		// newBall_x + ball_w


	ldr	r0, =screen_w
	ldr	r2, [r0]
	ldr	r0, =tile_size
	ldr	r0, [r0]
	sub	r2, r0			// screen_w - tile_size

	cmp	r1, r2			// newBall_x + ball_w >= screen_w - tile_size
	bge	ball_wallx		// If first condition matches, execute

	cmp	r4, r0			// OR newBall_x <= tile_size
	bgt	ball_wallx_endif

ball_wallx:
	ldr	r0, =ball_dx
	ldr	r1, [r0]
	mvn	r1, r1			// ball_dx = -ball_dx
	add	r1, #1
	str	r1, [r0]

ball_wallx_endif:

	// Check if ball hits the top wall
	ldr	r0, =tile_size
	ldr	r0, [r0]

	cmp	r5, r0			// newBall_y <= tile_size
	bgt	ball_wally_endif

	ldr	r0, =ball_dy
	ldr	r1, [r0]
	mvn	r1, r1			// ball_dy = -ball_dy
	add	r1, #1
	str	r1, [r0]

ball_wally_endif:	
	// Brick collision 
	mov	r6, #0			// i counter for tile
	mov	r7, #0			// n counter for column
	mov	r8, #0			// m counter for row

ball_brick_loop:
	ldr	r0, =tiles_len	// Check to see if gone through all tiles
	ldr	r0, [r0]
	cmp	r6, r0			// i < tiles_len
	bge	ball_brick_end

	cmp	r7, #24			// Check if gone through all columns in a row
	movge	r7, #0		// Reset n = 0
	addge	r8, #1		// m++

	ldr	r0, =tiles		// Get tiles[i] (tiles[0] + (i * 4))
	ldr	r0, [r0, r6, lsl #2]
	cmp	r0, #1			// Check if this tile is a brick
	ble	ball_brick_endif

	// Check for collision between ball and this brick
	ldr	r0, =tile_size	// Get tile_size in r0
	ldr	r0, [r0]
	ldr	r1, =ball_w	// Get ball_w in r1
	ldr	r1, [r1]
	ldr	r2, =brick_w	// Get brick_w in r2
	ldr	r2, [r2]

	mul	r0, r7			// r0 = n * tile_size
	add	r2, r0			// r2 = n * tile_size + brick_w

	// Check if the left of the ball collides
	cmp	r4, r0			// newBall_x >=  n * tile_size
	blt	ball_brick_ifx1	// If fails, try the alternate condition

	cmp	r4, r2			// newBall_x <= (n * tile_size + brick_w)
	ble	ball_brick_ify	// If succeed, check y collision

ball_brick_ifx1:
	// Check if the right of the ball collides
	add	r1, r4			// r1 = newBall_x + ball_w

	cmp	r1, r0			// newBall_x + ball_w >=  n * tile_size
	blt	ball_brick_endif

	cmp	r1, r2			// newBall_x + ball_w <= (n * tile_size + brick_w)
	bgt	ball_brick_endif

ball_brick_ify:
	ldr	r0, =tile_size	// Get tile_size in r0
	ldr	r0, [r0]
	ldr	r1, =ball_h	// Get ball_h in r1
	ldr	r1, [r1]

	mul	r2, r0, r8		// r2 = m * tile_size
	add	r0, r2			// r0 = m * tile_size + tile_size

	// Check if the top of the ball collides
	cmp	r5, r2			// newBall_y >=  m * tile_size
	blt	ball_brick_ify1	// If fails, try alternate condition

	cmp	r5, r0			// newBall_y <= (m * tile_size + tile_size)
	ble	ball_collides	// If succeed enter if body

ball_brick_ify1:
	// Check if the bottom of the ball collides
	add	r1, r5			// r1 = newBall_y + ball_h

	cmp	r1, r2			// newBall_y + ball_h >=  m * tile_size
	blt	ball_brick_endif	// If fails, exit

	cmp	r1, r0			// newBall_y + ball_h <= (m * tile_size + tile_size)
	bgt	ball_brick_endif	// If fails, exit

// Checks which side the ball hit
ball_collides:

	// Check if side collision
	ldr	r0, =tile_size
	ldr	r0, [r0]
	ldr	r1, =ball_w
	ldr	r1, [r1]

	mul	r0, r7			// r0 = n * tile_size
	add	r1, r4			// r1 = newBall_x + ball_w

	cmp	r0, r1			// newBall_x + ball_w == n * tile_size
	
	ldreq	r0, =ball_dx		// Reverse ball_dx if side
	ldrne	r0, =ball_dy		// Reverse ball_dy otherwise

	ldr	r1,[r0]
	mvn	r1, r1
	add	r1, #1
	str	r1, [r0]

	// Break the tile and update score
	ldr	r0, =tiles		// Get tiles[i]
	ldr	r1, [r0, r6, lsl #2]
	sub	r1, #1			// Reduce to brick of lesser strength
	str	r1, [r0, r6, lsl #2]

	ldr	r0, =score
	ldr	r1, [r0]
	add	r1, #5			// Update score
	str	r1, [r0]

	ldr	r10, [r0]
	
	bl	drawBrick

	// "Randomly" spawn value packs
	ldr	r0, =tiles		// Get tiles[i]
	ldr	r1, [r0, r6, lsl #2]
	cmp	r1, #1			// Check if the brick has been destroyed
	bne	ball_brick_endif
	
	ldr	r0, =tile_size
	ldr	r0, [r0]

	ldr	r1, =temp_pos

	mul	r2, r7, r0		// r2 = n * tile_size
	str	r2, [r1]
	
	mul	r2, r8, r0		// r2 = m * tile_size
	str	r2, [r1, #4]
	
	bl	eraseBrick

	ldr	r0, =score
	ldr	r0, [r0]
	cmp	r0, #55		// score >= 55
	blt	ball_brick_endif	

	ldr	r1, =value_pk1_x
	ldr	r0, [r1]
	cmp	r0, #0			// Check if unset (value_pk1_x < 0)
	bgt	ball_valuePk2

	ldr	r0, =tile_size
	ldr	r0, [r0]

	mul	r2, r7, r0		// r2 = n * tile_size
	str	r2, [r1]		// Set value pack new x

	ldr	r1, =value_pk1_y
	mul	r2, r8, r0		// r2 = m * tile_size
	str	r2, [r1]		// Set value pack new y

	bl	drawValue1

	b	ball_brick_endif

ball_valuePk2:
	ldr	r0, =score
	ldr	r0, [r0]
	cmp	r0, #105		// score >= 105
	blt	ball_brick_endif	

	ldr	r1, =value_pk2_x
	ldr	r0, [r1]
	cmp	r0, #0			// Check if unset (value_pk2_x < 0)
	bgt	ball_brick_endif

	ldr	r0, =tile_size
	ldr	r0, [r0]

	mul	r2, r7, r0		// r2 = n * tile_size
	str	r2, [r1]		// Set value pack2 new x

	ldr	r1, =value_pk2_y
	mul	r2, r8, r0		// r2 = m * tile_size
	str	r2, [r1]		// Set value pack2 new y

	bl	drawValue2
ball_brick_endif:
	add	r6, #1			// i++
	add	r7, #1			// n++

	b	ball_brick_loop

ball_brick_end:
	
	ldr	r0, =paddle_x
	ldr	r0, [r0]
	ldr	r1, =paddle_w
	ldr	r1, [r1]

	add	r1, r0			// r0 = paddle_x + paddle_w
	
	cmp	r4, r0			// newBall_x >= paddle_x
	blt	ball_paddle_ifx		// If fail, try x + width

	cmp	r4, r1			// newBall_x <= (paddle_x + paddle_w)
	ble	ball_paddle_ify		// If success, check for correct y

ball_paddle_ifx:
	ldr	r2, =ball_w
	ldr	r2, [r2]
	add	r2, r4			// newBall_x + ball_w

	cmp	r2, r0			// newBall_x+ ball_w >= paddle_x
	blt	ball_paddle_endif	// If fail, exit paddle collision

	cmp	r2, r1			// newBall_x + ball_w <= (paddle_x + paddle_w)
	bgt	ball_paddle_endif

ball_paddle_ify:

	ldr	r0, =paddle_y
	ldr	r0, [r0]
	ldr	r1, =paddle_h
	ldr	r1, [r1]

	add	r1, r0			// r1 = paddle_y + paddle_h
	
	cmp	r5, r0			// newBall_y >= paddle_y
	blt	ball_paddle_ify1	// If fail, try y + height

	cmp	r5, r1			// newBall_y <= (paddle_y + paddle_h)
	ble	ball_paddle_check		// If success, check where it collides

ball_paddle_ify1:
	ldr	r2, =ball_h
	ldr	r2, [r2]
	add	r2, r5			// newBall_y + ball_h

	cmp	r2, r0			// newBall_y +  ball_h >= paddle_y
	blt	ball_paddle_endif	// If fail, exit paddle collision

	cmp	r2, r1			// newBall_y + ball_h <= (paddle_y + paddle_h)
	bgt	ball_paddle_endif

ball_paddle_check:
// Check where it collides with the paddle
	ldr	r0, =paddle_w
	ldr	r0, [r0]
	ldr	r1, =paddle_x
	ldr	r1, [r1]
	ldr	r2, =ball_w
	ldr	r2, [r2]
	
	add	r1, r0, lsr #3	// r1 = paddle_x + (paddle_w / 8)
	add	r2, r4			// r2 = newBall_x + ball_w

	cmp	r2, r1			// newBallx + ball_w <= r1
	ble	ball_paddle_ends	// Ball struck left end

	add	r1, r0			// r1 = paddle_x + paddle_w
	sub	r1, r0, lsr #3		// r1 = paddle_x + paddle_w - (paddle_w / 8)
	cmp	r4, r1			// newBall_x >= r1
	bge	ball_paddle_ends	// Ball struck right end
	
	// Collision with inside, using 17/20 as an approx ratio, otherwise
	mov	r1, #-4
	ldr	r0, =ball_dy
	str	r1, [r0]		// Store 2 in dy
	b	ball_paddle_endif
	
	// Collision with ends
ball_paddle_ends:
	ldr	r0, =ball_dx	// r0 = ball_dx address
	ldr	r1, [r0]		// r1 = ball_dx
	ldr	r2, =ball_dy	// r0 = ball_dy address
	ldr	r3, [r2]		// r1 = ball_dy

	mvn	r1, r1			// Negate values
	add	r1, #1
	mvn	r3, r3
	add	r3, #1

	str	r1, [r0]		// Store them back
	str	r3, [r2]

ball_paddle_endif:	
	// Update ball position
	ldr	r1, =ball_x
	str	r4, [r1]		// Update ball_x with newBall_x

	ldr	r1, =ball_y		// Update ball_y with newBall_y
	str	r5, [r1]

move_ball_end:
	bl	drawBall
	
	pop		{r4-r8, lr}
	bx	lr


// Set ball to the centre of the paddle, not moving
init_ball:
	push	{lr}

	bl	eraseBall

	ldr	r0, =paddle_w	// paddle_w >> 1
	ldr	r1, [r0]
	lsr	r1, #1

	ldr	r0, =ball_w
	ldr	r2, [r0]
	sub	r1, r2, lsr #1	// paddle_w >> 1 - ball_w >> 1

	ldr	r0, =paddle_x
	ldr	r3, [r0]
	add	r1, r3		// paddle_x + (paddle_w >> 1) - (ball_w >> 1)

	ldr	r0, =ball_x
	str	r1, [r0]

	ldr	r0, =paddle_y
	ldr	r3, [r0]

	ldr	r0, =ball_h
	ldr	r0, [r0]
	sub	r3, r0		// paddle_y - ball_h

	ldr	r0, =ball_y
	str	r3, [r0]

	// Direction at 45 deg to the upper right	
	mov	r1, #2
	ldr	r0, =ball_dx
	str	r1, [r0]

	mov	r1, #-2
	ldr	r0, =ball_dy
	str	r1, [r0]
	
	mov	r1, #0
	ldr	r0, =ball_speed
	str	r1, [r0]

	bl	drawBall
	
	pop		{lr}

	bx	lr


move_valuepacks:
	push	{r4-r10, lr}
	// Check if value pack1 exists 
	ldr	r0, =value_pk1_y
	ldr	r0, [r0]
	ldr	r1, =screen_h
	ldr	r1, [r1]
	ldr	r2, =value_pk1_x
	ldr	r2, [r2]
	
	cmp	r2, #0		// value_pk1_x > 0
	ble	value_pk2_if	// If not, check other value pack

	cmp	r0, #0		// value_pk1_y > 0
	ble	value_pk2_if	// Is y also -1

	bl	eraseValue1

	// Move the value pack down
	ldr	r0, =value_pk1_y
	ldr	r4, [r0]
	add	r4, #5			// Increment y by 5

	ldr	r1, =screen_h
	ldr	r1, [r1]

	ldr	r3, =tile_size
	ldr	r3, [r3]

	add	r3, r4
	cmp	r3, r1			// value_pk1_y + tile_size >= screen_h
	movge	r4, #-1
	blge	eraseValue1
	
	ldr	r0, =value_pk1_y
	str	r4, [r0]		// store y back
	
	bge	value_pk2_if
	
	bl	drawValue1

	// Check if collides with paddle
	ldr	r0, =value_pk1_x
	ldr	r0, [r0]
	ldr	r1, =paddle_w
	ldr	r1, [r1]
	ldr	r2, =brick_w	// Use the bricks width for the value pack since they are equal
	ldr	r2, [r2]
	ldr	r3, =paddle_x
	ldr	r3, [r3]

	add	r1, r3			// r1 = paddle_x + paddle_w
	
	// Check if the left of the value pack collides
	cmp	r0, r3			// value_pk1_x >= paddle_x
	blt	value_pk1_ifx1	// If fails, try the alternate condition
	
	cmp	r0, r1			// value_pk1_x <= paddle_x + paddle_w
	ble	value_pk1_ify	// If succeed, check y collision

value_pk1_ifx1:
	// Check if the right of the value pack collides
	add	r2, r0			// r2 = value_pk1_x + value_pk_w

	cmp	r2, r3			// value_pk1_x + value_pk_w >= paddle_x
	blt	value_pk2_if

	cmp	r2, r1			// value_pk1_x + value_pk_w <= paddle_x + paddle_w
	bgt	value_pk2_if

value_pk1_ify:
	ldr	r0, =value_pk1_y
	ldr	r0, [r0]
	ldr	r1, =paddle_y
	ldr	r1, [r1]
	ldr	r2, =paddle_h
	ldr	r2, [r2]
	ldr	r3, =tile_size		// tile_size used because it is equal to paddle height
	ldr	r3, [r3]

	add	r2, r1				// r3 = paddle_y + paddle_h
	
	// Check if the top of the value pack collides
	cmp	r0, r1				// value_pk1_y >= paddle_y 
	blt	value_pk1__ify1		// If fails, try alternate condition

	cmp	r0, r2				// value_pk1_y <= paddle_y + paddle_h
	ble	value_pk1_apply		// If succeed enter if body

value_pk1__ify1:
	// Check if the bottom of the value pack collides
	add	r0, r3				// r1 = value_pk1_y + value_pk_h

	cmp	r0, r1				// value_pk1_y + value_pk_h >= paddle_y 
	blt	value_pk2_if		// If fails, try other value pack

	cmp	r0, r2				// value_pk1_y + value_pk_h <= paddle_y + paddle_h
	bgt	value_pk2_if

value_pk1_apply:

	bl	eraseValue1
	
	bl	erasePaddle

	// Apply value pack1 effects
	ldr	r0, =paddle_w
	ldr	r1, [r0]
	lsl	r1, #1				// Shift width by 1, effectively doubling size 
	str	r1, [r0]

	// Reset paddle position to prevent weirdness
	ldr	r0, =screen_w		// screen_w >> 1
	ldr	r5, [r0]
	lsr	r5, #1
	
	ldr	r0, =paddle_w		// paddle_w
	ldr	r6, [r0]
	
	sub	r5, r6, LSR #1
	ldr	r0, =paddle_x		// paddle_x = screen_w >> 1 - paddle_w >> 1
	str	r5, [r0]			// Start in the middle of the screen

	bl	drawPaddle

	// 'Delete' value pack
	mov	r1, #-1
	ldr	r0, =value_pk1_x
	str	r1, [r0]

	mov	r1, #-1
	ldr	r0, =value_pk1_y
	str	r1, [r0]
	
value_pk2_if:
	// Check if value pack2 exists 
	ldr	r0, =value_pk2_y
	ldr	r0, [r0]
	ldr	r1, =screen_h
	ldr	r1, [r1]
	ldr	r2, =value_pk2_x
	ldr	r2, [r2]
	
	cmp	r2, #0		// value_pk2_x > 0
	poplt	{r4-r10, lr}
	bxlt	lr		// Return if fail
	
	cmp	r0, #0		// value_pk2_y < 0
	poplt	{r4-r10, lr}
	bxlt	lr		// Return if fail

	bl	eraseValue2

	// Move the value pack down
	ldr	r0, =value_pk2_y
	ldr	r4, [r0]
	add	r4, #5		// Increment y by 5

	ldr	r1, =screen_h
	ldr	r1, [r1]

	ldr	r3, =tile_size
	ldr	r3, [r3]

	add	r3, r4
	cmp	r3, r1			// value_pk2_y + tile_size >= screen_h
	movge	r4, #-1
	blge	eraseValue2
	
	ldr	r0, =value_pk2_y
	str	r4, [r0]		// store y back
	
	popge	{r4-r10, lr}
	bxge	lr
	
	bl	drawValue2
	
	// Check if collides with paddle
	ldr	r0, =value_pk2_x
	ldr	r0, [r0]
	ldr	r1, =paddle_w
	ldr	r1, [r1]
	ldr	r2, =brick_w	// Use the bricks width for the value pack since they are equal
	ldr	r2, [r2]
	ldr	r3, =paddle_x
	ldr	r3, [r3]

	add	r1, r3			// r1 = paddle_x + paddle_w
	
	// Check if the left of the value pack collides
	cmp	r0, r3			// value_pk2_x >= paddle_x
	blt	value_pk2_ifx1	// If fails, try the alternate condition
	
	cmp	r0, r1			// value_pk2_x <= paddle_x + paddle_w
	ble	value_pk2_ify	// If succeed, check y collision

value_pk2_ifx1:
	// Check if the right of the value pack collides
	add	r2, r0			// r2 = value_pk2_x + value_pk_w

	cmp	r2, r3			// value_pk2_x + value_pk_w >= paddle_x
	poplt	{r4-r10, lr}
	bxlt	lr			// Return if condition fails

	cmp	r2, r1			// value_pk2_x + value_pk_w <= paddle_x + paddle_w
	popgt	{r4-r10, lr}
	bxgt	lr

value_pk2_ify:
	ldr	r0, =value_pk2_y
	ldr	r0, [r0]
	ldr	r1, =paddle_y
	ldr	r1, [r1]
	ldr	r2, =paddle_h
	ldr	r2, [r2]
	ldr	r3, =tile_size		// tile_size used because it is equal to paddle height
	ldr	r3, [r3]

	add	r2, r1			// r3 = paddle_y + paddle_h
	
	// Check if the top of the value pack collides
	cmp	r0, r1			// value_pk2_y >= paddle_y 
	blt	value_pk2__ify1		// If fails, try alternate condition

	cmp	r0, r2			// value_pk2_y <= paddle_y + paddle_h
	ble	value_pk2_apply		// If succeed apply effect

value_pk2__ify1:
	// Check if the bottom of the value pack collides
	add	r0, r3			// r1 = value_pk2_y + value_pk_h

	cmp	r0, r1			// value_pk2_y + value_pk_h >= paddle_y 
	poplt	{r4-r10, lr}
	bxlt	lr				// If fails return

	cmp	r0, r2			// value_pk2_y + value_pk_h <= paddle_y + paddle_h
	popgt	{r4-r10, lr}
	bxgt	lr

value_pk2_apply:

	bl	eraseValue2

	// Apply value pack2 effects
	mov	r1, #1
	ldr	r0, =ball_speed
	str	r1, [r0]		// Slow ball speed to a multiplier of 1

	mov	r1, #-1
	ldr	r0, =value_pk2_x
	str	r1, [r0]

	mov	r1, #-1
	ldr	r0, =value_pk2_y
	str	r1, [r0]

	pop	{r4-r10, lr}
	bx	lr

update_player:
	push	{r4-r10, lr}
	bl	readSNES		// Read from SNES controller
	mov	r4, r0			// Store result in r4


	// F 111a rldu s11b

	// 0 0 0 0001 -> bit mask
	// F F F 1010 -> value
	// 0 0 0 0001 -> 1 if pressed, 0 if not

	mov	r5, #0xFFF7		@ move START into register
	cmp r4, r5			@ if START is pressed
	
	bleq		drawPause		@ Draw the pause
	@ Draw the 'select' indicator on bottom
	ldreq		r0, =select
	ldreq		r1, =selectDim
	
	ldreq		r2, =loc
	moveq		r4, #300
	moveq		r5, #455
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	bleq	pauseLoop		// Jump to pause menu if pressed

a_check:
	// Check if a has been pressed to change paddle speed
	mov	r0, #1				// Bit mask, shifted to A
	lsl	r0, #8
	bics	r0, r0, r4		// Bit clear to test if the button pressed
	moveq	r1, #4			// If the button is not pressed, set paddle speed to default
	movne	r1, #6			// If button is pressed, speed up

	ldr	r0, =paddle_speed
	str	r1, [r0]			// Store speed

	// Check if left button pressed
	mov	r0, #1				// Bit mask, shifted to the LEFT joy pad
	lsl	r0, #6
	bics	r0, r0, r4
	beq	right_check			// If the button is not pressed skip
	
	ldr	r0, =paddle_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]
	ldr	r3, =tile_size		// Width of wall
	ldr	r3, [r3]
	
	sub	r1, r2				// paddle_x -= paddle_speed
	
	mov	r10, r1				// copy r1
	
	cmp	r1, r3				// paddle_x >= wall_x
	blt	b_check				// Only store if the paddle is not moving into a wall

	bl	erasePaddle

	
	ldr	r0, =paddle_x
	str	r10, [r0]			// Save new paddle position

	bl	drawPaddle

	// Check to see if ball should move too
	ldr	r0, =ball_speed
	ldr	r1, [r0]
	cmp	r1, #0
	bne	b_check			// If ball not attached to paddle, move on
	
	ldr	r0, =ball_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]

	bl	eraseBall

	ldr	r0, =ball_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]
	sub	r1, r2			// ball_x -= paddle_speed
	str	r1, [r0]

	bl	drawBall
	
	b	b_check			// If left pressed, right can't be pressed so skip it

	// Check if right button pressed
right_check:
	mov	r0, #1			// Bit mask, shifted to the RIGHT joy pad
	lsl	r0, #7
	bics	r0, r0, r4
	beq	b_check
	
	ldr	r0, =paddle_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]
	ldr	r3, =tile_size
	ldr	r3, [r3]
	ldr	r5, =screen_w	// To get the wall on the right side
	ldr	r5, [r5]

	sub	r3, r5, r3		// r3 = screen_w - tile_size

	ldr	r5, =paddle_w
	ldr	r5, [r5]

	add	r1, r2			// paddle_x += paddle_speed
	mov	r10, r1			// copy r1

	add	r5, r1			// r5 = paddle_x + paddle_speed + paddle_w
	
	cmp	r5, r3			// paddle_x + paddle_speed + paddle_w <= screen_w - tile_size
	bgt	b_check			// Only store if the paddle is not moving into a wall
	
	bl	erasePaddle

	ldr	r0, =paddle_x
	str	r10, [r0]		// Save new paddle position

	bl	drawPaddle

	// Check to see if ball should move too
	ldr	r0, =ball_speed
	ldr	r1, [r0]
	cmp	r1, #0
	bne	b_check			// If ball not attached to paddle, move on
	

	ldr	r0, =ball_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]


	bl	eraseBall

	ldr	r0, =ball_x
	ldr	r1, [r0]
	ldr	r2, =paddle_speed
	ldr	r2, [r2]
	add	r1, r2			// ball_x += paddle_speed
	str	r1, [r0]

	bl	drawBall

	// Check if b pressed
b_check:
	mov	r0, #1			// Bit mask for B
	bics	r0, r0, r4
	popeq	{r4-r10, lr}
	bxeq	lr			// If not pressed, return
	
	mov	r1, #2		// New ball_speed
	ldr	r0, =ball_speed
	str	r1, [r0]		// Set ball_speed
	
	//* Please note if the player loses while the ball_speed value pack is in effect
	// they lose it. Because who loses with such a slow ball?? *

	pop	{r4-r10, lr}
	bx	lr
	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Pause Menu
.global pauseLoop
	
pauseLoop:

	push	{r4-r10, lr}
	
	mov		r0, #50000
	bl		delayMicroseconds

	bl	readSNES
	mov	r4, r0
	
	@--------------------------------------------
	
	mov r5, #0xFFEF		@ move UP into register
	cmp r4, r5			@ if UP is pressed
	
	moveq	r6, #1			@ restart if A is pressed
	
	@ Draw the 'select' indicator on top
	ldreq		r0, =select
	ldreq		r1, =selectDim
	
	ldreq		r2, =loc
	moveq		r4, #300
	moveq		r5, #345
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	@ Erase selection on bottom
	moveq		r0, #300
	moveq		r1, #455
	
	ldreq		r2, =dim
	moveq		r4, #32
	moveq		r5, #32
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		erase2
	
	@------------------------------------------
	
	mov	r5, #0xFFDF		@ move DOWN into register
	cmp r4, r5			@ if DOWN is pressed
	
	moveq	r6, #0			@ Quit if A is pressed
	
	@ Draw the 'select' indicator on bottom
	ldreq		r0, =select
	ldreq		r1, =selectDim
	
	ldreq		r2, =loc
	moveq		r4, #300
	moveq		r5, #455
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		drawImage
	
	@ Erase selection on top
	moveq		r0, #300
	moveq		r1, #345
	
	ldreq		r2, =dim
	moveq		r4, #32
	moveq		r5, #32
	streq		r4, [r2]
	streq		r5, [r2, #4]
	
	bleq		erase2
	
	@------------------------------------------
	
	mov	r5, #0xFFF7		@ move START into register
	cmp r4, r5			@ if START is pressed
	popeq	{r4-r10, lr}
	beq	draw_screen
	
	@------------------------------------------
	
	mov	r5, #0xFEFF		@ move A into register
	cmp r4, r5			@ if A is pressed
	beq	checkSelection
	
	b		pauseLoop
	
checkSelection:
	cmp		r6, #1
	beq		restart
	bne		quitGame
	
@ restart Game
restart:
	bl	drawBG
	
	pop		{r4-r10, lr}
	b	init_game

@ Quit Game
quitGame:
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
	
haltLoop$:
	b	haltLoop$


.section .data

	// Tiles: 0 - wall, 1 - floor, 2 - brick1, 3 -  brick2, 4 - brick3
.global tiles
tiles:
	.int 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 4, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0

.global score
.global lives
score:	.int 0
lives:	.int 3

// Paddle x and y indicate the leftmost point of the paddle
.global	paddle_x
.global paddle_w
paddle_x: 	.int 0		// screen_w >> 1 - paddle_w >> 1
paddle_w: 	.int 128	// 4 tiles
paddle_speed:	.int 1

// Ball Vars
.global ball_x
.global ball_y
ball_x:		.int 0
ball_y:		.int 0
ball_dx:	.int 0		// Horizontal direction
ball_dy:	.int 0		// Vertical direction
ball_speed: 	.int 2

	// Temp vars for brick deletion
	.global temp_pos
temp_pos:		.int 0, 0

// Value pack vars
.global value_pk1_x
.global value_pk1_y
value_pk1_x:	.int -1
value_pk1_y:	.int -1

.global value_pk2_x
.global value_pk2_y
value_pk2_x:	.int -1
value_pk2_y:	.int -1

// Flags
win_flag:	.byte 0
lose_flag:	.byte 0

