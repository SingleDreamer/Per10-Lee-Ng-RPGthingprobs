import java.util.*;
public class Enemy extends Character{
   //contains enemy specific stats and functions
   //should probably have some ai stuff here but that will probably be in the main 
   
   //variable for player location
   private ArrayList<Tile> players;
   
   private boolean isLow;
   private int attack;
   private int defense;
   private int speed;
   private int moverange;
   private int health;
   private int attackrange;
   
   private Tile location;
   
   public Enemy(){
      Random raw = new Random();
      attack = raw.nextInt(18) + 3;
      defense = raw.nextInt(18) + 3;
      speed = raw.nextInt(18) + 3;
      health = raw.nextInt(20) + 30;
      moverange = 3;
      attackrange = 1;
      isLow = false;
      location = map[0][0];
   }
   
   public void checkHealth(){
      if (health < (health/2)){
         isLow = true;
      }
   }
   
   public void resetCoords(ArrayList<Tile> tiles){
      players = tiles;
   }
   
   public void move(){
      //if selected tile is in moverange and unoccupied, put player on selected tile
      //otherwise it will fail
      checkHealth();
      //if isLow is true, then it will start to run away
   }
   
   public void attack(Character other){
      //if (attackrange contains an enemy)
      //change equations and add special attacks later
      other.setHealth(-1 * (getAttack() - other.getDefense()));
   }
   
   public void endturn(){
      //end the turn
   }
   
   public void display () {
     fill (255, 0, 0);
     ellipse (location.getX(), location.getY(), 10, 10);
     location.occupy();
   }
}
