void favorUI(){
 int x = 80;
 int y = 360;
 int iconradius = 70;
 int iconcover = 49;
 int xcovergap = 10;
 int typegap = 148;
 int choicegap = 60;
 int choicefirst = 40;
 int goalgap = 170;
 
 
 
 stroke(#8888b5);
 strokeWeight(4);
 fill(255,180);
 rect(choicefirst+30,375,160,40,8);
 fill(#8888b5);
 //textFont(font);
 //textSize(20);
 textFont(font2);
 textSize(15);
 
if (gender == 0 && degree ==0){
       text("性 别    学 历",choicefirst+60,400);
      }else if (gender == 1 && degree == 0){
       text("女 生    学 历",choicefirst+60,400);
      }else if (gender == 2 && degree == 0){
       text("男 生    学 历",choicefirst+60,400);    
      }else if (gender == 0 && degree == 1){
      text("性 别    本 科",choicefirst+60,400);
      }else if (gender == 1 && degree == 1){
      text("女 生    本 科",choicefirst+60,400);
      }else if (gender == 2 && degree == 1){
      text("男 生    本 科",choicefirst+60,400);
      }else if (gender == 0 && degree == 2){
      text("性 别    硕 士",choicefirst+60,400);
      }else if (gender == 1 && degree == 2){
      text("女 生    硕 士",choicefirst+60,400);
      }else if (gender == 2 && degree == 2){
      text("男 生    硕 士",choicefirst+60,400);
      }else if (gender == 0 && degree == 3){
      text("性 别    博 士",choicefirst+60,400);
      }else if (gender == 1 && degree == 3){
      text("女 生    博 士",choicefirst+60,400);
      }else if (gender == 2 && degree == 3){
      text("男 生    博 士",choicefirst+60,400);
    }
 textSize(8);
 text("*点 击 下 方 选 择 不 同 对 象",choicefirst+60,430);
 
 
 noStroke();
 noFill();
 
  //性别方块

 image (imggender1,x-50+Xgender,y+80,iconradius,iconradius);//性别方块
 stroke(#8785a2);
 strokeWeight(1);
 noFill();
 ellipseMode(CENTER);
 ellipse (x-50+Xgender,y+110,6,6);
 if(mouseX > x-50+Xgender && mouseX < x-50+iconradius+Xgender && mouseY >y+80 && mouseY<y+80+iconradius){
   fill(#8785a2,100);
   noStroke();
   ellipseMode(CORNER);
   ellipse(x-50+Xgender+xcovergap,y+80+xcovergap,iconcover,iconcover);//鼠标移到性别方块
   if(mousePressed){
     Xgendergoal = goalgap;}
 }
 if ( Xgendergoal == goalgap && Xgender < goalgap){
       Xgender += (Xgendergoal-Xgender)*0.4;}
 
 if (Xgender >= goalgap-2){
 image (imggender2,x+choicefirst,y+80,iconradius,iconradius);//女生方块
 image (imggender3,x+choicefirst-choicegap,y+80,iconradius,iconradius);//男生方块
 ellipseMode(CENTER);
 fill(#8785a2);
 ellipse (x-50+Xgender,y+110,6,6);
 
 if(mouseX > x+60 && mouseX < x+120 && mouseY > y+80 && mouseY< y+140){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x+choicefirst+xcovergap,y+80+xcovergap,iconcover,iconcover);//鼠标移到女生方块
   if(mousePressed){
     gender=1;}
   }
 if(gender == 1){ //女生方块选中变色
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x+choicefirst+xcovergap,y+80+xcovergap,iconcover,iconcover);
   }
   
 if(mouseX > x && mouseX < x+60 && mouseY > y+80 && mouseY< y+140){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x+choicefirst-choicegap+xcovergap,y+80+xcovergap,iconcover,iconcover);//鼠标移到男生方块
   if(mousePressed){
     gender=2;}
   }
 if(gender == 2){ //男生方块选中变色
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x+choicefirst-choicegap+xcovergap,y+80+xcovergap,iconcover,iconcover);
   }
  if(mouseX > x-50+Xgender && mouseX < x-50+iconradius+Xgender && mouseY >y+80 && mouseY<y+80+iconradius){
   if(mousePressed){
     gender = 0;
   }
   if(gender == 0){
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x-50+Xgender+xcovergap,y+80+xcovergap,iconcover,iconcover); 
   }
 }
 }
 
 //学历方块
 image (imgdegree1,x-50+Xdegree,y+typegap,iconradius,iconradius);
 stroke(#8785a2);
 strokeWeight(1);
 noFill();
 ellipseMode(CENTER);
 ellipse (x-50+Xdegree,y+185,6,6);
 if(mouseX > x-50+Xdegree && mouseX < x-50+iconradius+Xdegree && mouseY >y+typegap && mouseY<y+iconradius+typegap){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x-50+Xdegree+xcovergap,y+typegap+xcovergap,iconcover,iconcover);
   if(mousePressed){
     Xdegreegoal = goalgap;}
 }
 if ( Xdegreegoal == goalgap && Xdegree < goalgap){
       Xdegree += (Xdegreegoal-Xdegree)*0.4;}
 
 if (Xdegree >= goalgap-2){
 image (imgdegree4,x+choicefirst,y+typegap,iconradius,iconradius);//博士方块
 image (imgdegree3,x+choicefirst-choicegap,y+typegap,iconradius,iconradius);//硕士方块
 image (imgdegree2,x+choicefirst-choicegap*2,y+typegap,iconradius,iconradius);//本科方块
 ellipseMode(CENTER);
 fill(#8785a2);
 ellipse (x-50+Xdegree,y+185,6,6);
 
 if(mouseX > x+60 && mouseX < x+120 && mouseY >y+typegap && mouseY<y+210){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x+choicefirst+xcovergap,y+typegap+xcovergap,iconcover,iconcover);//鼠标移到博士方块
   if(mousePressed){
     degree=3;}
   }
 if(degree == 3){ //博士方块选中变色
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x+choicefirst+xcovergap,y+typegap+xcovergap,iconcover,iconcover);
   }
   
 if(mouseX > x && mouseX < x+60 && mouseY >y+typegap && mouseY<y+210){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x+choicefirst-choicegap+xcovergap,y+typegap+xcovergap,iconcover,iconcover);//鼠标移到硕士方块
   if(mousePressed){
     degree=2;}
   }
 if(degree == 2){ //硕士方块选中变色
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x+choicefirst-choicegap+xcovergap,y+typegap+xcovergap,iconcover,iconcover);
   }
   
   if(mouseX > x-60 && mouseX < x && mouseY >y+typegap && mouseY<y+210){
   ellipseMode(CORNER);
   fill(#8785a2,100);
   noStroke();
   ellipse(x+choicefirst-choicegap*2+xcovergap,y+typegap+xcovergap,iconcover,iconcover);//鼠标移到本科方块
   if(mousePressed){
     degree=1;}
   }
   if(degree == 1){ //本科方块选中变色
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x+choicefirst-choicegap*2+xcovergap,y+typegap+xcovergap,iconcover,iconcover);
   }
   if(mouseX > x-50+Xdegree && mouseX < x-50+iconradius+Xdegree && mouseY >y+typegap && mouseY<y+iconradius+typegap){
   if(mousePressed){
     degree = 0;
   }
   if(degree == 0){
     ellipseMode(CORNER);
     noFill();
     stroke(#8785a2);
     strokeWeight(3);
     ellipse(x-50+Xdegree+xcovergap,y+typegap+xcovergap,iconcover,iconcover); 
   }
 }
 }

}

