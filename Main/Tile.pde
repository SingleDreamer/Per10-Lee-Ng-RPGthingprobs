//this will be the tile class that characters can move around in
//the grid is a 2d array of tiles
//properties we will need are: dimensions, images, movability
import java.util.*;

public class Tile{
   
   //coordinates
   private float x, y;
   private float w, h;
   
   //color
   private int c = 255;
   //private color tcolor = #FFFFFF;
   
   //states
   private boolean current;
   private boolean occupied = false;
   
   //constructor
   public Tile (float x, float y, float w, float h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
   }
   
   //get coordinates
   public float getX() {
      return x + (w/2);
   }
   public float getY() {
      return y + (h/2);
   }
   
   //states
     //current
   public boolean getCurrent() {
      return current;
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
   }
   
   //color
   public void changeOn() {
     c = 0;
   }
   public void changeOff() {
     c = 255;
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
     else {
       this.changeOff();
       current = false;
     }
     stroke (0);
     fill (c);
     rect (x, y, w, h);
   }
   /*public void display () {
fill (tcolor);
rect (x, y, w, h);
}*/
   
}
   
  