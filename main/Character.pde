public class Character{
   //interface character, extend it into player and enemy
   //should have stats and generic functions 
   private boolean isLow;
   private int attack;
   private int defense;
   private int speed;
   private int moverange;
   private int health;
   private int attackrange;
   private String name;
   
   private Tile location;
   
   public Character(){
      Random raw = new Random();
      attack = raw.nextInt(18) + 3;
      defense = raw.nextInt(18) + 3;
      speed = raw.nextInt(18) + 3;
      health = raw.nextInt(20) + 30;
      moverange = 3;
      attackrange = 1;
      isLow = false;
      location = map[0][0];
      name = "Generic dude";
   }
   
   public Character(String s){
      Random raw = new Random();
      attack = raw.nextInt(18) + 3;
      defense = raw.nextInt(18) + 3;
      speed = raw.nextInt(18) + 3;
      health = raw.nextInt(20) + 30;
      moverange = 3;
      attackrange = 1;
      isLow = false;
      location = map[0][0];
      name = s;
   }
   
   public String getName(){ return name; }
   
   public int getHealth(){ return health; }
   public void setHealth(int n){ health = health + n; }
   
   public int getAttack(){ return attack; }
   public void setAttack(int n){ attack = n; }
   
   public int getDefense(){ return defense; }
   public void setDefense(int n){ defense = n; }
   
   public int getSpeed(){ return speed; }
   
   public int getMoveRange(){ return moverange; }
   
   public Tile getLocation(){ return location; }
   public void setLocation(int x, int y){ location = map[x][y]; }
   
   public boolean checkHover(){
    return location.isHover(); 
   }
   
   public void drawStats(PFont f, int x, int y){
    textFont(f,16);
    fill(0);
    String s = "";
    s += getName() + "\n";
    s += "Health: " + getHealth() + "\n";
    s += "Attack: " + getAttack() + "\n";
    s += "Defense: " + getDefense() + "\n";
    text(s, x, y);
  }
   
   public void move(Tile target){
     
   }
   public void attack(Character other){
     
   }
   public void endturn(){
     
   }
   
   public void display() {
   }
}
