<<<<<<< HEAD
private Tile[][] map;
private int cols = 5;
private int rows = 5;

void setup() {
  size (500, 500);
  map = new Tile [cols][rows];
  for (int i = 0; i < cols; i++) {    
    for (int j = 0; j < rows; j++) {
      map[i][j] = new Tile(i*20,j*20,20,20);
    }
  }
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      map[i][j].display();
    }
=======
import java.util.*;
public class Main{
  
  void setup() {
  }
  
  void draw() {
>>>>>>> FETCH_HEAD
  }
}


  //gamestuff, not in proper location

