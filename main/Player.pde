import java.util.*;
public class Player extends Character {
  //should contain player specific functions 
  private int attack;
  private int defense;
  private int speed;
  private int moverange;
  private int health;
  private int attackrange;

  private Tile location;

  public Player() {
    Random raw = new Random();
    attack = raw.nextInt(18) + 3;
    defense = raw.nextInt(18) + 3;
    speed = raw.nextInt(18) + 3;
    health = raw.nextInt(20) + 30;
    moverange = 3;
    attackrange = 1;
    location = map [4][4];
  }



  public void move() {
    //if selected tile is in moverange and unoccupied, put player on selected tile
    //otherwise it will fail
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

