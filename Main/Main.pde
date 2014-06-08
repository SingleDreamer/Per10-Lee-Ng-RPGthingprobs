//VARS

//board
private Tile[][] map;
private Tile current;
private int cols = 15;
private int rows = 15;
private int n;
private PFont f;
private PImage backgroundimg;

//buttons
private Button move;
private PImage moveimg;
private Button attack;
private PImage attackimg;
private Button endTurn;
private PImage endTurnimg;
private ArrayList<Tile> links;
private ArrayList<Tile> alinks;

//characters
private ArrayList<Character> enemies;
private PImage enemyimg;
private ArrayList<Character> players;
private PImage playerimg;
private Character currentChar;
private ArrayList<Character> turnOrder;

//SETUP
void setup() {
  
  //board
  size (720, 376);
  backgroundimg = loadImage("background.png");
  image(backgroundimg, 0, 0);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*25,j*25,25,25,i,j);
    }
  }
  links = new ArrayList <Tile> ();
  alinks = new ArrayList <Tile> ();

  //button
  moveimg = loadImage("move.png");
  move = new Button(moveimg, 412, 350);
  attackimg = loadImage("attack.png");
  attack = new Button(attackimg, 512, 350);
  endTurnimg = loadImage("endTurn.png");
  endTurn = new Button(endTurnimg, 612, 350);
  
  //characters
  enemyimg = loadImage("enemy.png");
  playerimg = loadImage("player.png");
  enemies = new ArrayList<Character>();
  players = new ArrayList<Character>();
  
  //turnorder
  turnOrder = new ArrayList<Character>();
  
  for (int i = 0; i < 3; i++){
    enemies.add(new Enemy("Enemy"+(i+1), enemyimg));
    enemies.get(i).setLocation(i,0);
    turnOrder.add(enemies.get(i));
    players.add(new Player("Player"+(i+1), playerimg));
    players.get(i).setLocation(14-i,14);
    turnOrder.add(players.get(i));
  }
  
  Collections.sort(turnOrder);
  currentChar = turnOrder.get(n);
  
  f = createFont("Arial",16,false);
  
  for (Character i : turnOrder) {
    print (i + " " + i.getSpeed() + "\n");
  }
  print ("\n");
  print (currentChar);
  
}


//DRAW
void draw() {
  //board
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      map[i][j].display();
      if (map [i][j].getCurrent()){
        current = map [i][j];
      }
    }
  }
  for (Tile a : links) {
    a.linkify();
    //print (a);
  }
  for (Tile b : alinks) {
    b.linkify();
  }
  
  
  //button
  move.display();
  attack.display();
  endTurn.display();
  
  //characters
  for (int i = 0; i < enemies.size(); i++){
    if (!enemies.get(i).isDead()){
    enemies.get(i).display();
    color c = color(255, 125, 125);
    enemies.get(i).checkHealth();
    fill(c);
    rect(595, 5+i*100, 105, 100);
    enemies.get(i).drawStats(f,600,25+i*100);
    }else{
    color c = color(120, 120, 120);
    fill(c);
    rect(595, 5+i*100, 105, 100);
    }
  }
  for (int i = 0; i < players.size(); i++){
    if (!players.get(i).isDead()){
    players.get(i).display();
    color c = color(125, 255, 125);
    fill(c);
    rect(395, 5+i*100, 105, 100);
    players.get(i).drawStats(f, 400, 25+i*100);
    }else{
      color c = color(120, 120, 120);
      fill(c);
      rect(395, 5+i*100, 105, 100);
    }
  }
  
  color currentcharcolor = color(200, 200, 200);
  fill(currentcharcolor);
  rect(445, 315, 200, 20);
  String currentname = "Currently " + currentChar + "'s turn";
  fill(0);
  text(currentname, 447, 332);
  
  
  //dead characters
  for (int i = 0; i < turnOrder.size(); i++){
    Character chara = turnOrder.get(i);
    if (chara.getHealth() <= 0){
      turnOrder.remove(i);
      if (chara instanceof Enemy){
         for (int e = 0; e < enemies.size(); e++){
            if (enemies.get(e).equals(chara)){
               enemies.get(e).die();
            }
         } 
      }
      if (chara instanceof Player){
         for (int p = 0; p < players.size(); p++){
            if (players.get(p).equals(chara)){
               players.get(p).die();
            } 
         }
      }
    } 
  }
  
  //ai
  if (currentChar instanceof Enemy){
    //ai attack
    boolean attacking = false;
    Random raw = new Random();
    attackLink();
    ArrayList<Character> targets = new ArrayList<Character>();
    for (Tile a: alinks){
      if (a.getChar() != null){
         print(a.getChar());
         if (a.getChar() instanceof Player){
            targets.add(a.getChar()); 
         }
      } 
    }
    if (targets.size() > 0){
      int attacktarget = raw.nextInt(targets.size());
      currentChar.attack(targets.get(attacktarget));
      attacking = true;
    }
    clearLink();
    //ai movement
    if (!attacking){
    moveLink();
    int moveloc = currentChar.getMoveRange() + raw.nextInt(currentChar.getMoveRange()*3);
    Tile newloc = links.get(moveloc);
    if (newloc.occupied()){ moveloc++;}
    currentChar.move(newloc);
    newloc.setChar(currentChar);
    clearLink();
    }
    endTurnAction();
    //print(newloc);
  }
  
  //moving
  if (move.pressed && !currentChar.moved()){
   //if (current.getCurrent() && !(current.occupied())){
     //links.add(current);
    //}
    moveLink();
    }
  
 if (attack.pressed && !currentChar.attacked()){
   //if (current.getCurrent() && !(current.occupied())){
     //links.add(current);
    //}
    attackLink();
    }
 
}


