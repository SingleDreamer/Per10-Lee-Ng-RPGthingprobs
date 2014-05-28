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

  private Tile location;

  public Player() {
    super();
    location = map [4][4]; 
  }

  public Player(String s){
   super(s);
   location = map [4][4]; 
  }   

  public void setLocation(int x, int y){ location = map[x][y]; }


  public void move (Tile target) {
    //if selected tile is in moverange and unoccupied, put player on selected tile
    //otherwise it will fail
    location.deoccupy();
    location = target;
  }

  public void attack(Character other) {
    //if (attackrange contains an enemy)
    //change equations and add special attacks later
    other.setHealth(-1 * (getAttack() - other.getDefense()));
  }

  public void endturn() {
    //end the turn
  }

  public void display() {
    fill (0, 255, 0);
    ellipse (location.getX(), location.getY(), 10, 10);
    location.occupy();
  }
}

