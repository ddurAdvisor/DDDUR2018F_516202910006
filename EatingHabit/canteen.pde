class canteen{
  int[] Xcanteen = new int [22];
  int[] Ycanteen = new int [22];
  int x = 50;
  canteen(){}
  
  void drawbarleft(){
    pushMatrix();
    translate(width/2,height/2);
    for ( int i = 0 ; i < 22; i++){
      Xcanteen[i] = -canteenindex[i]-200;
      Ycanteen[i] = -300 + i * 30;
      fill(#ffc7c7);
      noStroke();
      ellipse(Xcanteen[i],Ycanteen[i],10,10);
    }
    
    //绘制bar
    fill(#ffc7c7);
    for ( int i = 0 ; i < 22;i++){
      rect(Xcanteen[i],Ycanteen[i]-5,-Xcanteen[i],10);
    }
    
    //绘制曲线
    noFill();
    strokeWeight(1);
    stroke(#e8e8e8);
    curveTightness(0);
    beginShape();
    for ( int i = 0 ; i < 22;i++){
      curveVertex(Xcanteen[i]-x,Ycanteen[i]);
    }
    endShape();
 
    popMatrix();
  } 
  
   void drawbarright(){    
    pushMatrix();
    translate(width/2,height/2);
    for ( int i = 0 ; i < 22; i++){
      Xcanteen[i] = canteenindex2[i]+200;
      Ycanteen[i] = -300 + i * 30;
      fill(#8785a2);
      noStroke();
      ellipse(Xcanteen[i],Ycanteen[i],10,10);
    }
    
     //绘制bar
    fill(#8785a2);
    for ( int i = 0 ; i < 22;i++){
      rect(0,Ycanteen[i]-5,Xcanteen[i],10);
    }
    
    //绘制曲线
    noFill();
    strokeWeight(1);
    stroke(#e8e8e8);
    curveTightness(0);
    beginShape();
    for ( int i = 0 ; i < 22;i++){
      curveVertex(Xcanteen[i]+x,Ycanteen[i]);
    }
    endShape();
    
   
    
    popMatrix();
  }
  
     
}