Target t;
Arrow [] arrows;
PointEffect [] ps;

int counter=0;
int points=0;
int counterP;
int arrowSpeed=1;
int arrowsCount=10;
int targetSpeed=5;
boolean launched = false;

void setup()
{
  size(600,600);
  t = new Target(300, 350, targetSpeed, 0, 0, 0, 75);
  arrows = new Arrow[arrowsCount];
  ps = new PointEffect[arrowsCount];
}

void createBackground()
{
  rectMode(CORNERS);
  fill(255);
  rect(50,200,60,400,25);
  rect(540,200,550,400,25);
  rect(50,200,550,210,25);
}


void draw()
{
  background(255);
  createBackground();
  t.move();
  t.draw();
  if(launched==true)
  {
    fill(0,0,255);
    ellipse(width/2, 450, 30, 30);
  }
  for( int i=0; i<counter; i++)
  {
    if(arrows[i]!=null)
    {
      arrows[i].checkIfHit();
      if(!arrows[i].hit)
      {
        arrows[i].move();
      }
      if(arrows[i].hit)
      {
        ps[counterP]= new PointEffect(arrows[i].mX, arrows[i].mY, arrows[i].score);
        counterP+=1;
      }
      arrows[i].draw();
      arrows[i].delete(i);
    }
  }
  
  for( int j=0; j<counterP; j++)
  {
    if(ps[j]!=null)
    {
      ps[j].move();
      ps[j].draw();
      ps[j].delete(j);
    }
  }
  fill(0);
  textAlign(CENTER);
  textSize(15);
  text("Score: "+points,width/2, 75);
  text("Arrows Left: "+(arrows.length-counter),width/2,100);
}

void mousePressed()
{
  if(counter<arrows.length)
  {
    arrows[counter]= new Arrow(width/2, 450, 0, -9.187, 0, 0.3, arrowSpeed, 50);
    counter+=1;
  }  
}
