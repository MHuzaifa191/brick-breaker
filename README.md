# Brick Breaker Game

## Overview
This is a simple Brick Breaker game implemented in x86 assembly language compiled in DOSBOX. The game allows players to control a paddle to bounce a ball and break bricks on the screen. The objective is to eliminate all the bricks without letting the ball fall below the paddle.

## Project Structure
- `project.asm`: The main assembly file containing the game logic, including the game loop, collision detection, scoring, and rendering.
- `printbar.asm`: Contains routines for printing the game bar.
- `usman1.asm`: Includes various macros for rendering and game mechanics.
- `usman2.asm`: Contains additional macros for printing and updating the game state.
- `cls.asm`: Provides a macro to clear the screen.
- `README.md`: This file.

## Features
- **Game Mechanics**: The player controls a paddle to bounce a ball and break bricks.
- **Scoring System**: Players earn points for breaking bricks, with different scoring for different types of bricks.
- **Levels**: The game progresses through levels as all bricks are cleared.
- **Collision Detection**: The game detects collisions between the ball, paddle, and bricks.

## How to Run
1. Assemble the `project.asm` file using an assembler that supports x86 assembly (e.g., NASM).
2. Link the object file to create an executable.
3. Run the executable in a DOS environment or an emulator that supports 16-bit applications.

## Controls
- Use the left and right arrow keys to move the paddle.
- The game ends if the ball falls below the paddle.

## Requirements
- An x86 compatible environment.
- An assembler (e.g., NASM) and linker.

## Contributing
Feel free to fork the repository and submit pull requests for improvements or additional features.

## License
This project is open-source and available for personal and educational use.