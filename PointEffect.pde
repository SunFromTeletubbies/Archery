class PointEffect
{
  float mX, mY;
  float mVY=-1;
  int mScore;
  int mAge;
  
  PointEffect(float x, float y, int score)
  {
    mX=x; mY=y;
    mScore=score;
  }
  
  void move()
  {
    mY+=mVY;
    mAge+=1;
  }
  
  void draw()
  {
    textSize(20);
    fill(0,1000-25*mAge);
    text("+"+mScore,mX,mY);
  }
  
  void delete(int h)
  {
    if(mAge>50)
    {
      ps[h]=null;
    }
  }
}
