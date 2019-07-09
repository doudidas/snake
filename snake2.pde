import nn.*;

Network nn;
int width     = 300;
int length    = 300;
int sizeFruit = 10;
int pixelSize = 10;
IA ia = new IA();
Snake[] snakes;
Fruit[] fruits;
String[] movements = {"UP", "DOWN", "LEFT", "RIGHT"};
int frame = 0;
int MaxFrames = 4;
int trainingIterationsPerFrame = 100;
String userInput = "RIGHT";


void setup() {
  snakes = new Snake[3];
  fruits = new Fruit[3];
  for (int i = 0; i< 3; i++) {
    snakes[i] = new Snake(width/2, length/2);
    fruits[i] = new Fruit();
    fruits[i].resetFruit();
  }

  size(300, 300, P2D);
  smooth(4);
  nn = new Network(4, 2);
}


void draw() {
  frame ++;
  if (frame > MaxFrames) {
    if (gameOver()) {
      stop();
    }
    background(0);
    for (int i = 0; i < 3; i++) {
      play(snakes[i], fruits[i]);
      fruits[i].show();
    }
    snakes[0].move(ia.move(snakes[0], fruits[0]));
    snakes[1].move(ia.move2(snakes[1], fruits[1]));
    snakes[2].move(ia.move3(snakes[2], fruits[2]));
    frame = 0;
  }
}


void mouseClicked() {
  for (Fruit f : fruits) {
    f.resetFruit();
  }
}


boolean snakeIsOnFruit(Snake s, Fruit f) {
  for (int i = 0; i < s.size; i ++) {
    if ((abs(s.x.get(i) - f.x) < pixelSize) && (abs(s.y.get(i) - f.y) < pixelSize)) {
      return true;
    }
  }
  return false;
}

boolean bodyCollision(Snake s) {
  if (s.size > 1) { 
    int headX = s.x.get(0);
    int headY = s.y.get(0);
    for (int i = 1; i < s.size; i ++) {
      if ( s.x.get(i) == headX && s.y.get(i) == headY) {
        System.out.println("Collision on : [" + s.x.get(i) + ", " + s.y.get(i) + "]");
        return true;
      }
    }
  } 
  return false;
}

boolean snakeCollision(Snake s1, Snake s2) {
  int headX = s1.x.get(0);
  int headY = s1.y.get(0);
  for (int i = 0; i < s2.size; i ++) {
    if ( (abs(s2.x.get(i) - headX) < pixelSize) && (abs(s2.y.get(i) - headY) < pixelSize) ) {
      return true;
    }
  }
  return false;
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
    case UP:
      userInput = "UP";
      break;
    case DOWN:
      userInput = "DOWN";
      break;
    case LEFT:
      userInput = "LEFT";
      break;
    case RIGHT:
      userInput = "RIGHT";
      break;
    }
  }
}

boolean gameOver() {
  //if (false && bodyCollision(rival) || (false && snakeCollision(player, rival))) {
  // System.out.println("GAME OVER");
  // return true;
  //} else { 
  return false;
  //  }
}

float getDistance(Snake s, Fruit f) {
  return sqrt(sq(s.x.get(0) - f.x) + sq(s.y.get(0) - f.y));
}


void play(Snake snake, Fruit fruit) {

  if (snakeIsOnFruit(snake, fruit)) {
    snake.grow();
    fruit.resetFruit();
  }
  snake.show();
}
