
/*  SP1 - GRIDBASED GAME  */

color black = #000000;
color white = #FFFFFF;
color pink = #FF437C; // Player1
color blue = #43D5FF; // Player2
color purple = #CD19E5; // Enemy
color yellow = #F9FA1E; // Food

Game game;
boolean gameOver;
int enemyPrevFrameCount;
int foodPrevFrameCount;
int currentFrameCount;

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
    
    //checkGameBoard(game.grid); // Delete later
}


void keyPressed(){
    game.movePlayer1();
    game.movePlayer2();
}


void checkGameBoard(int[][] arr){ // Delete later
  System.out.println("");
  System.out.println("");
  System.out.println("");
  
  for (int x = 0; x < arr.length; x++){
    for (int y = 0; y < arr[0].length; y++){
      System.out.print(arr[y][x] + ", ");  
    }
    println();
  }
}
