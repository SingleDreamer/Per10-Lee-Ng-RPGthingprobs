public class Character{
   //interface character, extend it into player and enemy
   //should have stats and generic functions 
   
   private int attack;
   private int defense;
   private int speed;
   private int moverange;
   private int health;
   private int attackrange;
   
   private Tile location;
   
   public int getHealth(){ return health; }
   public void setHealth(int n){ health = health + n; }
   
   public int getAttack(){ return attack; }
   public void setAttack(int n){ attack = n; }
   
   public int getDefense(){ return defense; }
   public void setDefense(int n){ defense = n; }
   
   public int getSpeed(){ return speed; }
   
   public int getMoveRange(){ return moverange; }
   
   public void move(){
     
   }
   public void attack(Character other){
     
   }
   public void endturn(){
     
   }
   
   public void display() {
   }
}
