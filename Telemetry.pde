class Telemetry{
  Telemetry(float x, float y){
    this.x = x;
    this.y = y;
  }
  float x;
  float y;
//  float z;
  float px;
  float py;
//  float pz;
  
  // add deeper xyz arraylist for smoothing motion
  
  float dx;
  float dy;
//  float dz;
  float speed;
  float distance;
  float angle;
  
  void update(float _x, float _y){
    px = x;
    py = y;
    x = _x;
    y = _y;
    dx = x - px;
    dy = y - py;
    distance = speed = sqrt((dx*dx)+(dy*dy));
    angle = atan2(dy,dx);
  }
}
