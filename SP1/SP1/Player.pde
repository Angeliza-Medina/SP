
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
  
  
  void takeDamage(){
    for(int i = 0; i < enemyArr.length; i++){
      if(dist(enemyArr[i].xPos, enemyArr[i].yPos, xPos, yPos) == 0){
        
        if(health >= 0){
          health--;
        }else{
          //gameOver = true; CHANGE WHEN YOU ARE DONE
        }
      }
    }
  }
  
  void increaseScore(){
    for(int i = 0; i < foodArr.length; i++){
      if(dist(foodArr[i].xPos, foodArr[i].yPos, xPos, yPos) == 0){
        score++;
        println(score);
      }
    }
  }
}
