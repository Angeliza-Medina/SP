
class Game{
  int fieldSize = 50;
  int[][] grid = new int[16][16];
  color[] gameEntityColors = {black, pink, blue, purple, yellow, grey};
  /*
    0 = black, Empty field 
    1 = pink, Player1 
    2 = blue, Player2 
    3 = purple, Enemy 
    4 = yellow, Food 
    5 = grey, Dead Player
  */
  
  // Removes any afterimage left by the game's different entities
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
  
  
  void displayScores(){
    textSize(30);
    fill(255);
    text("Player1 score: " + playerArr[0].score, 50, 50); 
    text("Player2 score: " + playerArr[1].score, 520, 50); 
  }
  
  
  void updateEntities(){
    // Updates both players location
    for(int i = 0; i < playerArr.length; i++){
      grid[playerArr[i].xPos][playerArr[i].yPos] = playerArr[i].entityType;
    } 
    
    // Updates all enemy locations
    for(int i = 0; i < enemyArr.length; i++){
      grid[enemyArr[i].xPos][enemyArr[i].yPos] = enemyArr[i].entityType;
    } 
    
    // Updates all food locations
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
      
    if(frameCountDifference == 20){ // Control enemy speed. Lower = slower || Higher = faster
      for(int i = 0; i < enemyArr.length; i++){
        int randomMovement = (int) random(4);
            
        if(randomMovement == 0){
          enemyArr[i].moveInRandomDirection();
        }else{
          float player1Distance = dist(playerArr[0].xPos, playerArr[0].yPos, enemyArr[i].xPos, enemyArr[i].yPos);
          float player2Distance = dist(playerArr[1].xPos, playerArr[1].yPos, enemyArr[i].xPos, enemyArr[i].yPos);
          
          Player currentTarget = playerArr[0];
          
          // Will chase the closest player that is alive
          if(player1Distance < player2Distance){
            if(playerArr[0].alive){
              currentTarget = playerArr[0];
            }else{
              currentTarget = playerArr[1];
            }
          }else if(player1Distance > player2Distance){
            if(playerArr[1].alive){
              currentTarget = playerArr[1];
            }else{
               currentTarget = playerArr[0];
            }
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
    
    if(frameCountDifference == 20){ // Control food speed. Lower = slower || Higher = faster
      for(int i = 0; i < foodArr.length; i++){
        int randomMovement = (int) random(4);
         
        if(randomMovement == 0){
          foodArr[i].moveInRandomDirection();
        }else{
          float player1Distance = dist(playerArr[0].xPos, playerArr[0].yPos, foodArr[i].xPos, foodArr[i].yPos);
          float player2Distance = dist(playerArr[1].xPos, playerArr[1].yPos, foodArr[i].xPos, foodArr[i].yPos);
          
          Player closestPlayer = playerArr[0];
          
          // Will flee from the closest player that is alive
          if(player1Distance < player2Distance){
            if(playerArr[0].alive){
              closestPlayer = playerArr[0];
            }else{
              closestPlayer = playerArr[1];
            }
          }else if(player1Distance > player2Distance){
            if(playerArr[1].alive){
              closestPlayer = playerArr[1];
            }else{
               closestPlayer = playerArr[0];
            }
          }
   
          foodArr[i].fleeFromPlayerXPos(closestPlayer);
          foodArr[i].fleeFromPlayerYPos(closestPlayer);
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
      this.displayGameOverScreen();
      gameOver = true;
    }
  }
  
  void displayGameOverScreen(){
    noStroke();
    fill(black);
    rect(0, 0, width, height);
    
    textSize(70);
    textAlign(CENTER);
    fill(255);
    text("GAME OVER", width/2, 200);
    
    textSize(30);
    fill(pink);
    text("Player1 score: " + playerArr[0].score, width/2, height/2 - 50);
    fill(blue);
    text("Player2 score: " + playerArr[1].score, width/2, height/2); 
  }
  
  
  /*
    Following methods makes sure that no entity can move out of the game board.
    Program will crash without!
  */
    
  void constrainPlayers(){
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
