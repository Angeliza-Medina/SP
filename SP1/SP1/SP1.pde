
/*  SP1 - GRIDBASED GAME  */

color black = #000000;
color white = #FFFFFF;
color pink = #FF437C;
color blue = #43D5FF;
color purple = #CD19E5;
color yellow = #F9FA1E;
color grey = #4B4B4B;

boolean gameOver;
int enemyPrevFrameCount;
int foodPrevFrameCount;
int currentFrameCount;

Game game;

Player player1;
Player player2;
Player[] playerArr = new Player[2];

Enemy enemy1;
Enemy enemy2;
Enemy enemy3;
Enemy enemy4;
Enemy[] enemyArr = new Enemy[4];

Food food1;
Food food2;
Food food3;
Food food4;
Food[] foodArr = new Food[4];


void setup(){
  size(801, 801);
  
  game = new Game();
  gameOver = false;
  
  enemyPrevFrameCount = frameCount;
  foodPrevFrameCount = frameCount;
  
  player1 = new Player(0, 15, 1);
  player2 = new Player(15, 0, 2);
  playerArr = new Player[]{player1, player2};
  
  enemy1 = new Enemy(0, 0);
  enemy2 = new Enemy(2, 0);
  enemy3 = new Enemy(13, 15);
  enemy4 = new Enemy(15, 15);
  enemyArr = new Enemy[]{enemy1, enemy2, enemy3, enemy4};
  
  food1 = new Food(4, 7);
  food2 = new Food(6, 7);
  food3 = new Food(9, 7);
  food4 = new Food(11, 7);
  foodArr = new Food[]{food1, food2, food3, food4};
}


void draw(){
  if(!gameOver){
    game.clearGameBoard();
    game.updateEntities();
    game.drawGameBoard();  
    game.huntPlayer();
    game.fleeFromPlayer();
    game.dealDamage();
    game.dealScore();
    game.checkIfGameOver();
  }
}


void keyPressed(){
  game.movePlayer1();
  game.movePlayer2();
}
