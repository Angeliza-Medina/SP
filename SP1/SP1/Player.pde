
class Player{
  int xPos;
  int yPos;
  int entityType;
  int health;
  int score;
  
  Player(int xPos, int yPos, color entityType){
    this.xPos = xPos;
    this.yPos = yPos;
    this.entityType = entityType;
    this.health = 3;
    this.score = 0;
  }
}
