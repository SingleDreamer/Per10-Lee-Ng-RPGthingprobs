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
   private PImage img;
   
   private Tile location;
  
   
   public Enemy(){
      super();
      location = map [0][0];
      img = loadImage("enemy.bmp");
   }
   
   public Enemy(String s, PImage image){
      super(s, image);
      location = map[0][0];
      img = loadImage("enemy.bmp");
   }
 
   public void setLocation(int x, int y){
     location = map[x][y];
     location.occupy();
   }
   
   public Tile getLocation() {
     return location;
   }

   
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
      location.deoccupy();
      location = target;
      location.occupy();
   }
   
   //public void attack(Character other){
      //if (attackrange contains an enemy)
      //change equations and add special attacks later
      //other.setHealth(-1 * (getAttack() - other.getDefense()));
   //}
   
   public void endturn(){
      //end the turn
   }
   
   public void display () {
     image(img, location.getX()-12, location.getY()-12);
   }
}
