
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

}
