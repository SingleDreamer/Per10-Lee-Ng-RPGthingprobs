//this will be the tile class that characters can move around in
//the grid is a 2d array of tiles
//properties we will need are: dimensions, images, movability
import java.util.*;

public class Tile{
   
   //coordinates
   private float x, y;
   private float w, h;
   private int i, j;
   
   //color
   private int c = color (63, 191, 95);
   //private color tcolor = #FFFFFF;
   private PImage tr;
   
   //states
   private boolean current;
   private boolean occupied = false;
   private boolean linked = false;
   private Character currentChar = null;
   private boolean currentMove = false;
   //private boolean action = false;
   
   //special
   private boolean treasure = false;
   private int trans = -1;
   
   //terrain
   private boolean mountain = false;
   private boolean water = false;
   private boolean bridge = false;
   
   //constructor
   public Tile (float x, float y, float w, float h, int i, int j) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.i = i;
      this.j = j;
   }
   
   //get coordinates
   public float getX() {
      return x + (w/2);
   }
   public float getY() {
      return y + (h/2);
   }
   public int getI() {
     return i;
   }
   public int getJ() {
     return j;
   }
   
   //states
     //current
   public boolean getCurrent() {
      return current;
   }
   public Character getChar(){
      return currentChar; 
   }
   public void setChar(Character c){
      currentChar = c; 
   }
   public boolean isHover(){
      return (((mouseX >= x) && (mouseX <= x+w)) && ((mouseY >= y) && (mouseY <= y+h)));
   }
     //occupied
   public boolean occupied() {
     return occupied;
   }
   public void occupy() {
      occupied = true;
   }
   public void deoccupy() {
     occupied = false;
     currentChar = null;
     currentMove = false;
   }
   public void currently() {
     currentMove = true;
   }
   public void notCurrently() {
     currentMove = false;
   }
   public void linkify() {
     linked = true;
   }
   public void delinkify() {
     linked = false;
   }
   public boolean getLinked() {
     return linked;
   }
   /*public void action() {
     action = true;
   }
   public void deaction() {
     action = false;
   }*/
   
   //special
   public void treasure() {
     treasure = true;
   }
   public boolean prize() {
     return treasure;
   }
   public void trans(int n) {
     trans = n;
   }
   public int getTrans() {
     return trans;
   }
   
   //terrain
   public void mountain() {
     mountain = true;
   }
   public void water() {
     water = true;
   }
   public void bridge() {
     bridge = true;
   }
   
   
   //color
   public void changeOn() {
     c = color (12, 232, 67);
   }
   public void changeOff() {
     c = color (63, 191, 95);
   }
   /*public void changeColor() {
if (tcolor == #FFFFFF) {
tcolor = #000000;
}
else {
tcolor = #FFFFFF;
}
}*/
   
   
   
   //display
   public void display () {
     if (((mouseX >= x) && (mouseX <= x+w)) && ((mouseY >= y) && (mouseY <= y+h))) {
       this.changeOn();
       current = true;
     }
     /*else if (occupied) {
this.changeOn();
}*/
     /*else if (action) {
       c = color (255, 0, 0);
     }*/
     else if (linked) {
       c = color (36, 242, 180);
       current = false;
     }
     else if (mountain) {
       //triangle shape
     }
     else if (water) {
     }
     else if (bridge) {
     }
     
     else if (trans != -1) {
       c = 0;
     }
     else if (currentMove) {
       c = color (0, 186, 225);
     }
     else {
       this.changeOff();
       current = false;
     }
     
     stroke (color(32, 135, 58));
     fill (c);
     rect (x, y, w, h);
     if (treasure) {
       tr = loadImage ("treasure.png");
       image(tr, x, y);
     }
   }
   
   //toString
   public String toString() {
     return "("+i+", "+j+")";
   }
  
   /*public void display () {
fill (tcolor);
rect (x, y, w, h);
}*/
   
}
   
  
