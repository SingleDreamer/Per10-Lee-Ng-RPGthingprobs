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
   private String name;
   
   private Tile location;
  
   
   public Enemy(){
      super();
      location = map [0][0];
   }
   
   public Enemy(String s){
      super(s); 
      location = map[0][0];
   }      
 
   public void setLocation(int x, int y){ location = map[x][y]; }

   
   public void checkHealth(){
      if (health < (health/2)){
         isLow = true;
      }
   }
   
   public void resetCoords(ArrayList<Tile> tiles){
      players = tiles;
   }
   
   public void move(Tile target){
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
