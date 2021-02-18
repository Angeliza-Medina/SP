
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
  
  void moveTowardsTarget(){
  }
}
