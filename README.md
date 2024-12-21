# Flappy Birb Example Game Architecture Doc

| This doc will also serve as a template / how-to document for making writing future Game Architecture Docs easier 

## Features 

- [ ] Main menu
	- [ ] Run (new game / current game)
	- [ ] Quit
- [ ] Bird movement
	- [ ] Bird continuously moves downward, accelerated by gravity
	- [ ] Spacebar jumps
- [ ] Score counter
- [ ] Pipes
	- [ ] Pipes spawn in on top & bottom with random passage height
	- [ ] Pipes move to left, despawn when outside viewport
	- [ ] Bird moving in pipe is registered collision
- [ ] Game run
	- [ ] Score goes up as you stay alive
	- [ ] Hitting a pipe ends run
	- [ ] Run ending sends back to main menu
- [ ] Parralax background 
- [ ] Textures/anims
	- [ ] Bird texture
	- [ ] Pipe texture
	- [ ] Jumping animation

## Zoom

### High level view (zoom out) - systems interacting, game flow, sequence of events (i.e. how combat system interacts with maps)

### System specific view (zoom in) - Architecture / features of specific system