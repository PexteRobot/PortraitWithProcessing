PImage img;
int location;
 
int p = 8; //порядок кривой
int lx = 4, ly = 4; //определяем значения, дающие направление,
//в котором должна рисоваться кривая
int i;

//Графический курсор устанавливаем в начальную точку
int X = 50, Y = 50;

// Функция DrawPart рисует линию из точки (X,Y) к новой точке и сохраняет
//   координаты точки в переменных X и Y.
private void drawPart(int lx, int ly)
{
      
  //line(X, Y, X + lx, Y + ly);
  // Папа, тут работаешь со своими точками (pX, pY)
  int pX = X;
  int pY = Y;  
  while ((pX != X + lx) || (pY != Y + ly))
  {
    // Папа, вот твоя точка (pX, pY)
    color c = img.get(pX,pY);
    float b = brightness(c);
    b = map(b, 0, 255, 3, 0);
    stroke(0); //draw black pixel
    strokeWeight(b);
    
    point(pX, pY);
    
    if (ly == 0) 
    {
      if (lx > 0)
        pX++;
      else
        pX--;
    }
    else
    {
      if (ly > 0)
        pY++;
      else
        pY--;
    }
  } 
  X = X + lx;
  Y = Y + ly;
}
   
//  Кривую Гильберта можно получить путем
//  соединения элементов а,b,с и d.
//  Каждый элемент строит
//  соответствующая функция.
   
// Рекурсивно берем четыре маленькие кривые Гильберта и соединяем их линиями.
void a(int i)
{
  if (i > 0)
  {
    d(i - 1);
    //От последней точки проводится вправо отрезок длиной 5 пикселей
    drawPart(+lx, 0);
    a(i - 1);
    //От последней точки (на нее указывает графический курсор) проводится вниз 
    //отрезок длиной 5 пикселей
    drawPart(0, ly);
    a(i - 1);
    //От последней точки проводится влево отрезок длиной 5 пикселей
    drawPart(-lx, 0);
    c(i - 1);
  }
}
 
void b(int i)
{
    if (i > 0)
    {
        c(i - 1);
        //От последней точки проводится влево отрезок длиной 5 пикселей
        drawPart(-lx, 0);
        b(i - 1);
        //От последней точки проводится вверх отрезок длиной 5 пикселей
        drawPart(0, -ly);
        b(i - 1);
        //От последней точки проводится вправо отрезок длиной 5 пикселей  
        drawPart(lx, 0);
        d(i - 1);
    }
}
 
void c(int i)
{
    if (i > 0)
    {
 
        b(i - 1);
        //От последней точки проводится вверх отрезок длиной 5 пикселей  
        drawPart(0, -ly);
        c(i - 1);
        //От последней точки проводится влево отрезок длиной 5 пикселей  
        drawPart(-lx, 0);
        c(i - 1);
        //От последней точки проводится вниз отрезок длиной 5 пикселей  
        drawPart(0, ly);
        a(i - 1);
    }
}
 
void d(int i)
{
    if (i > 0)
    {
        a(i - 1);
        //От последней точки проводится вниз отрезок длиной 5 пикселей  
        drawPart(0, ly);
        d(i - 1);
        //От последней точки проводится вправо отрезок длиной 5 пикселей  
        drawPart(lx, 0);
        d(i - 1);
        //От последней точки проводится вверх отрезок длиной 5 пикселей  
        drawPart(0, -ly);
        b(i - 1);
    }
}

void setup()
{
  size (600, 600);
  background(255);
  img = loadImage("Ag600.png");
}

void draw()
{
     X = 0;
    Y = 0; 
}





void keyPressed() {
  if (key == 's') 
        
    
    //вызываем функцию рисования фрактала
    a(p);
}
      
