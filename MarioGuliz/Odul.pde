class Odul { 
  int type; // 1-coin 2-para 3-kalp
  float x, y, w, h;

  Odul(float x, float y, float w, float h, int type) {  
    this.type=type;
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
  }

  void odulCiz() {
    if (type==1) {
      image(coin, x-sinir, y);
    } else if (type==2) {
      image(money, x-sinir, y);
    } else if (type==3) {
      image(kalp, x-sinir, y);
    } else if (type==4){
      image(davsan, x-sinir, y);
    }
  }
} 