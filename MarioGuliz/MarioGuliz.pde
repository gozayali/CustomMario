import ddf.minim.*;
AudioPlayer bitis, gameover, die, oldurme, boru, bonus, ziplama, coins, basses, isin, tema;
PImage bg, mons1, mons2, mons2r, mons3, mons4, mons4r, pipe, pipe2, pipe3, ground, ground2, gate;
PImage coin, coin3, money, money_tot, kalp, kalp_tot, arrow, davsan, davsanl, davsanr, guliz;
PImage flyright, flyleft, fastleft, fastleft2;
PImage fastleft3, fastright, fastright2, fastright3;
PImage rightup, leftup, leftjump, rightjump, leftfall, rightfall;
PImage duckleft, duckright, marioleft, mariowalkleft;
PImage mariowalkleft2, marioright, mariowalkright, mariowalkright2;
PImage LtoR, RtoL;
PImage temp1, temp2, temp3;
int para, can, jumptime, stime, frm, engelsize=65, odulsize=22, cnvsize=26, tblsize=5, diedEkran, count, sescnt, btscnt;
float g, sinir, dip, grnd=498, baszip, dest, yer, soruy, oly, pmy, basy;
boolean basla, soruflag, ekranflag, died, zipla, sagyon, solyon, comel, yukaribak, hizlan, atlayabilir, atladi;
String message;
long zaman1,zaman2;
long paraMessageZaman;

Engel []engeller;
Odul []oduller;
Canavar []cnv;
Tabela []tbl;
Kapi k; 
Mario m; 

