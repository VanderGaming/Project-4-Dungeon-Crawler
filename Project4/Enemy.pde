class Enemy extends Actor {

  // constructor for new enemy
  Enemy(Direction facing) {
    super(40, 8, facing);
  }

  // constructor for loading
  Enemy(JSONObject obj) {
    super(obj);
  }

  // save enemy
  JSONObject serialize() {
    JSONObject obj = super.serialize();
    obj.setString("className", "Enemy");
    return obj;
  }

  // draw enemy
  void draw() {
    super.draw(); // health bar

    push();

    // skeleton color
    fill(230, 230, 200);
    noStroke();

    // body (circle)
    ellipse(0, 0, 0.7, 0.7);

    // simple eyes
    fill(0);
    ellipse(-0.1, -0.05, 0.1, 0.1);
    ellipse(0.1, -0.05, 0.1, 0.1);

    pop();
  }

  // enemy action
  Action getAction() {

    // attack if possible
    if (getActionValidity(Action.ATTACK_NORTH)) {
      facing = Direction.NORTH;
      return Action.ATTACK_NORTH;
    }

    if (getActionValidity(Action.ATTACK_SOUTH)) {
      facing = Direction.SOUTH;
      return Action.ATTACK_SOUTH;
    }

    if (getActionValidity(Action.ATTACK_EAST)) {
      facing = Direction.EAST;
      return Action.ATTACK_EAST;
    }

    if (getActionValidity(Action.ATTACK_WEST)) {
      facing = Direction.WEST;
      return Action.ATTACK_WEST;
    }

    // otherwise move (simple order)
    if (getActionValidity(Action.MOVE_NORTH)) {
      facing = Direction.NORTH;
      return Action.MOVE_NORTH;
    }

    if (getActionValidity(Action.MOVE_SOUTH)) {
      facing = Direction.SOUTH;
      return Action.MOVE_SOUTH;
    }

    if (getActionValidity(Action.MOVE_EAST)) {
      facing = Direction.EAST;
      return Action.MOVE_EAST;
    }

    if (getActionValidity(Action.MOVE_WEST)) {
      facing = Direction.WEST;
      return Action.MOVE_WEST;
    }

    return null; // do nothing if stuck
  }
}
