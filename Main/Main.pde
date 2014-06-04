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
private Character[] enemies;
private PImage enemyimg;
private Character[] players;
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
  enemies = new Character[3];
  players = new Character[3];
  
  //turnorder
  turnOrder = new ArrayList<Character>();
  
  for (int i = 0; i < 3; i++){
    enemies[i] = new Enemy("Enemy"+(i+1), enemyimg);
    enemies[i].setLocation(i,0);
    turnOrder.add(enemies[i]);
    players[i] = new Player("Player"+(i+1), playerimg);
    players[i].setLocation(14-i,14);
    turnOrder.add(players[i]);
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
  for (int i = 0; i < enemies.length; i++){
    enemies[i].display();
    enemies[i].drawStats(f, 600, 25+i*100);
    players[i].display();
    players[i].drawStats(f, 400, 25+i*100);
  }
  
  //moving
  if (move.pressed){
   //if (current.getCurrent() && !(current.occupied())){
     //links.add(current);
    //}
    int r = currentChar.getLocation().getI();
    int c = currentChar.getLocation().getJ();
    print ("("+r+", "+c+ ")");
    int a = 0;
    for (int i = 3; i <= -3; i--) {
      if (i <= 0) {
        links.add (map [r + i][c + a]);
        links.add (map [r + i][c - a]);
        a = a -1;
      }
      else {
        links.add (map [r + i][c + a]);
        links.add (map [r + i][c - a]);
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
          Character defender = current.getChar();
          attack.pressed = false;
          attacker.attack(defender);
       } 
    }
}

public void moveAction(){
      if (current.getCurrent()){
        if (!(current.occupied())){
          currentChar.move(current);
          current.setChar(currentChar);
          move.pressed = false;
          if (n == turnOrder.size() - 1) {
            n = 0;
          }
          else {
            n = n + 1;
          }
          currentChar = turnOrder.get(n);
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
   currentChar = turnOrder.get(n);
}