void haritaDoldur() {

  // 0-1000 arasi
  engeller[0]= new Engel(0, grnd, 800, 64, 1);
  engeller[1]= new Engel(300, grnd-220, 160, 16, 1);
  engeller[2]= new Engel(500, grnd-50, 160, 64, 1);
  engeller[3]= new Engel(850, grnd-350, 80, 16, 1);
  engeller[4]= new Engel(950, grnd-240, 80, 32, 1);

  engeller[5]= new Engel(320, grnd-270, 96, 50, 2);  
  engeller[6]= new Engel(660, grnd-160, 64, 160, 2);

  oduller[0]= new Odul(350, grnd-350, 32, 32, 1);
  oduller[1]= new Odul(740, grnd-50, 32, 32, 1);
  oduller[2]= new Odul(875, grnd-390, 32, 32, 2);

  cnv[0]= new Canavar(400, grnd, 28, 28, 1, 0, 200, 500, 0, 0, 1);
  cnv[1]= new Canavar(600, grnd-50, 28, 28, 1.5, 0, 500, 660, 0, 0, 1);

  tbl[0]= new Tabela(100, grnd, "2000 m");

  // 1000-2000 arasi
  engeller[7]= new Engel(1000, grnd, 400, 64, 1); 
  engeller[8]= new Engel(1300, grnd-280, 64, 310, 1);  
  engeller[9]= new Engel(1450, grnd, 80, 64, 1);  
  engeller[10]= new Engel(1610, grnd-20, 80, 84, 1);
  engeller[11]= new Engel(1770, grnd, 80, 64, 1);
  engeller[12]= new Engel(1900, grnd, 160, 64, 1);
  engeller[13]= new Engel(1420, grnd-120, 640, 32, 1);  

  engeller[14]= new Engel(1080, grnd-70, 32, 70, 2); 
  engeller[15]= new Engel(1130, grnd-170, 32, 170, 2);  
  engeller[16]= new Engel(1180, grnd-70, 32, 70, 2);
  engeller[17]= new Engel(1936, grnd-190, 32, 70, 2);
  engeller[18]= new Engel(1968, grnd-260, 32, 140, 2);

  oduller[3]= new Odul(1635, grnd-80, 32, 32, 1);
  oduller[4]= new Odul(1800, grnd-450, 32, 32, 2);
  oduller[5]= new Odul(1950, grnd-40, 32, 32, 3);


  cnv[2]= new Canavar(1210, grnd, 28, 28, 1, 0, 1210, 1300, 0, 0, 1);
  cnv[3]= new Canavar(1210, grnd, 28, 28, 0.5, 0, 1210, 1300, 0, 0, 1);
  cnv[4]= new Canavar(1510, grnd-120, 28, 28, 1, 0, 1420, 1940, 0, 0, 1);
  cnv[5]= new Canavar(1510, grnd-120, 28, 28, 1.7, 0, 1420, 1940, 0, 0, 1);
  cnv[6]= new Canavar(1510, grnd-120, 34, 42, 1.2, 0.7, 1420, 1940, grnd-180, grnd-120, 2);
  cnv[7]= new Canavar(1600, 80, 46, 46, 1.2, 1.7, 1600, 1980, 50, 200, 3);   


  // 2000-3000 arasi  
  engeller[19]= new Engel(2000, grnd-150, 64, 200, 1);
  engeller[20]= new Engel(2032, -100, 128, 300, 1);
  engeller[21]= new Engel(2240, grnd-150, 160, 32, 1);
  engeller[22]= new Engel(2500, grnd-280, 160, 64, 1);  
  engeller[23]= new Engel(2680, grnd, 640, 64, 1);
  engeller[24]= new Engel(2692, grnd-280, 128, 64, 1); 

  engeller[25]= new Engel(2000, grnd-340, 32, 140, 3);
  engeller[26]= new Engel(2660, grnd-280, 32, 64, 3);

  oduller[6]= new Odul(2150, grnd-270, 32, 32, 1);
  oduller[7]= new Odul(2200, grnd-240, 32, 32, 1);
  oduller[8]= new Odul(2240, grnd-200, 32, 32, 1);
  oduller[9]= new Odul(2560, grnd-400, 32, 32, 2);
  oduller[10]= new Odul(2660, grnd-210, 32, 32, 3);

  cnv[8]= new Canavar(2080, grnd-200, 27, 32, 0, 3, 0, 0, grnd-250, height+50, 4);
  cnv[9]= new Canavar(2120, grnd-100, 27, 32, 0, 3, 0, 0, grnd-250, height+50, 4);
  cnv[10]= new Canavar(2160, grnd-200, 27, 32, 0, -3, 0, 0, grnd-250, height+50, 4);
  cnv[11]= new Canavar(2200, grnd-100, 27, 32, 0, -3, 0, 0, grnd-250, height+50, 4);
  cnv[12]= new Canavar(2420, height/2+130, 27, 32, 0, -4, 0, 0, 200, height+60, 4);
  cnv[13]= new Canavar(2460, height/2+130, 27, 32, 0, 4, 0, 0, 200, height+60, 4);
  cnv[14]= new Canavar(2800, grnd, 46, 46, 2.2, 1.7, 2670, 3000, grnd-60, grnd, 3);
  cnv[15]= new Canavar(2800, grnd-120, 46, 46, 2.2, 1.7, 2740, 3060, grnd-120, grnd-60, 3);   
  cnv[16]= new Canavar(2800, grnd-120, 46, 46, 2.2, 1.7, 2800, 3130, grnd-180, grnd-120, 3); 
  cnv[17]= new Canavar(2900, grnd-180, 46, 46, 2.2, 1.7, 2860, 3190, grnd-240, grnd-180, 3);  

  tbl[1]= new Tabela(2340, grnd-150, "1300 m");
  //3000-4000 arasi
  engeller[27]= new Engel(3640, grnd, 320, 64, 1);
  engeller[28]= new Engel(3700, grnd-120, 128, 32, 1);
  engeller[29]= new Engel(3900, grnd-180, 512, 32, 1);

  engeller[30]= new Engel(3000, grnd-60, 64, 60, 2);
  engeller[31]= new Engel(3064, grnd-120, 64, 120, 2);  
  engeller[32]= new Engel(3128, grnd-180, 64, 180, 2);
  engeller[33]= new Engel(3192, grnd-240, 64, 240, 2);
  engeller[34]= new Engel(3256, grnd-300, 64, 300, 2);
  engeller[35]= new Engel(3900, grnd-230, 32, 50, 2);

  oduller[11]= new Odul(3350, grnd-400, 32, 32, 1);
  oduller[12]= new Odul(3420, grnd-440, 32, 32, 1);
  oduller[13]= new Odul(3490, grnd-380, 32, 32, 3);
  oduller[14]= new Odul(3560, grnd-300, 32, 32, 1);
  oduller[15]= new Odul(3600, grnd-100, 32, 32, 1);

  cnv[18]= new Canavar(3650, grnd, 28, 28, 1.5, 0, 3650, 3940, 0, 0, 1);
  cnv[19]= new Canavar(3930, grnd-180, 34, 42, 1.5, 1.9, 3930, 4380, grnd-200, grnd-180, 2);
  cnv[20]= new Canavar(4380, grnd-180, 34, 42, 1.5, 1.9, 3930, 4380, grnd-200, grnd-180, 2);

  tbl[2]= new Tabela(3780, grnd, "850 m");

  //4000-5000 arasi  
  engeller[36]= new Engel(4000, grnd-350, 320, 16, 1); 
  engeller[37]= new Engel(4100, grnd, 64, 64, 1); 
  engeller[38]= new Engel(4304, grnd, 1200, 64, 1); 
  engeller[39]= new Engel(4380, grnd-230, 32, 50, 2);
  engeller[40]= new Engel(4600, grnd-100, 32, 100, 2); 
  engeller[41]= new Engel(4632, grnd-200, 32, 200, 2); 
  engeller[42]= new Engel(4664, grnd-100, 32, 100, 2);  

  //A
  engeller[43]= new Engel(4768, grnd-300, 32, 120, 1); 
  engeller[44]= new Engel(4800, grnd-316, 48, 32, 1);
  engeller[45]= new Engel(4800, grnd-250, 48, 32, 1); 
  engeller[46]= new Engel(4848, grnd-300, 32, 120, 1);
  //<3
  engeller[47]= new Engel(4920, grnd-300, 16, 40, 1); 
  engeller[48]= new Engel(4936, grnd-320, 16, 80, 1);
  engeller[49]= new Engel(4952, grnd-330, 16, 100, 1); 
  engeller[50]= new Engel(4968, grnd-320, 16, 110, 1); 
  engeller[51]= new Engel(4984, grnd-305, 16, 100, 1); 
  engeller[52]= new Engel(5000, grnd-320, 16, 110, 1); 
  engeller[53]= new Engel(5016, grnd-330, 16, 100, 1);  
  engeller[54]= new Engel(5032, grnd-320, 16, 80, 1); 
  engeller[55]= new Engel(5048, grnd-300, 16, 40, 1); 

  //G
  engeller[56]= new Engel(5098, grnd-300, 32, 104, 1); 
  engeller[57]= new Engel(5130, grnd-316, 48, 32, 1); 
  engeller[58]= new Engel(5154, grnd-250, 24, 32, 1);   
  engeller[59]= new Engel(5130, grnd-204, 48, 32, 1); 
  engeller[60]= new Engel(5178, grnd-295, 32, 32, 1); 
  engeller[61]= new Engel(5178, grnd-250, 32, 50, 1); 


  oduller[16]= new Odul(4110, grnd-100, 32, 32, 2);
  oduller[17]= new Odul(4150, grnd-380, 32, 32, 1);
  oduller[18]= new Odul(4200, grnd-380, 32, 32, 1);
  oduller[19]= new Odul(4250, grnd-380, 32, 32, 1);
  oduller[20]= new Odul(4980, grnd-420, 32, 32, 2);

  cnv[21]= new Canavar(4010, grnd-350, 28, 28, 1.2, 0, 4010, 4300, 0, 0, 1);
  cnv[22]= new Canavar(4300, grnd, 28, 28, 1.5, 0, 4300, 4600, 0, 0, 1);

  //5000-6000 arasi 
  engeller[62]= new Engel(5432, grnd, 1200, 64, 1); 
  engeller[63]= new Engel(5400, grnd-600, 32, 700, 2); 
  engeller[64]= new Engel(6620, grnd-200, 32, 300, 2); 

  oduller[21]= new Odul(6500-21, grnd-59, 42, 59, 4);

  cnv[23]= new Canavar(4700, grnd, 34, 42, 1.2, 1, 4700, 5200, grnd-80, grnd, 2);
  cnv[24]= new Canavar(4700, grnd, 34, 42, 1.5, 2, 4700, 5200, grnd-120, grnd, 2);
  cnv[25]= new Canavar(4700, grnd, 34, 42, 1.7, 1.3, 4700, 5200, grnd-50, grnd, 2);

  tbl[3]= new Tabela(5220, grnd, "400 m");  
  tbl[4]= new Tabela(6180, grnd, "100 m");
}

