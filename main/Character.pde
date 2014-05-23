public interface Character{
   //interface character, extend it into player and enemy
   //should have stats and generic functions 
   private int attack;
   private int defense;
   private int speed;
   private int moverange;
   private int health;
   private int attackrange;
   
   public void move();
   public void attack(Character other);
   public void endturn();
}
