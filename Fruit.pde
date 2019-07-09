class Fruit {
  int size;
  int x, y;
  int[] c;


  public Fruit(int x, int y) {
    this.x = x;
    this.y = y;
  }
  public Fruit() {
    this.c = new int[3];
    resetFruit();
  }
  void show() {
    fill(this.c[0], this.c[1], this.c[2]);
    ellipse(this.x, this.y, pixelSize, pixelSize);
  }

  void changeColor() {
    this.c[0] = 235;
    this.c[1] = 20;
    this.c[2] = 20;
  }
  void resetFruit() {
    this.x = (int) random(0, width);
    this.x = this.x - this.x % (pixelSize/2);
    this.y = (int) random(0, length);
    this.y = this.y - this.y % (pixelSize/2);
    this.changeColor();
  }
  void log() {
    System.out.println(this.toString());
  }
  String toString() {
    String output = "fruit: ";
    output = output + "[" + this.x + "," +this.y + "]";
    return output;
  }
}