void setup()
{
  size(960, 540);

  para=0; 
  can=2;
  jumptime=0; 
  stime=0; 
  diedEkran=0; 
  count=0;
  g=470; 
  sinir=0; 
  dip=0; 
  baszip=0; 
  soruy=-80; 
  oly=0; 
  pmy=0;
  basy=0;
  sescnt=0; 
  btscnt=0;
  message="";
  zaman1=-2000;
  paraMessageZaman=-2000;
  zaman2=0;

  basla=false; 
  soruflag=false;
  ekranflag=false;
  died=false;
  atlayabilir=true;
  atladi=false;
  zipla = false;
  sagyon = false;
  solyon = false;
  comel = false;
  yukaribak = false;
  hizlan = false;

  k= new Kapi(5340, grnd, 64, 64, 5428, grnd);

  engeller= new Engel[engelsize];
  oduller = new Odul[odulsize];
  cnv= new Canavar[cnvsize];
  tbl= new Tabela[tblsize];
  haritaDoldur();

  marioleft = loadImage("resim/marioleft.png");
  mariowalkleft = loadImage("resim/mariowalkleft.png");
  mariowalkleft2 = loadImage("resim/mariowalkleft2.png");
  marioright = loadImage("resim/marioright.png");
  mariowalkright = loadImage("resim/mariowalkright.png");
  mariowalkright2 = loadImage("resim/mariowalkright2.png");
  LtoR = loadImage("resim/LtoR.png");
  RtoL = loadImage("resim/RtoL.png");
  duckleft = loadImage("resim/duckleft.png");
  duckright = loadImage("resim/duckright.png");
  leftjump = loadImage("resim/leftjump.png");
  rightjump = loadImage("resim/rightjump.png");
  leftfall = loadImage("resim/leftfall.png");
  rightfall = loadImage("resim/rightfall.png");
  rightup = loadImage("resim/rightup.png");
  leftup = loadImage("resim/leftup.png");
  fastleft = loadImage("resim/fastleft.png");
  fastleft2 = loadImage("resim/fastleft2.png");
  fastleft3 = loadImage("resim/fastleft3.png");
  fastright = loadImage("resim/fastright.png");
  fastright2 = loadImage("resim/fastright2.png");
  fastright3 = loadImage("resim/fastright3.png");
  flyright = loadImage("resim/flyright.png");
  flyleft = loadImage("resim/flyleft.png");

  bg = loadImage("resim/bg.png");
  ground = loadImage("resim/ground.png");
  ground2 = loadImage("resim/ground2.png");
  pipe = loadImage("resim/pipe.png");
  pipe2 = loadImage("resim/pipe2.png");
  pipe3 = loadImage("resim/pipe3.png");
  coin = loadImage("resim/coin.png");
  coin3 = loadImage("resim/coin3.png");
  money = loadImage("resim/money.png");
  money_tot = loadImage("resim/money_tot.png");
  kalp = loadImage("resim/kalp.png");
  kalp_tot = loadImage("resim/kalp_tot.png");
  mons1 = loadImage("resim/mons1.png");
  mons2 = loadImage("resim/mons2.png");
  mons2r = loadImage("resim/mons2r.png");
  mons3 = loadImage("resim/mons3.png");
  mons4 = loadImage("resim/mons4.png");
  mons4r = loadImage("resim/mons4r.png");
  gate = loadImage("resim/gate.png");
  arrow = loadImage("resim/arrow.png");
  davsanl = loadImage("resim/davsan.png");
  davsanr = loadImage("resim/davsanr.png");
  guliz= loadImage("resim/guliz.jpg");
  davsan=davsanl;

  bitis= new Minim(this).loadFile("ses/bitis.wav");
  gameover= new Minim(this).loadFile("ses/gameover.wav");
  die= new Minim(this).loadFile("ses/die.wav");
  bonus= new Minim(this).loadFile("ses/bonus.wav");
  ziplama= new Minim(this).loadFile("ses/ziplama.wav");
  oldurme= new Minim(this).loadFile("ses/oldurme.wav");
  boru= new Minim(this).loadFile("ses/pipe.wav");
  coins= new Minim(this).loadFile("ses/coin.wav");
  basses= new Minim(this).loadFile("ses/basses.wav");
  isin= new Minim(this).loadFile("ses/isinlanma.mp3");
  tema= new Minim(this).loadFile("ses/uskudar.mp3");

  m= new Mario(100, 0, 0, 0);

}

