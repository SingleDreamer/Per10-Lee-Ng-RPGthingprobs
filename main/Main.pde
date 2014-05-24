private Tile[][] map;
private Tile current;
private int cols = 5;
private int rows = 5;

private Character e, p;

void setup() {
  size (500, 500);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*50,j*50,50,50);
    }
  }
  
  e = new Enemy();
  p = new Player();
  
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
  
  e.display();
  p.display();
  
  p.move(current);
  
}


  //gamestuff, not in proper location

