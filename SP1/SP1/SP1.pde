
/*  SP1 - GRID BASED GAME  */

color black = #000000;
color white = #FFFFFF;

Game game = new Game();


void setup(){
  size(801, 801);
}

void draw(){
  game.drawGameBoard(); 
}
