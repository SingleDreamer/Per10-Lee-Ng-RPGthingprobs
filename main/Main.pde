//VARS

//board
private Tile[][] map;
private Tile current;
private int cols = 5;
private int rows = 5;
private int n;
private PFont f;

//characters
private Character[] enemies;
private Character[] players;
private Character currentChar;
private ArrayList<Character> turnOrder;

//SETUP
void setup() {
  
  //board
  size (500, 500);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*50,j*50,50,50);
    }
  }
  
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
    players[i].setLocation(i,4);
    turnOrder.add(players[i]);
  }
  
  Collections.sort(turnOrder);
  currentChar = turnOrder.get(n);
  
  f = createFont("Arial",16,false);
  
  for (Character i : turnOrder) {
    print (i + "\n");
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
  
  //characters
  for (int i = 0; i < enemies.length; i++){
    enemies[i].display();
    enemies[i].drawStats(f, 370, 25+i*100);
    players[i].display();
    players[i].drawStats(f, 270, 25+i*100);
  }
  
  //movement
  if (mousePressed) {  
    if (!(current.occupied())){
      currentChar.move(current); 
      n = n + 1;
      currentChar = turnOrder(n);
    }
  }
 
}


//gamestuff, not in proper location
//??????
