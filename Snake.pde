class Snake { //<>//
  IntList x, y;
  int[] c;
  String lastMove;
  int size = 1;
  Network nn;

  public Snake() {
    this.nn = new Network(4, 2);
    this.size = 1;
    this.x = new IntList();
    this.y = new IntList();
    this.x.set(0, (int) (floor(2*random(0, width)/(pixelSize))));
    this.y.set(0, (int) (floor(2*random(0, length)/(pixelSize))));

    this.c = new int[3];
    this.c[0] = (int) random(0, 255);
    this.c[1] = (int) random(0, 255);
    this.c[2] = (int) random(0, 255);
  }
  public Snake(int x, int y) {
    this.size = 1;
    this.x = new IntList();
    this.y = new IntList();
    this.x.set(0, x);
    this.y.set(0, y);

    this.c = new int[3];
    this.c[0] = (int) random(0, 255);
    this.c[1] = (int) random(0, 255);
    this.c[2] = (int) random(0, 255);
  }
  public Snake(IntList x, IntList y, int size) {
    this.size = size;
    this.x = x;
    this.y = y;
    this.c = new int[3];
    this.c[0] = (int) random(0, 255);
    this.c[1] = (int) random(0, 255);
    this.c[2] = (int) random(0, 255);
  }
  void changeColor() {
    this.c[0] = (int) random(0, 255);
    this.c[1] = (int) random(0, 255);
    this.c[2] = (int) random(0, 255);
  };

  void show() {
    for (int i=0; i < this.size; i++) {
      fill(this.c[0], this.c[1], this.c[2]);
      rect(this.x.get(i), this.y.get(i), pixelSize, pixelSize);
    }
  }
  void move(String direction) {
    for (int i = size - 1; i > 0; i--) {
      this.x.set(i, this.x.get(i-1));
      this.y.set(i, this.y.get(i-1));
    }
    switch(direction) {
    case "UP":
      if (this.y.get(0) <= 0) {
        this.y.set(0, width - pixelSize);
      } else {
        this.y.set(0, this.y.get(0) - pixelSize);
      }
      break;
    case "LEFT":

      if (this.x.get(0) <= 0) {
        this.x.set(0, length - pixelSize);
      } else {
        this.x.set(0, this.x.get(0) - pixelSize);
      }
      break;
    case "RIGHT":

      if (this.x.get(0) >= length) {
        this.x.set(0, 0);
      } else {
        this.x.set(0, this.x.get(0) + pixelSize);
      }
      break;
    case "DOWN":

      if (this.y.get(0) >= width) {
        this.y.set(0, 0);
      } else {
        this.y.set(0, this.y.get(0) + pixelSize);
      }
    }
    this.lastMove = direction;
  }

  void move() {
    int i = (int)random(0, 3);
    this.move(movements[i]);
    this.lastMove = movements[i];
  }
  void log() {
    System.out.println(this.toString());
  }
  String toString() {
    String output = "snake : ";
    for (int i=0; i < this.size; i++) {
      output = output + "[" + this.x.get(i) + "," +this.y.get(i) + "]";
    }
    return output;
  }

  void grow() {
    int lastX = this.x.get(this.size-1);
    int lastY = this.y.get(this.size-1);
    this.move(this.lastMove);
    this.size++;

    this.x.set(size-1, lastX);
    this.y.set(size-1, lastY);
    System.out.println("Grown!");
  }
  public void train() {
    for (int i = 0; i < trainingIterationsPerFrame; i++) {
      // Train that sucker!
      //float result = nn.train(inp, known);
      //count++;
    }
  }
}
