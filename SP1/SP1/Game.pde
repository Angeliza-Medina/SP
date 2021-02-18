
class Game{
  int fieldSize = 50;
  int[][] grid = new int[16][16];
  color[] gameEntityColors = {black, pink, blue, purple, yellow};
  // 0 = Empty field, 1 = Player1, 2 = Player2, 3 = Enemy, 4 = Food 
  
  
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
      }
    }
    return fillColor;
  }
  
  
  void updateEntities(){
    // Updates players
    for(int i = 0; i < playerArr.length; i++){
      grid[playerArr[i].xPos][playerArr[i].yPos] = playerArr[i].entityType;
    } 
    
    // Updates enemies
    for(int i = 0; i < enemyArr.length; i++){
      grid[enemyArr[i].xPos][enemyArr[i].yPos] = enemyArr[i].entityType;
    } 
    
    // Updates food
    for(int i = 0; i < foodArr.length; i++){
      grid[foodArr[i].xPos][foodArr[i].yPos] = foodArr[i].entityType;
    } 
  }
  
  
  void movePlayers(){
    if(key == CODED){
      if(keyCode == UP){
        playerArr[0].yPos--;
      }else if(keyCode == RIGHT){
        playerArr[0].xPos++;
      }else if(keyCode == DOWN){
        playerArr[0].yPos++;
      }else if(keyCode == LEFT){
        playerArr[0].xPos--;
      }
    }else{
      if(key == 'w'){
        playerArr[1].yPos--;
      }else if(key == 'd'){
        playerArr[1].xPos++;
      }else if(key == 'x'){
        playerArr[1].yPos++;
      }else if(key == 'a'){
        playerArr[1].xPos--;
      }
    }
    constrainPlayers();
  }
  
  
  void huntPlayer(){
    for(int i = 0; i < enemyArr.length; i++){
      enemyArr[i].huntPlayerXPos();
      enemyArr[i]. huntPlayerYPos();
    }
  }
  
  
  void fleeFromPlayer(){
    for(int i = 0; i < foodArr.length; i++){
      foodArr[i].fleeFromPlayerXPos();
      foodArr[i].fleeFromPlayerYPos();
    }
  }
  
  
  void endGame(){
    noStroke();
    fill(black);
    rect(0, 0, width, height);
  }
  
  
  void constrainPlayers(){ //Might change later to constrain all entities
    for(int i = 0; i < playerArr.length; i++){
      playerArr[i].xPos = constrain(playerArr[i].xPos, 0, 15);
      playerArr[i].yPos = constrain(playerArr[i].yPos, 0, 15);
    }
  }
  
  
  void constrainEnemies(){
    for(int i = 0; i < enemyArr.length; i++){
      foodArr[i].xPos = constrain(foodArr[i].xPos, 0, 15);
      foodArr[i].yPos = constrain(foodArr[i].yPos, 0, 15);
    }
  }
  
  
  void constrainFood(){
    for(int i = 0; i < foodArr.length; i++){
      foodArr[i].xPos = constrain(foodArr[i].xPos, 0, 15);
      foodArr[i].yPos = constrain(foodArr[i].yPos, 0, 15);
    }
  }
}
