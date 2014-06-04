public class Button {
 
  int x;
  int y;
  PFont f;
  boolean locked;
  boolean pressed;
  PImage img;

  public Button (PImage image, int setx, int sety){
    x = setx;
    y = sety;
    locked = false;
    img = image;
  }
  
  public void display (){
    image(img, x, y);
  }
  
  public void highlight () {
  }
  
   public boolean pressedOn() {
    if (mousePressed){
      if (((mouseX >= x) && (mouseX <= x+50)) && ((mouseY >= y) && (mouseY <= y + 20))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean overButton() {
      return (((mouseX >= x) && (mouseX <= x+60)) && ((mouseY >= y) && (mouseY <= y + 20)));
  }
  
  
}
