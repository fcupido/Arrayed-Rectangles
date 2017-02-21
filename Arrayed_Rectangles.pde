rectangle [] rects;
int number = 0;
boolean drawing = false;

void setup()
{
  size(800, 800);
  rects = new rectangle [1];
  stroke(255, 0, 0);
  strokeWeight(5); 
  background(0);
}
void draw()
{
  background(0);
  if (rects.length == 1)
  {
    fill(255);
    textSize(15);
    text("Click and dragg to draw rectangles", width / 3, height /2);
  }
  if (mousePressed && !drawing)
  {
    rects = myExpand();
    rects[number] = new rectangle();
    drawing = true;
  }
  if (drawing && mousePressed)
  {
    rects[number].len = -rects[number].x + mouseX;
    rects[number].wid = -rects[number].y + mouseY;
  }
  if (drawing && !mousePressed)
  {
    number++;
    drawing = false;
  }
  for (int i = 0; i < rects.length-1; i++)
  {
    line(rects[i].x, rects[i].y, rects[i].x +rects[i].len, rects[i].y);
    line(rects[i].x, rects[i].y, rects[i].x, rects[i].y + rects[i].wid);
    line(rects[i].x, rects[i].y + rects[i].wid, rects[i].x +rects[i].len, rects[i].y +rects[i].wid);
    line(rects[i].x + rects[i].len, rects[i].y, rects[i].x +rects[i].len, rects[i].y +rects[i].wid);
  }
}

rectangle [] myExpand()
{
  rectangle [] temp = new rectangle [rects.length + 1];
  for (int i = 0; i < rects.length; i++)
  {
    temp[i] = new rectangle(5);
    temp [i] = rects [i];
  }
  return temp;
}
class rectangle
{
  int x;
  int y;
  int len;
  int wid;

  rectangle ()
  {
    x = mouseX;
    y = mouseY;
    len = 2;
    wid = 2;
  }
  rectangle (int x)
  {
    x = 0;
    y = 0;
    len = 0;
    wid = 0;
  }
}