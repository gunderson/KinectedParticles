class Particle {
  public Emitter emitter;
  public float x = 0.0;
  public float y = 0.0;
  public float z = 0.0;
  public float friction = 0.98; // 0-1 0=immovable, 1=no friction
  public float scale = 1.0;
  public int age = 0;
  public boolean dead = true;
  public Force inertia = new Force();
  public ArrayList<Force> forces = new ArrayList<Force>();
  
  public ParticleSettings settings;
  
  PShape shape;
  
  Particle(){
  }
  
  private void setupShape(){
    shape = createShape(RECT, -5, -5, 10, 10);
    shape.setFill(settings.fillColor);
    shape.setStroke(false);
  }
  
  public void setup(Emitter e){
    x = e.x;
    y = e.y;
    z = e.z;
    emitter = e;
    age = 0;
    dead = false;
    settings = e.particleSettings;
    setupShape();
    inertia = e.inertia.clone();
    forces = new ArrayList<Force>();
  }
  
  public void move(){
    //update inertia
    inertia.speed *= friction;
    inertia.applyTo(this);
    //for each force move particle
    for (Force f : forces){
      f.applyTo(this);
    }
    checkForDead();
  }
  
  public void draw(){
    shape(shape, x, y);
  }
  
  public void checkForDead(){
    if (++age >= settings.lifespan){
      dead = true; 
      return;
    }
    if (x < 0 || y < 0 || x > width || y > width){
      dead = true; 
      return;
    }
  }
}
