
class Game{
  boolean gameStarted;
  boolean gameOver;
  
  int fieldSize = 50;
  int[][] grid = new int[16][16];
  
  Game(){
    gameStarted = false;
    gameOver = false;
  }
  
  void drawGameBoard(){
    colorMode(HSB);
    int hue = 245;
    fill(black);
    
    if(!gameStarted){
      noStroke();
      rect(0, 0, width, height);
      
      drawStartButton();
    }else{
        for(int x = 0; x < grid.length; x++){
        for(int y = 0; y < grid[0].length; y++){
          stroke(hue, 290, 290);
          rect(x * fieldSize, y * fieldSize, fieldSize, fieldSize);
          hue--;
        }
      }
    }
  }
  
  void drawStartButton(){
    rectMode(CENTER);
    noFill();
    stroke(white);
    rect(width/2, height/2, 300, 100);
  }
  
    
  void clearGameBoard(){
  }
  
  void updateEnemies(){
  }
  
  void keyPressed(){
  }
  
  boolean gameOver(Player player1, Player player2){
    if(player1.health < 0 && player2.health < 0){
      gameStarted = false;
      return true;
    }else{
      return false;
    }
  }
}
