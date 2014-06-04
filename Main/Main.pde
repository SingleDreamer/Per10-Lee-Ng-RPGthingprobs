//VARS

//board
private Tile[][] map;
private Tile current;
private int cols = 15;
private int rows = 15;
private int n;
private PFont f;
private Button move;
private Button attack;
private Button endTurn;
private ArrayList<Tile> links;

//characters
private Character[] enemies;
private Character[] players;
private Character currentChar;
private ArrayList<Character> turnOrder;

//SETUP
void setup() {
  
  //board
  size (700, 500);
  background(255);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*25,j*25,25,25, i, j);
    }
  }
  links = new ArrayList <Tile> ();

  //button
  move = new Button ("Move",420, 360);
  attack = new Button("Attack",520, 360);
  attack.c = color(200, 0, 0);
  endTurn = new Button("End Turn",620, 360);
  endTurn.c = color(150, 150, 150);
  
  //characters
  enemies = new Character[3];
  players = new Character[3];
  
  //turnorder
  turnOrder = new ArrayList<Character>();
  
  for (int i = 0; i < 3; i++){
    enemies[i] = new Enemy("Enemy"+(i+1));
    enemies[i].setLocation(i,0);
    turnOrder.add(enemies[i]);
    players[i] = new Player("Player"+(i+1)); 
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
    print (a);
  }
  
  //button
  move.display(f);
  attack.display(f);
  endTurn.display(f);
  //may do multiple times, make a 'move open' var to keep it once
  
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
     /*int x,y;
   x = currentChar.getLocation().getI();
   y = currentChar.getLocation().getJ();
   for (int i = 0; i <= 3; i++) {
      for (int j = 3; i >= 0; i--) {
        if ((x + i > 0) && (x + i < rows)) {
          if ((y+j > 0) && (y+j < cols)) {
            links.add (map [x+i][y+j]);
          }
          if ((y-j >0) && (y-j <cols)) {
            links.add (map [x+i][y-j]);
          }
        }
        if ((x - i > 0) && (x - i < rows)) {
          if ((y+j > 0) && (y+j < cols)) {
            links.add (map [x-i][y+j]);
          }
          if ((y-j >0) && (y-j <cols)) {
            links.add (map [x-i][y-j]);
          }
        }
      }
   }*/
      links.add(map[5][5]);

    //}
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
   //links.add(current);

   
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
   print("attack");
    
  }else{
   attack.locked = false; 
  }
}

void mouseReleased(){
 endTurn.locked = false;
 attack.locked = false;
 move.locked = false; 
}

public void moveAction(){
      if (current.getCurrent()){
        if (!(current.occupied())){  
          currentChar.move(current);
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
