class Kapi {
  float x, y, hedefx, hedefy;
  int w, h, cnt;
  Kapi(float x, float y, int w, int h, float hedefx, float hedefy) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.hedefx=hedefx;
    this.hedefy=hedefy; 
    cnt=0;
  }

  void kapiCiz() {
    image(gate, x-sinir, y-h);
    fill(240);
    rect( x-sinir+1, y-h-20, 61, 20 );
    fill(0);
    textSize(9);
    text(" IŞINLANMA ", x-sinir+5, y-h-11);
    text("( 3500 $ )", x-sinir+10, y-h-2);
  }

  void isinla(Mario mar) {
    mar.x = mar.x + (hedefx-x);
    mar.y = mar.y + (hedefy-y);
    float temp1=x;
    float temp2=y;
    x=hedefx;
    y=hedefy;
    hedefx=temp1;
    hedefy=temp2;
  }
}