void draw()
{
  if (!basla) {
    if ( soruflag || (died && can<0))
      setup();
    girisEkraniCiz();

    if (yukaribak) {
      basla=true;
      zaman2=millis();
      basy=0;
    }
  } else {
    basses.pause(); 
    if (!died) {
      if (sescnt==0) {
        tema.play(0);
        sescnt++;
      }
      if (!tema.isPlaying() && btscnt==0)
        tema.play(2250);
      if (!( m.x>=k.x && m.x+16<=k.x+k.w )) {
        if (m.x<sinir) m.x=sinir;
        if (m.x>sinir+500) sinir=m.x-500;
        if (m.x<sinir+500 && m.x>500) sinir=m.x-500;
      }

      m.moveMario();
      for (int i=0; i<cnvsize; i++)
        cnv[i].moveCanavar();

      background(bg);
      printStaticObj();
      for (int i=0; i<cnvsize; i++)
        cnv[i].canavarCiz(m.x);
      m.marioCiz();
      k.kapiCiz();
      if (m.x+9<oduller[21].x+oduller[21].w/2)
        davsan=davsanl;
      else
        davsan=davsanr;

      if ( millis()- zaman2<3000 ) {
        fill(0);
        rect(330, basy-50, 300, 50);
        fill(220);
        textSize(14);
        String message1="PARALARI TOPLA, LAZIM OLACAK...";
        text(message1, (width-textWidth(message1))/2, basy-30);
        String message2="***  Işınlanma falan.. kıps =P  ***";
        text(message2, (width-textWidth(message2))/2, basy-10);
        if (basy<50)
          basy++;
      }

      if (para>=3500) {
        if ( m.x>=k.x && m.x+16<=k.x+k.w && m.y<=k.y && m.y>=k.y-k.h) {         
          if (yukaribak && k.cnt>0) {
            if (k.cnt==55) {
              isin.play(0); 
              dest=k.hedefx+k.w-16;
              yer=k.x;
              if (dest<yer)
                dest-=k.w+32;
            }
            k.isinla(m);
            k.cnt--;
            sinir+=(dest-yer)/55;
            if (k.cnt==0)
              para-=3500;
          }
          if (!yukaribak && k.cnt<55 && k.cnt>0)
            yukaribak=true;
          if (k.cnt==0 ) {
            yukaribak=false;
          }
        }
      } else if (m.x>=k.x && m.x+16<=k.x+k.w && m.y<=k.y && m.y>=k.y-k.h) {
        if (yukaribak && millis()-paraMessageZaman>=3000) {
          paraMessageZaman=millis();
          pmy=0;
        }
      }
      if (millis()-paraMessageZaman<3000) {
        fill(0);
        rect(330, pmy-50, 300, 50);
        fill(220);
        textSize(14);
        message="IŞINLANMAYA "+(3500-para)+"$ DAHA LAZIM";
        text(message, (width-textWidth(message))/2, pmy-20);
        if (pmy<50)
          pmy++;
      }
      if (!(m.x>=k.x && m.x+16<=k.x+k.w))
        k.cnt=55;

      gostergeCiz();

      if (soruflag) {  
        tema.pause();
        if (btscnt==0) { 
          bitis.play(); 
          btscnt++;
        }
        guliz.resize(360, 0);
        textSize(18);        
        fill(0);
        rect((width-guliz.width)/2-1, soruy-206, guliz.width+1, guliz.height+1);    
        image(guliz, (width-guliz.width)/2, soruy-205);

        fill(250);
        rect((width-guliz.width)/2-1, soruy-243, guliz.width+1, 30);               
        fill(200, 0, 0);
        String tempText = "ŞUNLARA Bİ BAKIIIN...";
        text(tempText, (width-textWidth(tempText))/2, soruy-220);     

        image(kalp, (width-kalp.width)/2, soruy+50);
        image(kalp, (width+kalp.width)/2, soruy+40);
        image(kalp, (width-kalp.width*3)/2, soruy+40);
        if (soruy<250)
          soruy++;
      }
    } else {
      if (millis()-zaman1<3000) {
        fill(0);
        rect(330, oly-50, 300, 50);
        fill(220);
        textSize(14);
        text(message, 400, oly-20);
        ekranflag=true;
        if (oly<50)
          oly++;
      } else {
        if (can>=0 && ekranflag) {
          died=false;
          oly=0;
          zaman2=millis();
          basy=0;
        } else {
          zaman1=millis();
          can--;
          m.y=0;
          if (m.x>=5450) {
            m.x=5450;
            sinir=4950;
          } else if (m.x>=2000) {
            m.x=2000;
            sinir=1500;
          } else {
            m.x=100;
            sinir=0;
          } 
          m.xsp=0;
          m.ysp=0;
          atlayabilir=false;
          if (can<0) {            
            message="! ! !   OYUN BİTTİ   ! ! !"; 
            tema.pause();
            gameover.play();
          } else {    
            message=(can+1)+" HAKKIN DAHA VAR !"; 
            baszip=0;
            tema.pause();
            die.play(0);     
            sescnt=0;
          }
        }
      }
    }
  }
}

