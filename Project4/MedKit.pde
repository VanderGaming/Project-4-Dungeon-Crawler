class Medkit extends Interactable {

  private int x;
  private int y;
  private int healAmount;

  private PImage sprite;

  //constructor
  public Medkit(int x, int y) {
    this.x = x;
    this.y = y;
    this.healAmount = 25;

    loadSprite();
  }

  //constructor for JSON objects
  public Medkit(JSONObject json) {
    this.x = json.getInt("x");
    this.y = json.getInt("y");
    this.healAmount = json.getInt("healAmount");

    loadSprite();
  }

  //load sprite
  private void loadSprite() {
    if (sprite == null) {
      sprite = loadImage("MedKitSprite.png");  
    }
  }
  
  
  @Override
  public JSONObject serialize() {
    JSONObject json = new JSONObject();
    json.setString("className", "Medkit");
    json.setInt("x", x);
    json.setInt("y", y);
    json.setInt("healAmount", healAmount);
    return json;
  }

  @Override
  public void draw() {
    float size = 50;
    float px = x * size;
    float py = y * size;

    imageMode(CORNER);
    image(sprite, px, py, size, size);
  }

  @Override
  public boolean interact(Player player) {
    float newHealth = min(1.0f, player.getHealth() + healAmount / 100.0f);
    player.setHealth(newHealth);
    return true; 
  }

  public int getX() { return x; }
  public int getY() { return y; }
}
