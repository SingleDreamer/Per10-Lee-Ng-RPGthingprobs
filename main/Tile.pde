public class Tile{
   //this will be the tile class that characters can move around in
   //the grid is a 2d array of tiles
   //properties we will need are: dimensions, images, movability 
   
   private float x, y;
   private float w, h;
   private int color = 255;
   
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
   
   public void changeColor() {
      if (color = 255) {
         color = 0;
      }
      else {
         color = 255;
      }
   }
   
   public void display () {
      fill (color);
      rect (x, y, w, h);
   }
      
   
   
   
}
