import java.util.*;
public class Tile{
   //this will be the tile class that characters can move around in
   //the grid is a 2d array of tiles
   //properties we will need are: dimensions, images, movability 
   
   private float x, y;
   private float w, h;
   private int c = 255;
   //private color tcolor = #FFFFFF;
   
   private boolean occupied;
   
   public Tile (float x, float y, float w, float h) {
      this.x = x;
      this.y = y; 
      this.w = w;
      this.h = h;
   }
   
   public float getX() {
      return x;
   }
   
   public float getY() {
      return y;
   }
   
   public void occupy() {
      occupied = !(occupied);
   }
   
   public void changeOn() {
     c = 0;
   }
   
   public void changeOff() {
     c = 255;
   }
   
   public void display () {
     if ((mouseX >= x) && (mouseY >= y)) {
        this.changeOn();
     }
     else {
       this.changeOff();
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
   
 
      
   
   
   