void girisEkraniCiz() {
  background(bg);
  tema.pause();
  sescnt=0;    
  basses.play();

  fill(200, 220, 0);
  rect(50, 50, 400, 430);
  fill(250);
  rect(60, 60, 380, 30);        
  textSize(20);
  fill(220, 0, 0);
  text("KONTROLLER", 180, 82); 

  image(marioright, 90, 120);
  image(marioleft, 90, 170);
  image(flyright, 90, 220);
  image(duckright, 90, 270+13);
  image(rightup, 90, 320);
  image(fastright3, 90, 370);

  fill(250);
  rect(130, 120, 30, 30);
  rect(130, 170, 30, 30);
  rect(130, 220, 30, 30);
  rect(130, 270, 30, 30);    
  rect(130, 320, 70, 30);
  rect(130, 370, 50, 30); 
  rect(130, 420, 30, 30);  

  fill(0);
  triangle(140, 130, 140, 140, 150, 135);
  triangle(140, 185, 150, 180, 150, 190);
  triangle(140, 240, 150, 240, 145, 230);
  triangle(140, 280, 150, 280, 145, 290);
  triangle(163, 340, 165, 338, 165, 342);
  line(165, 340, 190, 340);
  line(190, 335, 190, 340);
  textSize(10);
  text("Enter", 168, 333);
  textSize(15);
  text("Ctrl", 140, 390);
  text("Q", 140, 440);

  textSize(13);
  text("SAĞA GİDER", 220, 140);
  text("SOLA GİDER", 220, 190);
  text("ZIPLAR", 220, 240);
  text("EĞİLİR ( + BORUDAN GEÇER )", 220, 290);
  text("YUKARI BAKAR ( + IŞINLANIR )", 220, 340);
  text("HIZLANIR", 220, 390);
  text("DURAKLATIR / ( BİTİNCE ) ÇIKAR", 220, 440);

  fill(200, 220, 0);
  rect(505, 50, 400, 370);
  fill(250);
  rect(515, 60, 380, 30);
  rect(515, 240, 380, 30); 
  textSize(20);
  fill(220, 0, 0);
  text("BONUSLAR", 655, 82); 
  text("ÖCÜLER", 665, 262); 

  image(coin, 545, 120);
  image(money, 689, 120);
  image(kalp, 833, 120);

  image(mons1, 555-14, 350-28);
  image(mons2, 655-17, 350-42);
  image(mons3, 755-24, 350-48);
  image(mons4, 855-13, 350-32);

  fill(0);
  textSize(13);
  text("+ 150 $", 535, 180);
  text("+ 500 $", 680, 180);
  text("+ 1 CAN", 820, 180);

  text("+ 20 $", 530, 370);
  text("+ 40 $", 630, 370);
  text("+ 60 $", 730, 370);
  text("+ 80 $", 830, 370);    

  if ((count/50)%2==0)
    fill(120, 250, 250);
  else
    fill(255, 255, 0);        

  rect(505, 440, 400, 40);  
  fill(0); 
  textSize(16);
  text("Devam etmek için ENTER'a bas, ZİBİDİLİK YAPMA !!", 510, 465);  
  count++;
}

