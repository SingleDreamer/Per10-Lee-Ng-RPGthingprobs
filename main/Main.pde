private Tile[][] map;
private Tile current;
private int cols = 5;
private int rows = 5;
private PFont f;

private Character[] enemies;
private Character[] players;
private Character currentChar;
private ArrayList<Character> turnOrder;

void setup() {
  size (500, 500);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*50,j*50,50,50);
    }
  }
  
  enemies = new Character[3];
  players = new Character[3];
  
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
  currentChar = turnOrder.get(0);
  
  f = createFont("Arial",16,false);
  
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      map[i][j].display();
      if (map [i][j].getCurrent()){
        current = map [i][j];
      }
    }
  }
  
  for (int i = 0; i < enemies.length; i++){
    enemies[i].display();
    enemies[i].drawStats(f, 370, 25+i*100);
    players[i].display();
    players[i].drawStats(f, 270, 25+i*100);
  }
  
  
  if (mousePressed) {  
    if (!(current.occupied())){
      currentChar.move(current);  
    }
  }
 
}


  //gamestuff, not in proper location