//gamestuff, not in proper location
//??????

void mousePressed(){
  //endturnbutton
  if (endTurn.overButton()){
   clearLink();
   move.pressed = false; 
   endTurn.locked = true;
   print("endTurn");
   endTurnAction();
  }else{
   endTurn.locked = false;
  }
  //movebutton
  if (move.overButton()){
   move.locked = true;
   move.pressed = true;
   attack.pressed = false;
   print("move"+currentChar);
  }else{
   move.locked = false;
  }
  if (move.pressed == true){
    moveAction();
    clearLink();
  }
  //attackbutton
  if (attack.overButton()){
   attack.locked = true;
   attack.pressed = true;
   move.pressed = false;
   print("attack");
    
  }else{
   attack.locked = false;
  }
  if (attack.pressed == true){
   attackAction(currentChar); 
   clearLink();
  }
}

void mouseReleased(){
 endTurn.locked = false;
 attack.locked = false;
 move.locked = false;
}

public void attackAction(Character attacker){
    if (current.getCurrent()){
       if (current.occupied()){
         if (current.getLinked()){
          Character defender = current.getChar();
          attack.pressed = false;
          attacker.attack(defender);
          //defender.setHealth(-25);
          currentChar.attackTurn();
          if (currentChar.moved() == true && currentChar.attacked() == true){
            endTurnAction(); 
          }
         }
       } 
    }
}

public void moveAction(){
      if (current.getCurrent()){
        if (!(current.occupied())){
          if (current.getLinked()) {
            //currentChar.getLocation().deaction();
            currentChar.move(current);
            current.setChar(currentChar);
            move.pressed = false;
            currentChar.moveTurn();
            if (currentChar.attacked() == true && currentChar.moved() == true){
              endTurnAction(); 
            }
          }
        }
      }
}

public void endTurnAction(){
   endTurn.pressed = false;
   move.pressed = false;
   attack.pressed = false;
   currentChar.resetActions();
   if (n >= turnOrder.size() - 1){
     n = 0;
   } else{
     n = n + 1;
   }
   //currentChar.getLocation().deaction();
   currentChar = turnOrder.get(n);
}

public void moveLink(){
  int r = currentChar.getLocation().getI();
    int c = currentChar.getLocation().getJ();
    int a = 0;
    for (int i = currentChar.getMoveRange(); i >= -(currentChar.getMoveRange()); i--) {
      if ((r+i>=0) && (r+i < rows)) {
        for (int j = a; j >= 0; j --) {
            /*if ((i==0)&&(j==0)) {
              currentChar.getLocation().action();
              links.add(map[r][c]);
            }*/
            if ((c+j>=0) && (c+j < cols)) {
              links.add (map [r + i][c + j]);
            }
            if ((c-j>=0) && (c-j < cols)) {
              links.add (map [r + i][c - j]);
            }  
          }
        }
        if (i <= 0) {
            a = a - 1;
          }
          else {
            a = a + 1;
          }
    }
}

public void clearLink(){
  for (Tile z : links) {
      z.delinkify();
      //print (a);
    }
    links.clear();
  for (Tile a : alinks) {
      a.delinkify();
    }
    alinks.clear();
}

public void attackLink(){
  int r = currentChar.getLocation().getI();
    int c = currentChar.getLocation().getJ();
    int a = 0;
    for (int i = currentChar.getAttackRange(); i >= -(currentChar.getAttackRange()); i--) {
      if ((r+i>=0) && (r+i < rows)) {
        for (int j = a; j >= 0; j --) {
            /*if ((i==0)&&(j==0)) {
              currentChar.getLocation().action();
              links.add(map[r][c]);
            }*/
            if ((c+j>=0) && (c+j < cols)) {
              alinks.add (map [r + i][c + j]);
            }
            if ((c-j>=0) && (c-j < cols)) {
              alinks.add (map [r + i][c - j]);
            }  
          }
        }
        if (i <= 0) {
            a = a - 1;
          }
          else {
            a = a + 1;
          }
      }
}
