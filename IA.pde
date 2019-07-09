class IA {
  public String move(Snake s, Fruit f) {
    if (abs(s.x.get(0) - f.x) > pixelSize/2) {
      if (s.x.get(0) - f.x < 0) {
        return "RIGHT";
      } else if (s.x.get(0) - f.x >= 0) { 
        return "LEFT";
      }
    }

    if (abs(s.y.get(0) - f.y) > pixelSize/2) {
      if (s.y.get(0) - f.y > 0) {
        return "UP";
      } else if (s.y.get(0) - f.y <= 0) { 
        return "DOWN";
      }
    }
    int i = (int)random(0, 3);
    return movements[i];
  }


  public String move2(Snake s, Fruit f) {
    String direction  = this.move(s, f);
    Snake ghost = new Snake(s.x, s.y, s.size);
    ghost.move(direction);
    int count =0;
    while (count< 3 && bodyCollision(ghost)) {
      count++;
      int i = (int)random(0, 3);
      direction = movements[i];
      ghost = new Snake(s.x, s.y, s.size);
      ghost.move(direction);
    }
    return direction;
  }

  public String move3(Snake s, Fruit f) {
    Snake ghost = new Snake(s.x, s.y, s.size);
    int i = (int)random(0, 3); 
    String direction = movements[i];
    ghost.move(direction);
    int count =0;
    while (getDistance(ghost, f) > getDistance(s, f)) {
      System.out.println(getDistance(ghost, f) + " vs " + getDistance(s, f));
      count++;
       i = (int)random(0, 3);
      direction = movements[i];
      ghost = new Snake(s.x, s.y, s.size);
      ghost.move(direction);
    }
    return ghost.lastMove;
  }
}
