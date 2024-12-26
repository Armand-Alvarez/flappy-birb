# Flappy Birb Example Game Architecture Doc

| This doc will also serve as a template / how-to document for making writing future Game Architecture Docs easier 

## Features 

- [x] Main menu
	- [x] TODO: Center menu
- [x] Bird movement
	- [x] Bird continuously moves downward, accelerated by gravity
	- [x] Spacebar jumps
- [x] Pipes
	- [x] Pipes spawn in on top & bottom with random passage height
	- [x] Pipes move to left, despawn when outside viewport
	- [x] Bird moving in pipe is registered collision
- [ ] Game run
	- [x] Score goes up as you stay alive
	- [ ] Hitting a pipe ends run
	- [ ] Run ending sends back to main menu
- [ ] Score counter
- [ ] Parralax background 
- [ ] Textures/anims
	- [x] Bird texture
	- [ ] Pipe texture
	- [ ] Jumping animation


## Main Menu  (New Game / Current Game)
### List key features
- Main menu has two buttons
	- New game - starts a new game, enters the Running state
	- Quit - Suspends the game entirely
- Game has two states 
	- Running - for when the game is actively being played (pipes on screen, bird moving, etc)
		- Running spawns pipes, increases counter, bird moves
	- Menu - for when in main menu or when dead
		- Stops pipes, bird does death animation, score counter stops

- Main menu displays start & quit buttons
- Clicking start begins a new game
- Clicking quit closes the game
### Data
- Needed: None
- Produced: Starting a new game 
### Comms
- The menu buttons interact with game state (whether or not we are in a running game or the main menu)
- New Game should enter the Running state
- Menu open should enter the Menu state
### Pain points
N/A

### List key features
- Bird continuously moves downward, accelarated by gravity
- `[Spacebar]` jumps
	- Hitting the `[Spacebar]` moves the bird upwards, likely by giving the bird a jolt of upward velocity
		- It's upward velocity is coninuously decreasing to negative because of gravity

### Data
- Needed: 
  - Keyboard input
- Produced:
  - Hitbox movement

## Score counter
### Features
- A number display in corner of the screen
- Number increases only during the Running state (while birdie is alive)

### Data & Comms
- Input: Whether or not to keep counting
	- Signal from Game that indicates the current State
- Output: Score integer 

## Pipes
### Features
- Pipes will spawn-in off the screen on the right, with a top and bottom pipe, and a distance between the two pipes
- Height of pipes is determined by random height of bottom pipe between two constants (want the pipes to spawn in a fair location on the screen)
  - Top pipe is just offset from the top of the bottom pipe
- Top pipe can just have an image that is bottom pipe rotated 180*
- The pipes have hitboxes that can detect collision with the birb
- Birb detects if collision happens
- Pipes move to left, despawn when outside viewport

## Game run
### Features
	- [ ] Score goes up as you stay alive
	- [ ] Hitting a pipe ends run
	- [ ] Run ending sends back to main menu



## Parralax background 
## Textures/anims
	- [ ] Bird texture
	- [ ] Pipe texture
	- [ ] Jumping animation
