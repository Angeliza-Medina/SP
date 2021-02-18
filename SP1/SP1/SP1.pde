
/*  SP1 - GRIDBASED GAME  */

color black = #000000;
color white = #FFFFFF;
color pink = #FF437C; // Player1
color blue = #43D5FF; // Player2
color purple = #CD19E5; // Enemy
color yellow = #F9FA1E; // Food

Game game;
Player player1;
Player player2;
Player[] playerArr = {player1, player2};
Enemy enemy;

void setup(){
  size(801, 801);
  
  game = new Game();
  player1 = new Player(0, 25, 1);
  player2 = new Player(25, 0, 2);
}

void draw(){
    game.clearGameBoard();
    game.updateEntities();
    game.drawGameBoard();  
}
