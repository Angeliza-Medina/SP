
class Game{
  int fieldSize = 50;
  int[][] grid = new int[16][16];
  color[] gameEntityColors = {black, pink, blue, purple, yellow};
  // 0 = Empty field, 1 = Player1, 2 = Player2, 3 = Enemy, 4 = Food 
  
  Game(){
    
  }
  
  void clearGameBoard(){
      for (int x = 0; x < grid.length; x++){
          for (int y = 0; y < grid[0].length; y++){
              grid[x][y] = 0;
          }
      }
  }
  
  void drawGameBoard(){
    stroke(white);
    for (int x = 0; x < grid.length; x++){
      for (int y = 0; y < grid[0].length; y++){
        fill(getColorFromType(grid[x][y]));
        
        rect(x * fieldSize, y * fieldSize, fieldSize, fieldSize);
      }
    }
  }
  
  color getColorFromType(int type){
    color fillColor = black;
    
    for(int i = 0; i < gameEntityColors.length; i++){
      if(type == i){
        fillColor = gameEntityColors[i];
      }else{
        fillColor = gameEntityColors[0];
      }
    }
    return fillColor;
  }
  
  void updateEntities(){
    for(int i = 0; i < playerArr.length; i++){
      grid[playerArr[i].xPos][playerArr[i].yPos] = playerArr[i].entityType;
      println(grid[playerArr[i].xPos][playerArr[i].yPos]);
      //player.takeDamage()
    } 
  }

}
