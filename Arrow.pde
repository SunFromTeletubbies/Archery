class Arrow
{
  float mX, mY;
  float mVX, mVY;
  float mAccX, mAccY;
  float mSpeed;
  float mInitR;
  float mR;
  float mAge;
  boolean hit;
  int score;
  
  Arrow(float x, float y, float vX, float vY, float accX, float accY, float speed, float initR)
  {
    mX=x; mY=y;
    mVX=vX; mVY=vY;
    mAccX=accX; mAccY=accY;
    mSpeed=speed;
    mInitR=initR; 
    mR=mInitR;
  }
  
  void move()
  {
    mVX+=mAccX; mVY+=mAccY;
    mX+=mVX; mY+=mVY;
    mAge+=mSpeed;
    //mR-=mR*mAge/600;
    mR=mInitR*10/mAge;
  }
  
  void draw()
  {
    if(!(mAge>47 && mX-mR>t.mX-t.mR && mX+mR<t.mX+t.mR && mY-mR>t.mY-t.mR && mY+mR<t.mY+t.mR))
    {
      //noStroke();
      fill(0,100,255);
      if(mAge>5)
        ellipse(mX,mY-8,mR,mR);
      //stroke(1);
    }
  }
  
  boolean ifOverTarget()
  {
    if(mAge>=47)
    return true;
    else
    return false;
  }
  
  void checkIfHit()
  {
    if(ifOverTarget()&&mAge<=49)
    {
      for(int i=0; i<10; i++)
      {        
      if(dist(t.mX,t.mY,mX,mY)<t.mR/10*(i+1) && dist(t.mX,t.mY,mX,mY)>=t.mR/10*i)
        {
          score=100-10*i;
          points+=score;
          hit=true;
          return;
        }
      }
    }
    hit=false;
  }
  
  void delete(int h)
  {
    if((hit)||mY>height+mR)
    {
      arrows[h]=null;
    }
  }
}    
      
