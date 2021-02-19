
class Game{
  int fieldSize = 50;
  int[][] grid = new int[16][16];
  color[] gameEntityColors = {black, pink, blue, purple, yellow, grey};
  // 0 = Empty field, 1 = Player1, 2 = Player2, 3 = Enemy, 4 = Food, 5 = Dead Player
  
  
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
  
  
  void movePlayer1(){
    if(playerArr[0].alive){
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
      }
      constrainPlayers();
    }
  }
  
  
  void movePlayer2(){
    if(playerArr[1].alive){
      if(key == 'w'){
        playerArr[1].yPos--;
      }else if(key == 'd'){
        playerArr[1].xPos++;
      }else if(key == 'x'){
        playerArr[1].yPos++;
      }else if(key == 'a'){
        playerArr[1].xPos--;
      }
      constrainPlayers();
    }
  }
  

  void huntPlayer(){
    currentFrameCount = frameCount;
    int frameCountDifference = currentFrameCount - enemyPrevFrameCount;
      
    if(frameCountDifference == 15){
      for(int i = 0; i < enemyArr.length; i++){
        int randomMovement = (int) random(4);
            
        if(randomMovement == 0){
          enemyArr[i].moveInRandomDirection();
        }else{
          float player1Distance = dist(playerArr[0].xPos, playerArr[0].yPos, enemyArr[i].xPos, enemyArr[i].yPos);
          float player2Distance = dist(playerArr[1].xPos, playerArr[1].yPos, enemyArr[i].xPos, enemyArr[i].yPos);
          
          Player currentTarget;
          
          if(player1Distance < player2Distance){
            currentTarget = playerArr[0];
          }else{
            currentTarget = playerArr[1];
          }
          
          enemyArr[i].huntPlayerXPos(currentTarget);
          enemyArr[i]. huntPlayerYPos(currentTarget);
        }
      }
      enemyPrevFrameCount = currentFrameCount;
    }
  }
  
  
  void fleeFromPlayer(){
    currentFrameCount = frameCount;
    int frameCountDifference = currentFrameCount - foodPrevFrameCount;
    
    if(frameCountDifference == 20){
      for(int i = 0; i < foodArr.length; i++){
        int randomMovement = (int) random(4);
         
        if(randomMovement == 0){
          foodArr[i].moveInRandomDirection();
        }else{
          foodArr[i].fleeFromPlayerXPos();
          foodArr[i].fleeFromPlayerYPos();
        }
      }
      foodPrevFrameCount = currentFrameCount;
    }
  }
  
  
  void dealDamage(){
    for(int i = 0; i < playerArr.length; i++){
      playerArr[i].takeDamage();
    }
  }
  
  
  void dealScore(){
    for(int i = 0; i < playerArr.length; i++){
      playerArr[i].increaseScore();
    }
  }
  
  
  void checkIfGameOver(){
    if(!playerArr[0].alive && !playerArr[1].alive){
      this.endGame();
      gameOver = true;
      println("Game Over");
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
      enemyArr[i].xPos = constrain(enemyArr[i].xPos, 0, 15);
      enemyArr[i].yPos = constrain(enemyArr[i].yPos, 0, 15);
    }
  }
  
  
  void constrainFood(){
    for(int i = 0; i < foodArr.length; i++){
      foodArr[i].xPos = constrain(foodArr[i].xPos, 0, 15);
      foodArr[i].yPos = constrain(foodArr[i].yPos, 0, 15);
    }
  }
}
