
class Game{
  int fieldSize = 40;
  int[][] grid = new int[25][25];
  
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
    color[] gameEntityColors = {black, pink, blue, purple, yellow};

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

}
