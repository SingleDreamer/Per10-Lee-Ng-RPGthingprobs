public class Player extends Character{
   //should contain player specific functions 
   
   public Player(){
      Random raw = new Random();
      attack = raw.nextInt(18) + 3;
      defense = raw.nextInt(18) + 3;
      speed = raw.nextInt(18) + 3;
      health = raw.nextInt(20) + 30;
      moverange = 3;
      attackrange = 1;
   }
   
   public getHealth(){ return health; }
   public setHealth(int n){ health = health + n; }
   
   public getAttack(){ return attack; }
   public setAttack(int n){ attack = n; }
   
   public getDefense(){ return defense; }
   public setDefense(int n){ defense = n; }
   
   public getSpeed(){ return speed; }
   
   public getMoveRange(){ return moverange; }
   
   
   public void move(){
      //if selected tile is in moverange and unoccupied, put player on selected tile
      //otherwise it will fail
   }
   
   public void attack(Character other){
      //if (attackrange contains an enemy)
      //change equations and add special attacks later
      other.setHealth(-1 * (getAttack() - other.getDefense()));
   }
   
   public void endturn(){
      //end the turn
   }
}
