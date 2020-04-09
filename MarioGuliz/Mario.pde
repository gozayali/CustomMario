class Mario {
  float x, y, xsp, ysp;
  int comelik; // 0-ayakta 13-comeliyo
  int yon; // 0-sol 1-sag

  Mario(float x, float y, float xsp, float ysp) {
    this.x=x;
    this.y=y;
    this.xsp=xsp;
    this.ysp=ysp; 
    this.yon=1;
    this.comelik=0;
  }

  public void marioCiz() {
    if (frameCount%frm <(frm/4))        
      image(temp1, x-sinir, y+comelik);
    else if (frameCount%frm <(frm/2))
      image(temp2, x-sinir, y+comelik); 
    else if (frameCount%frm < (frm*3/4))
      image(temp3, x-sinir, y+comelik);
    else 
      image(temp2, x-sinir, y+comelik);
  }

  public void moveMario() {
    x+=xsp;
    y-=ysp;
    if (hizlan) {
      stime++; 
      frm=16;
    } else {
      stime=0; 
      frm=32;
    }

    if (zipla){      
    jumptime++; 
  }

    else {
      jumptime=0;
      atladi=false;
    }

    if (!comel && !yukaribak) {
      comelik=0;
      if (solyon) {
        yon=0;
        if (hizlan && xsp>-2.3f)
          xsp-=0.08f;
        if (!hizlan && xsp>-1.3f)
          xsp-=0.05f;
        if (!hizlan && xsp<-1.37f)
          xsp+=0.05f;

        temp1=marioleft;       
        temp2=mariowalkleft;
        temp3=mariowalkleft2;         
        if (xsp <= -2.3f && stime > 200) {
          temp1=fastleft;       
          temp2=fastleft2;
          temp3=fastleft3;
        }  
        if (xsp > 0 && y == g) {
          temp1=RtoL;       
          temp2=RtoL;
          temp3=RtoL;
        }
      }

      if (sagyon) {
        yon=1;
        if (hizlan && xsp<2.3f)
          xsp+=0.08f;
        if (!hizlan && xsp<1.3f)
          xsp+=0.05f;
        if (!hizlan && xsp>1.37f)
          xsp-=0.05f;

        temp1=marioright;       
        temp2=mariowalkright;
        temp3=mariowalkright2;         
        if (xsp >= 2.3f && stime > 200) {
          temp1=fastright;       
          temp2=fastright2;
          temp3=fastright3;
        }  
        if (xsp < 0 && y == g) {
          temp1=LtoR;       
          temp2=LtoR;
          temp3=LtoR;
        }
      }

      if ((solyon && sagyon) || (!solyon && !sagyon))
        if (yon==1) {
          temp1=marioright;       
          temp2=mariowalkright;
          temp3=mariowalkright2;
        } else {
          temp1=marioleft;       
          temp2=mariowalkleft;
          temp3=mariowalkleft2;
        }
    }

    if ((solyon && sagyon) || (!solyon && !sagyon) || yukaribak || comel ) {  
      if (xsp <= 0.02f && xsp >= -0.02f ) xsp=0;
      if (xsp>0) xsp-=0.02f;
      if (xsp<0) xsp+=0.02f;
    }

    if (xsp <0.1f && xsp > -0.1f )
      if (yon==1) {
        temp1=marioright;       
        temp2=marioright;
        temp3=marioright;
      } else {
        temp1=marioleft;       
        temp2=marioleft;
        temp3=marioleft;
      }

    if (atlayabilir && zipla && !atladi) {
      ziplama.play(0);
      if (hizlan) ysp = 5;
      else ysp = 4;
      atlayabilir=false;
      atladi=true;
      baszip=g;
    }

    if (jumptime > 10) ysp-=0.08f;
    if (jumptime > 0 && jumptime <= 10 ) ysp-=0.12f; 
    if (jumptime == 0) ysp-=0.3f;
    if (ysp < 0 && ysp >- 3  ) ysp-=0.1f; 

    setGround();
    if (ysp < 0 && m.y-ysp > g) {
      ysp=0;
      m.y=g;
      baszip=g;
      atlayabilir=true;
      if (y==height-28) {      
        died=true;
        ekranflag=false;
      }
    }

    if (ysp > 0)
      if (yon==1) {
        temp1=rightjump;       
        temp2=rightjump;
        temp3=rightjump;
      } else {
        temp1=leftjump;       
        temp2=leftjump;
        temp3=leftjump;
      }

    if (ysp < 0)
      if (yon==1) {
        temp1=rightfall;       
        temp2=rightfall;
        temp3=rightfall;
      } else {
        temp1=leftfall;       
        temp2=leftfall;
        temp3=leftfall;
      }

    if (ysp != 0) {
      if (yon == 1 && xsp > 2 && stime > 200) {
        temp1=flyright;       
        temp2=flyright;
        temp3=flyright;
      }
      if (yon == 0 && xsp < -2 && stime > 200) {
        temp1=flyleft;       
        temp2=flyleft;
        temp3=flyleft;
      }
    }

    if (yukaribak) {
      comelik=0;
      if (yon==1) {
        temp1=rightup;       
        temp2=rightup;
        temp3=rightup;
      } else {
        temp1=leftup;       
        temp2=leftup;
        temp3=leftup;
      }
    }

    if (comel) {
      comelik=13;
      if (yon==1) {
        temp1=duckright;       
        temp2=duckright;
        temp3=duckright;
      } else {
        temp1=duckleft;       
        temp2=duckleft;
        temp3=duckleft;
      }
      if (dip!=0){
        m.y=dip;
        boru.play(0);
      }
    }
  }
}