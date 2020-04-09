class Canavar {
  float x, y, xsp, ysp, l, r, t, b; 
  int w, h, type ; //1-yer 2-zıplayan 3-ucan 4-balık

  Canavar(float x, float y, int w, int h, float xsp, float ysp, float l, float r, float t, float b, int type) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.xsp=xsp;
    this.ysp=ysp; 
    this.l=l;
    this.r=r;
    this.t=t;
    this.b=b;
    this.type=type;
  }

  void canavarCiz(float odak) {
    if (type==0) {
      image(coin3, x-sinir, y-h);
    } else if (type==1) {
      image(mons1, x-sinir, y-h);
    } else if (type==2) {
      if (xsp<=0)
        image(mons2, x-sinir, y-h);
      else
        image(mons2r, x-sinir, y-h);
    } else if (type==3) {
      image(mons3, x-sinir, y-h);
    } else if (type==4) {
      if (x>=odak)
        image(mons4, x-sinir, y-h);
      else
        image(mons4r, x-sinir, y-h);
    }
  }

  void moveCanavar() {
    if (r==0 && l==0 && t==0 && b==0) 
      if ( x<sinir+42 &&  y< 42) {
        x=-100;
        xsp=0;
      } else {        
        xsp=(x-sinir-10)/-10;
        ysp=(y-10)/-10;
      } else {
      if ((x+w>=r && xsp>0) || (x<=l && xsp<0 ))
        xsp*=-1;
      if ((y>=b && ysp>0) || (y<=t && ysp<0 ))
        ysp*=-1;
    }
    x+=xsp;
    y+=ysp;
  }
}