//note, if move is pressed and then end turn is pressed 
//w/o moving the char, 
//next char automatically does move

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
  size (700, 376);
  backgroundimg = loadImage("background.png");
  image(backgroundimg, 0, 0);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*25,j*25,25,25,i,j);
    }
  }
  links = new ArrayList <Tile> ();

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
    print (i.getName() + " " + i.getSpeed() + "\n");
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
  
  //button
  move.display();
  attack.display();
  endTurn.display();
  
  //characters
  for (int i = 0; i < enemies.size(); i++){
    enemies.get(i).display();
    color c = color(255, 125, 125);
    fill(c);
    rect(595, 5+i*100, 100, 100);
    enemies.get(i).drawStats(f,600,25+i*100);
  }
  for (int i = 0; i < players.size(); i++){
    players.get(i).display();
    color c = color(125, 255, 125);
    fill(c);
    rect(395, 5+i*100, 100, 100);
    players.get(i).drawStats(f, 400, 25+i*100);
  }
  
  //dead characters
  for (int i = 0; i < turnOrder.size(); i++){
    Character chara = turnOrder.get(i);
    if (chara.getHealth() <= 0){
      turnOrder.remove(i);
      if (chara instanceof Enemy){
         for (int e = 0; e < enemies.size(); e++){
            if (enemies.get(e).equals(chara)){
               enemies.remove(e);
            }
         } 
      }
      if (chara instanceof Player){
         for (int p = 0; p < players.size(); p++){
            if (players.get(p).equals(chara)){
               players.remove(p);
            } 
         }
      }
    } 
  }
  
  //moving
  if (move.pressed){
   //if (current.getCurrent() && !(current.occupied())){
     //links.add(current);
    //}
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
  
 if (attack.pressed){
   //if (current.getCurrent() && !(current.occupied())){
     //links.add(current);
    //}
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
 
}


//gamestuff, not in proper location
//??????

void mousePressed(){
  //endturnbutton
  if (endTurn.overButton()){
   for (Tile a : links){
     a.delinkify(); 
   }
   links.clear();
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
   print("move"+currentChar.getName());
  }else{
   move.locked = false;
  }
  if (move.pressed == true){
    moveAction();
    for (Tile a : links) {
      a.delinkify();
      //print (a);
    }
    links.clear();
  }
  //attackbutton
  if (attack.overButton()){
   attack.locked = true;
   attack.pressed = true;
   print("attack");
    
  }else{
   attack.locked = false;
  }
  if (attack.pressed == true){
   attackAction(currentChar); 
   for (Tile a : links){
     a.delinkify();
   }
   links.clear();
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
          currentChar.upActions();
          if (currentChar.getActions() == 2){
            currentChar.resetActions();
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
            currentChar.upActions();
            if (currentChar.getActions() == 2){
              currentChar.resetActions();
              endTurnAction(); 
            }
          }
        }
      }
}

public void endTurnAction(){
   endTurn.pressed = false;
   if (n == turnOrder.size() - 1){
     n = 0;
   } else{
     n = n + 1;
   }
   //currentChar.getLocation().deaction();
   currentChar = turnOrder.get(n);
}
