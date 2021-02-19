
# SP1 - Gridbased Game

<i>22-02-2021</i>

* Game Decsription
* Technicalities

<br>

## Game Description
This is a simple 2-player gridbased game.<br>
The objective of this game is to get a higher score than your opponent.<br>

<br>

To score points, the players will have to catch "food", which are running away from the closest player to them. When food has been caught, the player will be given 1 point, which will be added to the player's score. The food that was caught will then respawn on a new random location.<br>
Player scores are shown in the top left corner for player1 and top right corner for player2.

The food is represented by yellow squares.

<br>

While hunting for food, the players will be chased by "enemies". The enemies will go after the player closest to them. When a player is caught by an enemy, the player will be deducted 1 health point.

The enemies are represented by purple squares.

<br>

Both players will start the game with 3 "health points". When a player's health point reaches 0 the player will die. A dead player will not be able to move or score any more points.

Player1 is represented by a pink square.<br>
Player2 is represented by a blue square.<br>
A dead player is represented by a grey square.

<br>

When both players's are dead, the game will end and the "Game Over" screen will be displayed. The game over screen will show both player scores and announce the winner.

<br>

Player1 controls:<br>
Arrow keys.<br>
"LEFT" arrow key for left. "UP" arrow key for up. "RIGHT" arrow key for right. "DOWN" arrow key for down.

Player2 controls:<br>
'a', 'w', 'd', 'x' keys.<br>
"a" key for left. "w" key for up. "d" key for right. "x" key for down.

<br>

## Technicalities

This game is written in (<i>Processing</i>) Java using the software [<i>Processing</i>](https://processing.org/).

This project makes use of:
* Arrays
  * One dimension
  * Two dimension
* Classes
* dist() - For measuring distance between given sets of coodinates
* For loops
* Methods
* Objects
* random() - For producing a random float
* Switch cases

This project has also been uploaded to my <i>gitHub</i> Angeliza-Medina inside the [SP](https://github.com/Angeliza-Medina/SP.git) repository.