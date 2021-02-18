
class Food{
  int xPos;
  int yPos;
  int entityType;
  Player[] targets;
  
  
  Food(int xPos, int yPos){
    this.xPos = xPos;
    this.yPos = yPos;
    this.entityType = 4;
    this.targets = playerArr;
  }
  
  
  void fleeFromPlayerXPos(){
    if (playerArr[0].xPos < this.xPos) {
      this.xPos++;
      game.constrainFood();
    }else if(playerArr[0].xPos > this.xPos) {
      this.xPos--;
      game.constrainFood();
    }
  }
  
  
  void fleeFromPlayerYPos(){
    if (playerArr[0].yPos < this.yPos) {
      this.yPos++;
      game.constrainFood();
    }else if(playerArr[0].yPos > this.yPos) {
      this.yPos--;
      game.constrainFood();
    }
  }
}
