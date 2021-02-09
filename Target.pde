class Target
{
  float mX, mY;
  float mVX, mVY;
  float mAccX, mAccY;
  float mR;
  
  Target(float x, float y, float vX, float vY, float accX, float accY, float r)
  {
    mX=x; mY=y;
    mVX=vX; mVY=vY;
    mAccX=accX; mAccY=accY;
    mR=r; 
  }
  
  void move()
  {
    mVX+=mAccX; mVY+=mAccY;
    mX+=mVX; mY+=mVY;
    if(mX>=550-mR || mX<=50+mR)
    {
      mVX=-mVX;
    }
  }
  
  void draw()
  {
    rectMode(CORNERS);
    ellipseMode(RADIUS);
    rect(mX-0.65*mR-5, 200, mX-0.65*mR+5,mY-0.65*mR);
    rect(mX+0.65*mR-5, 200, mX+0.65*mR+5,mY-0.65*mR);
    for(int i=10; i>0; i--)
    {
      if(i%2==0)
      {
        fill(255,0,0);
      }
      else
      {
        fill(255);
      }
      ellipse(mX, mY, mR/10*i, mR/10*i);
    }
  }
}
