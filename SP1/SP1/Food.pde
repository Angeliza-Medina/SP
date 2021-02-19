
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
  
  
  void fleeFromPlayerXPos(Player closestPlayer){
    if (closestPlayer.xPos < this.xPos) {
      this.xPos++;
      game.constrainFood();
    }else if(closestPlayer.xPos > this.xPos) {
      this.xPos--;
      game.constrainFood();
    }
  }
  
  
  void fleeFromPlayerYPos(Player closestPlayer){
    if (closestPlayer.yPos < this.yPos) {
      this.yPos++;
      game.constrainFood();
    }else if(closestPlayer.yPos > this.yPos) {
      this.yPos--;
      game.constrainFood();
    }
  }
  
  
  void moveInRandomDirection(){
    int randomDirection = (int) random(4);
            
    switch(randomDirection){
      case 0: 
      this.xPos++;
      game.constrainFood();
      break;
      
      case 1:
      this.xPos--;
      game.constrainFood();
      break;
      
      case 2:
      this.yPos++;
      game.constrainFood();
      break;
      
      case 3:
      this.yPos--;
      game.constrainFood();
      break;
    }
  }
  
  void respawnOnRandomLocation(){
    for(int i = 0; i < playerArr.length; i++){
      if(dist(playerArr[i].xPos, playerArr[i].yPos, this.xPos, this.yPos) == 0){
        this.xPos = (int) random(16);
        this.yPos = (int) random(16);
      }
    }
  }
}