public void setGround() {
  int index=-1;
  float ustEngel=height;
  for (int i=0; i<engelsize; i++) {
    if (m.y<engeller[i].y && engeller[i].y<ustEngel && m.x+14> engeller[i].x && m.x+2<engeller[i].x+engeller[i].w ) {
      ustEngel=engeller[i].y;
      index=i;
    }
    if ( m.y+28>engeller[i].y && m.y<engeller[i].y+engeller[i].h-m.comelik && m.x+14> engeller[i].x && m.x+2<engeller[i].x+engeller[i].w) {
      if ( m.x+14< engeller[i].x+10) {
        m.x= engeller[i].x-14;
        if (m.xsp>0)
          m.xsp=0;
      }
      if ( m.x+2>engeller[i].x+engeller[i].w - 10) {
        m.x=engeller[i].x+engeller[i].w-2;
        if (m.xsp<0)
          m.xsp=0;
      }
      if (m.y+28<engeller[i].y+10)
        m.y=engeller[i].y-28;      
      if (m.y>engeller[i].y+engeller[i].h-m.comelik-10) {
        m.y=engeller[i].y+engeller[i].h-m.comelik;
        m.ysp=-0.1f;
      }
    }
  }

  g=ustEngel-28;
  if (index>=0 && engeller[index].type==3) {
    dip=m.y+engeller[index].h;
  } else
    dip=0;

  for (int i=0; i<odulsize; i++)
    if ( m.y+28>oduller[i].y && m.y<oduller[i].y+oduller[i].h-m.comelik && m.x+14> oduller[i].x && m.x+2<oduller[i].x+oduller[i].w) {
      if ( oduller[i].type==1) {
        para+=150;
        coins.play(0);
      } else if ( oduller[i].type==2) {
        para+=500;
        coins.play(0);
      } else if ( oduller[i].type==3) {
        can++;
        bonus.play(0);
      } else if ( oduller[i].type==4   )
        soruflag=true;

      if (oduller[i].type!=4) {
        oduller[i].type=0;
      }
    }

  for (int i=0; i<cnvsize; i++)
    if (cnv[i].type==0) {
      cnv[i].r=0;
      cnv[i].l=0;
      cnv[i].b=0;
      cnv[i].t=0;
    } else if ( m.y+28>cnv[i].y-cnv[i].h && m.y<cnv[i].y-m.comelik && m.x+16> cnv[i].x && m.x<cnv[i].x+cnv[i].w) {
      if (m.y+28<cnv[i].y-cnv[i].h+(cnv[i].h)/3) {
        para+=20*cnv[i].type;
        cnv[i].type=0;
        oldurme.play(0);
      } else {
        died=true;
        ekranflag=false;
      }
    }
}

