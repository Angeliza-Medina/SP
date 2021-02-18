
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
  
  void moveAwayFromTarget(){
  }
}
