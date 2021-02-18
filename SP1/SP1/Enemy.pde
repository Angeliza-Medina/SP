
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
  
  
  void huntPlayerXPos(){
    if (playerArr[0].xPos < this.xPos) {
      this.xPos--;
      game.constrainEnemies();
    }else if(playerArr[0].xPos > this.xPos) {
      this.xPos++;
      game.constrainEnemies();
    }
  }
  
  
  void huntPlayerYPos(){
    if (playerArr[0].yPos < this.yPos) {
      this.yPos--;
      game.constrainEnemies();
    }else if(playerArr[0].yPos > this.yPos) {
      this.yPos++;
      game.constrainEnemies();
    }
  }
}
