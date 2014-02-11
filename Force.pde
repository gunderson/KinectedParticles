class Force implements Cloneable{
  public float speed = 0.0;
  public float angle = 0.0;
  
  Force(){
  }
  
  Force(Force cloneFrom){
    speed = cloneFrom.speed;
    angle = cloneFrom.angle;
  }
  
  Force(float speed, float angle){
    this.speed = speed;
    this.angle = angle;
  }
  
  public void applyTo(Particle particle){
    particle.x += cos(angle) * speed * particle.friction;
    particle.y += sin(angle) * speed * particle.friction;
  }
  protected Force clone(){
    return new Force(this);
  }
}
