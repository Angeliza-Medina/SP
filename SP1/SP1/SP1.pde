
/*  SP1 - GRIDBASED GAME  */

color black = #000000;
color white = #FFFFFF;
color pink = #FF437C; // Player1
color blue = #43D5FF; // Player2
color purple = #CD19E5; // Enemy
color yellow = #F9FA1E; // Food

Game game;
Player player;
Enemy enemy;

void setup(){
  size(801, 801);
  
  game = new Game();
}

void draw(){
    game.clearGameBoard();
    //game.updateEntities();
    game.drawGameBoard();  
}
