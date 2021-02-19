
class Enemy{
  
  int xPos;
  int yPos;
  int entityType;
  Player[] targets;
  
  
  Enemy(int xPos, int yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    this.entityType = 3;
    this.targets = playerArr;
  }
  
  
  void huntPlayerXPos(Player currentTarget){
    if (currentTarget.xPos < this.xPos) {
      this.xPos--;
      game.constrainEnemies();
    }else if(currentTarget.xPos > this.xPos) {
      this.xPos++;
      game.constrainEnemies();
    }
  }
 
  
  void huntPlayerYPos(Player currentTarget){
    if (currentTarget.yPos < this.yPos) {
      this.yPos--;
      game.constrainEnemies();
    }else if(currentTarget.yPos > this.yPos) {
      this.yPos++;
      game.constrainEnemies();
    }
  }
  
  
  void moveInRandomDirection(){
    int randomDirection = (int) random(4);
            
    switch(randomDirection){
      case 0: 
      this.xPos++;
      game.constrainEnemies();
      break;
      
      case 1:
      this.xPos--;
      game.constrainEnemies();
      break;
      
      case 2:
      this.yPos++;
      game.constrainEnemies();
      break;
      
      case 3:
      this.yPos--;
      game.constrainEnemies();
      break;
    }
  }
}
