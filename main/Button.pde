public class Button {
 
  String t;
  int x;
  int y;
  int c;
  PFont f;
  
  public Button (String s, int setx, int sety) {
    t = s;
    x = setx;
    y = sety;
    c = 255;
    f = createFont("Arial",16,false);
  }
  
  public void display (){
    textFont(f,16);
    fill(0);
    text (t, x, y);
    fill(c);
    rect (x, y, 50, 20);
  }
  
  public void highlight () {
  }
  
  
}