void gostergeCiz() {  
  image(money_tot, 10, 10);
  image(kalp_tot, 10, 40);
  fill(200, 0, 0);  
  textSize(14);
  text(para, 50, 30);
  text(can, 50, 60);
  textSize(10);
  fill(240);
  rect(width-112, 10, 104, 10);
  rect(width-112, 25, 104, 10);
  fill(200, 0, 0);
  rect(width-110, 12, m.xsp>0 ? m.xsp*100/2.38 : m.xsp*(-100/2.38), 6);
  text("HIZ", width-140, 19);
  fill(0, 200, 0);
  rect(width-110, 27, baszip<m.y ? 0 :(baszip-m.y)/1.3, 6);
  text("ZIPLAMA", width-155, 34);
}

void printStaticObj() {
  for (int i=0; i<engelsize; i++)
    engeller[i].engelCiz();

  for (int i=0; i<odulsize; i++)
    oduller[i].odulCiz();

  for (int i=0; i<tblsize; i++)
    tbl[i].tabelaCiz();
}


void keyPressed() {
  if (key== ENTER) yukaribak = true;
  if (key== 'q' || key== 'Q') basla=false;
  if (key == CODED) {
    if (keyCode == UP) zipla = true; 
    if (keyCode == DOWN) comel = true; 
    if (keyCode == LEFT) solyon = true; 
    if (keyCode == RIGHT) sagyon = true;
    if (keyCode == ENTER) yukaribak = true; 
    if (keyCode == CONTROL) hizlan = true;
  }
}

void keyReleased() {
  if (key== ENTER) yukaribak = false;
  if (key == CODED) {
    if (keyCode == UP) zipla = false; 
    if (keyCode == DOWN) comel = false; 
    if (keyCode == LEFT) solyon = false; 
    if (keyCode == RIGHT) sagyon = false;
    if (keyCode == ENTER) yukaribak = false;
    if (keyCode == CONTROL) hizlan = false;
  }
}