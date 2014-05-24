import java.util.*;

public class Tile{
   //this will be the tile class that characters can move around in
   //the grid is a 2d array of tiles
   //properties we will need are: dimensions, images, movability 
   
   private float x, y;
   private float w, h;
   private int c = 255;
   //private color tcolor = #FFFFFF;
   private boolean current;
   
   private boolean occupied = false;
   
   public Tile (float x, float y, float w, float h) {
      this.x = x;
      this.y = y; 
      this.w = w;
      this.h = h;
   }
   
   public float getX() {
      return x + (w/2);
   }
   
   public float getY() {
      return y + (h/2);
   }
   
   public boolean getCurrent() {
      return current;
   }
   
   public void occupy() {
      occupied = true;
   }
   
   public void deoccupy() {
     occupied = false;
   }
   
   public boolean occupied() {
     return occupied;
   }
   
   public void changeOn() {
     c = 0;
   }
   
   public void changeOff() {
     c = 255;
   }
   
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
   
}
   /*public void changeColor() {
      if (tcolor == #FFFFFF) {
         tcolor = #000000;
      }
      else {
         tcolor = #FFFFFF;
      }
   }
   
   public void display () {
      fill (tcolor);
      rect (x, y, w, h);
   }*/
   
 
      
   
   
   

