class Emitter{
  public float x = 0.0;
  public float y = 0.0;
  public float z = 0.0;
  public float speed = 0.0;
  public float angle = 0.0;
  public float scale = 1.0;
  public EmitterSettings settings = new EmitterSettings();
  public ParticleSettings particleSettings = new ParticleSettings();
  public Force inertia = new Force(5,0.2);
  public Force GRAVITY = new Force(2, 1.5);
  public Telemetry telemetry = new Telemetry(0,0);
  
  public ArrayList<Particle> freeParticles = new ArrayList<Particle>();
  public ArrayList<Particle> usedParticles = new ArrayList<Particle>();
  void Emitter(){
    
  }
  
  public void draw(){
    sweepDeadParticles();
    if (inertia.speed > 1.1){
      spawnParticles();
    }
    moveParticles();
    relateParticles();
    drawParticles();
  }
  
  public void position(float x, float y){
    this.x = x;
    this.y = y;
    telemetry.update(x,y);
    inertia.speed = telemetry.speed;
    inertia.angle = telemetry.angle;
  }
  
  private void sweepDeadParticles(){
    //for each in usedParticles
    int i = usedParticles.size();
    Particle p;
    while (--i > -1){
      p = usedParticles.get(i);
      //if it is dead
      if (p.dead){
        //remove it from used particles
        //place it in free particles
        usedParticles.remove(p);
        freeParticles.add(p);
      } 
    }
  }
  
  public void spawnParticles(){
    if (frameCount % settings.spread == 0){
       Particle p;
       while (freeParticles.size() < settings.density){
        //create particle
        //push it to freeParticles
        p = new Particle();
        freeParticles.add(p);
       }
       int i = -1;
       while (++i < settings.density){
         p = freeParticles.remove(freeParticles.size() - 1);
         usedParticles.add(p);
         p.setup(this);
        p.forces.add(GRAVITY);
       }
    }
  }
  
  public void moveParticles(){
    for (Particle p : usedParticles){
      p.move();
    }
  }
  
  public void relateParticles(){
    for (Particle p : usedParticles){
      //find relationships
    }
  }
  
  public void drawParticles(){
    for (Particle p : usedParticles){
      p.draw();
    }
  }
}
