class Engel { 
  int type; // 1-ground 2-pipe 3-geçit
  float x, y, w, h;

  Engel (float x, float y, float w, float h, int type) {  
    this.type=type;
    this.x=x;
    this.y=y;
    this.h=h;
    this.w=w;
  }

  void engelCiz() {
    if (type==1) {
      for (int i=0; i< (w/16); i++) {
        if ((x+(16*i))-sinir<=width || (x+(16*i))-sinir+w>=sinir) {
          image(ground, (x+(16*i))-sinir, y);
          for (int j=0; j< (h/16)-1; j++)
            image(ground2, (x+(16*i))-sinir, y+(16*(j+1)));
        }
      }
    } else if (type==2 || type==3) {
      for (int i=0; i< (w/32); i++) { 
        if ((x+(32*i))-sinir<=width || (x+(32*i))-sinir+w>=sinir) {     
          for (int j=0; j< (h/48); j++) {
            if (h>=(j+2)*48)
              image(pipe, (x+(32*i))-sinir+1, y+(48*(j+1)));
            else
              image(pipe, (x+(32*i))-sinir+1, y+(h-48));
          }
          image(pipe2, (x+(32*i))-sinir, y);
          if (type==3)
            image(pipe3, (x+(32*i))-sinir, y+h-16);
        }
      }
    }
    // diğer typelar
  }
} 