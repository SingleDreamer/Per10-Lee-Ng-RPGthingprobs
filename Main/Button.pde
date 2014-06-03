public class Button {
 
  String t;
  int x;
  int y;
  int c;
  PFont f;
  boolean locked;
  boolean pressed;
  
  public Button (String s, int setx, int sety) {
    t = s;
    x = setx;
    y = sety;
    c = color(113, 234, 163);
    locked = false;
    //f = createFont("Arial",16,false);
  }
  
  public void display (PFont f){
    rect (x, y, 60, 20);
    textFont(f,12);
    fill(0);
    text (t, x+7, y+15);
    fill(c);
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
