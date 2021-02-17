
/*  SP1 - GRID BASED GAME  */

color black = #000000;

int fieldSize = 50;
int[][] grid = new int[16][16];

void setup(){
  size(801, 801);
}

void draw(){
  drawGameBoard(); 
}


/*  METHODS  */

void drawGameBoard(){
  colorMode(HSB);
  int hue = 245;
  
  for(int x = 0; x < grid.length; x++){
    for(int y = 0; y < grid[0].length; y++){
      stroke(hue, 290, 290);
      fill(black);
      rect(x * fieldSize, y * fieldSize, fieldSize, fieldSize);
      hue--;
    }
  }
}
