void Orbiter(){
  strokeWeight(2);
  noFill();
    
    float [] minDimen = new float[6];
    for( int j = 0; j < 6; j++){ 
    minDimen[j] = map(placeindex[j],0,100,40,500);
    for (int i = 0; i< count; i++) {
    Orbiter o = new Orbiter(sixplace[j][0], sixplace[j][1], random(360), 45*(1+(i+1)*0.3), 200*(i+1), minDimen[j]);
    o.radius = minDimen[j] * ((float)i/count);
    orbiters[j][i] = o;}
    }
    
  
  strokeCap(SQUARE);
  stroke(100);
}

void drawOrbiter(){
    ellipseMode(CENTER);
    noFill();
  
    //更新placetable
    updateplacetable();
    if (newplaceindex[0] != placeindex[0]){
    
    float [] minDimen = new float[6];
    for( int j = 0; j < 6; j++){ 
    minDimen[j] = map(newplaceindex[j],0,100,40,500);
    for (int i = 0; i< count; i++) {
    Orbiter o = new Orbiter(sixplace[j][0], sixplace[j][1], random(360), 45*(1+(i+1)*0.3), 200*(i+1), minDimen[j]);
    o.radius = minDimen[j] * ((float)i/count);
    orbiters[j][i] = o;}
    placeindex[j]=newplaceindex[j];
    }
    }
    
    for(int j = 0;j <6;j++){
    for(int i = 0; i< count; i++){
    orbiters[j][i].updateAndDraw();}
    }


  //strokeWeight(thickness);
  //stroke(100);
  //point(width/2, height/2);
}

class Orbiter {

  float centerX, centerY;

  float sweep = 45;
  float angle;
  float rotationSpeed;
  float radius;

  public Orbiter(float centerX, float centerY, float startAngle, float sweep, float rotationSpeed, float radius) {
    this.centerX = centerX;
    this.centerY = centerY;
    angle = startAngle;
    this.rotationSpeed = rotationSpeed;
    this.radius = radius;
    this.sweep = sweep;
  }

  public void updateAndDraw() {
    update();
    draw();
  }

  public void update() {
    angle += rotationSpeed / 60f;
  }

  public void draw() {
    strokeWeight(thickness);
    float lightness = map(radius, 0, 100, 40, 200);
    stroke(#ffc7c7, lightness);
    arc(centerX, centerY, radius, radius, radians(angle), radians(angle + sweep));
  }
}