void canteenUI(){
  List l = Arrays.asList("1", "2", "3", "4", "5", "6");
  cp5.addScrollableList("canteenlist")
     .setPosition(350, 300)
     .setSize(120, 150)
     .setBarHeight(30)
     .setItemHeight(20)
     .addItems(l)
     .setColorBackground(color(60))
     .setColorActive(color(255, 128))
     .setOpen(false);
   
     
  cp5.addScrollableList("canteenlist2")
     .setPosition(520, 300)
     .setSize(120, 150)
     .setBarHeight(30)
     .setItemHeight(20)
     .addItems(l)
     .setColorBackground(color(60))
     .setColorActive(color(255, 128))
     .setOpen(false);
 
}
void canteenlist(int n){
  canteenhint = n + 1 ;
  
}
void canteenlist2(int n){
  canteenhint2 = n + 1 ;
}
void canteenline(){
  for ( int i = 0 ; i < 22; i++){
   int y = i * 30;
   if(mouseY >= y-10 && mouseY <= y+10){
   println(y);
   stroke(120);
   line(0,y,width,y);}
 }
}

void menuUI(){
  float Xrectgoal;
  
  pushMatrix();
  translate(0,0);
  textAlign(LEFT, BASELINE);
  
  textFont(font);
  fill(220);
  textSize(20);
  text("FLAVOR",40,50);
  text("TIME",140,50);
  text("PLACE",240,50);textFont(font);
  
  textFont(font2);
  textSize(8);
  text("饮 食 口 味",40,63);
  text("用 餐 时 间",140,63);
  fill(220);
  noStroke();
  text("用 餐 地 点",240,63);

  if (pagehint == 1){
    fill(#8787AF);
    noStroke();
    Xrectgoal = 32;
    if (abs(Xrect - Xrectgoal)>0.1){
      Xrect += (Xrectgoal - Xrect)*0.5;
    }
    rect(Xrect,30,95,40,10);
    
    fill(255);
    textFont(font);
    textSize(20);
    text("FLAVOR",40,50);
    textFont(font2);
    textSize(8);
    text("饮 食 口 味",40,63);
  }else if(pagehint == 2){
    fill(#8787AF);
    noStroke();
    Xrectgoal = 132;
    if (abs(Xrect - Xrectgoal)>0.1){
      Xrect += (Xrectgoal - Xrect)*0.5;
    }
    rect(Xrect,30,95,40,10);
    
    fill(255);
    textFont(font);
    textSize(20);
    text("TIME",140,50);
    textFont(font2);
    textSize(8);
    text("用 餐 时 间",140,63);
  }else if(pagehint == 3){
    fill(#8787AF);
    noStroke();
    Xrectgoal = 232;
    if (abs(Xrect - Xrectgoal)>0.1){
      Xrect += (Xrectgoal - Xrect)*0.5;
    }
    rect(Xrect,30,95,40,10);
    noFill();
    
    textFont(font);
    textSize(20);
    fill(255);
    noStroke();
    text("PLACE",240,50);
    textFont(font2);
    textSize(8);
    fill(255);
    noStroke();
    text("用 餐 地 点",240,63);
  }
  
  //鼠标移到menu上变黑的反应
  if (mouseX>32 && mouseX<127 && mouseY>30 && mouseY<70){
    fill(50);
    noStroke();
    textFont(font);
    textSize(20);
    text("FLAVOR",40,50);
    textFont(font2);
    textSize(8);
    text("饮 食 口 味",40,63);
    if (mousePressed){pagehint = 1;}
  }
  
  if (mouseX>132 && mouseX<227 && mouseY>30 && mouseY<70){
    fill(50);
    noStroke();
    textFont(font);
    textSize(20);
    text("TIME",140,50);
    textFont(font2);
    textSize(8);
    text("用 餐 时 间",140,63);
    if (mousePressed){pagehint = 2;}   
  }
  
   if (mouseX>232 && mouseX<327 && mouseY>30 && mouseY<70){
    
    noStroke();
    noFill();
    
    textFont(font);
    textSize(20);
    fill(50);
    noStroke();
    text("PLACE",240,50);
    textFont(font2);
    textSize(8);
    noStroke();
    fill(50);
    text("用 餐 地 点",240,63);
    if (mousePressed){pagehint = 3;}   
  }
  popMatrix();
  
  
}