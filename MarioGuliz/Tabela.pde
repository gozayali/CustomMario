class Tabela {
  float x, y;
  String yazi;

  Tabela(float x, float y, String yazi) {
    this.x=x;
    this.y=y;
    this.yazi=yazi;
  }

  void tabelaCiz() {

    fill(250);
    rect(x+14-sinir, y-50, 4, 50);
    image(arrow, x-sinir, y-80);
    fill(0, 160, 255);
    rect(x-4-sinir, y-45, 40, 12);

    fill(0);
    textSize(9);
    text(yazi, x-sinir+1, y-35);
  }
}