
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
Player[] playerArr = new Player[2];
Enemy enemy;

void setup(){
  size(801, 801);
  
  game = new Game();
  player1 = new Player(0, 15, 1);
  player2 = new Player(15, 0, 2);
  playerArr = new Player[]{player1, player2};
}

void draw(){
    game.clearGameBoard();
    game.updateEntities();
    game.drawGameBoard();  
    
    //checkGameBoard(game.grid); // Delete later
}

void checkGameBoard(int[][] arr){ // Delete later
  System.out.println("");
  System.out.println("");
  System.out.println("");
  
  for (int x = 0; x < arr.length; x++){
    for (int y = 0; y < arr[0].length; y++){
      System.out.print(arr[x][y] + ", ");  
    }
    println();
  }
}
