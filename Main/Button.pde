public class Button {
 
  int x;
  int y;
  PFont f;
  boolean locked;
  boolean pressed;
  PImage img;
  int w;
  int h;
  boolean active;

  public Button (PImage image, int setx, int sety){
    x = setx;
    y = sety;
    locked = false;
    img = image;
    w = 60;
    h = 20;
    active = true;
  }
  
  public Button (PImage image, int setx, int sety, int wid, int hei){
    x = setx;
    y = sety;
   locked = false;
    img = image;
    w = wid;
   h = hei; 
   active = false;
  }
  
  public void display (){
    image(img, x, y);
  }
  
  public void highlight () {
  }
  
   public boolean pressedOn() {
    if (mousePressed){
      if (((mouseX >= x) && (mouseX <= x+w)) && ((mouseY >= y) && (mouseY <= y + h))) {
        return true;
      }
    }
    return false;
  }
  
  public boolean overButton() {
      return (((mouseX >= x) && (mouseX <= x+w)) && ((mouseY >= y) && (mouseY <= y + h)));
  }
  
  
}
