public class Button {
 
  String t;
  int x;
  int y;
  int c;
  PFont f;
  
  public Button (/*String s,*/ int setx, int sety) {
    //t = s;
    x = setx;
    y = sety;
    c = color(113, 234, 163);
    //f = createFont("Arial",16,false);
  }
  
  public void display (){
    //textFont(f,16);
    //fill(0);
    //text (t, x, y);
    fill(c);
    rect (x, y, 50, 20);
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
  
  
}
