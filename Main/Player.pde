import java.util.*;

public class Player extends Character {
  //should contain player specific functions
  private boolean isLow;
  private int attack;
  private int defense;
  private int speed;
  private int moverange;
  private int health;
  private int attackrange;
  private String name;
  private PImage img;
  private boolean moved;
   private boolean attacked;
   private boolean dead;

  private Tile location;

  public Player() {
    super();
    location = map [4][4];
    img = loadImage("player.png");
  }

  public Player(String s, PImage image){
   super(s, image);
   location = map [4][4];
   img = loadImage("player.png");
  }

  public void setLocation(int x, int y){
    location = map[x][y];
    location.occupy();
  }
  
  public Tile getLocation () {
    return location;
  }


  public void move (Tile target) {
    //if selected tile is in moverange and unoccupied, put player on selected tile
    //otherwise it will fail
    location.deoccupy();
    location = target;
    location.occupy();

  }

  public void attack(Character other){
    if (other instanceof Enemy){
       super.attack(other);
    }else{
       print("Don't attack your teammates!"); 
    }
  }

 public void die(){ 
     dead = true;
     location.deoccupy();
   }
    public boolean isDead(){ return dead; }

  public void endturn() {
    //end the turn
  }

  public void display() {
    if (!dead){
    image(img, location.getX()-12, location.getY()-12);
    }
  }
}


