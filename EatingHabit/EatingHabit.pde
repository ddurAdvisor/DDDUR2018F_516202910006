import controlP5.*;
import java.util.*;
ControlP5 cp5;

Table table;
Table canteentable;
Table timetable;
Table placetable;
PImage img1,img3,imggender1,imggender2,imggender3,imgdegree1,imgdegree2,imgdegree3,imgdegree4,imgmap,imgcanteenvs,imgsun,imgmoon,firstpage,timeimg,imgpk,imgback;
PImage[] imgfood = new PImage [8];
PFont font,font2;
boolean t = false;
boolean canteenUIhint = true;
float xCenter = 584;
float yCenter = 300;
int canteenIndex = 0;
int canteenhint = 1;
int canteenhint2 = 2;
int[] canteenindex = new int [22];
int[] canteenindex2 = new int [22];
int[] canteentable1 = new int [22];
int[] canteentable2 = new int [22];
int[] canteentable3 = new int [22];
int[] canteentable4 = new int [22];
int[] canteentable5 = new int [22];
int[] canteentable6 = new int [22];
canteen[] mycanteen = new canteen[6];
int[] index = new int[8];
int[] newindex = new int[8];
favor[] myfavor = new favor[8];
favor[] newfavor = new favor[8];
float[] time = new float[24];
int gender = 0;
int degree = 0;
int Xgender = 0;
int Xgendergoal = 0;
int Xdegree = 0;
int Xdegreegoal = 0;
int pagehint = 0;
float Xrect = 32;
//page3要用的变量
float thickness = 3; 
int count = 10;
Orbiter[][] orbiters = new Orbiter[6][count];
float[] placeindex = new float[6]; 
float[] newplaceindex = new float[6];
int[][] sixplace = {{300,400},{570,440},{420,220},{150,200},{700,480},{800,200}};
float xball=600;


void setup(){
  size(1000,600);
  smooth();
  
  cp5 = new ControlP5(this);
  
  font = createFont("Poppins-Bold.ttf",32);
  font2 = createFont("GBK.TTF",32);
  
 
  table = loadTable("favor.csv","header");
  canteentable = loadTable("canteen.csv","header");
  timetable = loadTable("time.csv","header");
  placetable = loadTable("place.csv","header");
  println(table.getRowCount()+" tatol rows in table");
  loadimage();
  loadtable();
  loadplacetable();
  
  mycanteen[0] = new canteen();
  canteenloadtable();
  
  Orbiter();
  Zobject_setup();
  
  }  
  
void draw(){
  //frameRate(60);
  background(255);
  if (pagehint == 0){
    page0();
  }else if (pagehint == 1){
    page1();
  }else if (pagehint == 2){
    page2();
  }else if (pagehint == 3){
    page3();
  }else if (pagehint == 4){
    page4();
  }else if (pagehint == 5){
    page5();}
  
   if (pagehint != 4 && pagehint != 0){
    menuUI();
    favorUI();
   }
   if (pagehint == 4 && canteenUIhint == true){
     cp5.show();
     canteenUI();
     canteenUIhint = false;
   }else if(pagehint != 4){
     cp5.hide();
   }
    

    
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    zoomIn = false;
  } else if (mouseButton == RIGHT) {
    zoomOut = false;
  }
}


void page0(){
  fill(#3c3c3c);
  rect(0,0,width,height);
  Zobject_draw();
  image(firstpage,0,0,width,height);  
  if (mouseX>420 && mouseX<580 && mouseY>460 && mouseY<510){
    fill(255,100);
    rect(420,460,160,50,10);
    if (mousePressed){
      pagehint = 5;
    }
  }
}

void page5(){
  fill(#3c3c3c);
  rect(0,0,width,height);
  fill(#ffc7c7,30);
  noStroke();
  rect(30,30,330,50,8);
  rect(30,355,300,290,8);
  
  textFont(font2);
  textSize(42);
  //text("饮食口味、用餐时间、用餐地点呈现交大师生饮食习惯",340,200);
  text("UNLOCKING...",605,290);
  fill(#ffc7c7);
  textFont(font2);
  textSize(15);
  text("# 菜单栏 #",135,105);
  text("# 师生分类选择框 #",135,340);
  stroke(#ffc7c7);
  strokeWeight(2);
  line(600,380,900,380);
  fill(255);
  noStroke();
  xball = xball+(900-xball)*0.01;
  ellipse(xball,380,20,20);
 
  if (890 <= xball){
  pagehint = 1;}
}

void page1(){
  pushMatrix();
  translate(300,300);
  popMatrix();
  updatetable();
 image(img1,0,0,width,height);
  
  fill(#8888b5);
 textFont(font2);
 textSize(15);
 textSize(8);
 text("* 越 靠 近 中 心 点 ， 风 味 消 费 越 高",510,35);
 
  for (int i3 = 0; i3 < 8; i3++){
      pushMatrix();
      translate(xCenter,yCenter);
      stroke(#8787af,50);
      strokeWeight(1);
      beginShape(LINES);
      for (int i2 = 0; i2 < 8; i2++){
        if (i3 != i2){
        vertex(myfavor[i3].Xellipse,-myfavor[i3].Yellipse);
        vertex(myfavor[i2].Xellipse,-myfavor[i2].Yellipse);}
      }
      endShape();
      popMatrix();
      }
    

    for (int i = 0; i < 8; i++){

     //if (gender != 0 || degree != 0){ //如果有新index数组
     myfavor[i].realsales = newindex[i];
     if ( newindex[i] > 20){
      newindex[i] = 20 + newindex[i]/10;
    }
      myfavor[i].newsales= map(newindex[i],0,50,200,0);
      
     
      //创建favor
      myfavor[i].updatefavor();
      myfavor[i].buildfavor();
      
      //结束移动
      if (myfavor[i].hint){
      index[i] = newindex[i];
      myfavor[i] = new favor(i,index[i]);
      myfavor[i].hint = false;
      myfavor[i].updatehint = false;
      } 
      
    } 
}


void page2(){
  //天空颜色交互
  float startX = 313;
  float startY = 106;
  float lengthX = 627;
  float lengthY = 379;
  float mousex=map(mouseX,startX,startX+lengthX/18*5.0,60,255);//天亮
  float mousex2=map(mouseX,startX+lengthX/18*10.0,startX+lengthX,255,60);//天暗
  float mousesun=map(mouseX,startX+lengthX/18*2.0,startX+lengthX/18*12.0,startX,startX+lengthX);
  float mousemoon=map(mouseX,startX+lengthX/18*13.0,startX+lengthX/18*18.0,startX,startX+lengthX/3);
  float mousetext=map(mouseX,startX+lengthX/18*2.0,startX+lengthX/18*4.0,255,60);
  float mousetext2=map(mouseX,startX+lengthX/18*12.0,startX+lengthX/18*14.0,60,255);
  
  timeloadtable();
  image(timeimg,0,0,width,height);
  //背景颜色
  if (mouseX < startX+lengthX/18*10.0){
  fill(mousex);
    if(mouseX <startX){
      fill(60);}
  }else{
  fill(mousex2);}
    if(mouseX >startX+lengthX){
      fill(60);}
  noStroke();
  rect(startX,startY,lengthX,lengthY,50);
  
  //太阳月亮
  if (mousesun > startX && mousesun < startX+lengthX){
  image(imgsun,mousesun,150,70,70);}
  if (mousemoon > startX && mousemoon < startX+lengthX){
  image(imgmoon,mousemoon,150,50,60);}
  
  //peaktime文字颜色
  if (mouseX < startX+lengthX/18*4.0 && mouseX > startX+lengthX/18*2.0){
  fill(mousetext);
  }else if(mouseX <= startX+lengthX/18*2.0){
  fill(255);
  }else if(mouseX >= startX+lengthX/18*4.0 && mouseX <= startX+lengthX/18*12.0 ){
  fill(60);
  }else if(mouseX < startX+lengthX/18*14.0 && mouseX > startX+lengthX/18*12.0){
  fill(mousetext2);
  }else if(mouseX >= startX+lengthX/18*14.0){
  fill(255);
  }
  
  //lunch peak time
  textFont(font);
  textSize(10);
  textAlign(CENTER,CENTER);
  text("LUNCH",startX+lengthX/3,213);
  textSize(25);
  text("11:35",startX+lengthX/3,230);
  
  //breakfast peak time
  if ((gender == 0 && degree == 1) ||(gender == 1 && degree == 1)||(gender == 2 && degree == 1)||(gender == 0 && degree == 3)){
  textSize(10);
  text("BREAKFAST",startX+lengthX/15-2,303);
  textSize(25);
  text("07:25",startX+lengthX/15-2,320);
  }else{
  textSize(10);
  text("BREAKFAST",startX+lengthX/15,303);
  textSize(25);
  text("07:30",startX+lengthX/15,320);}
  
  //dinner peak time
  if (gender == 2 && degree == 1){
  textSize(10);
  text("DINNER",startX+lengthX*0.6+2,273);
  textSize(25);
  text("17:35",startX+lengthX*0.6+2,290);
  }else if(gender == 1 && degree == 2){
  textSize(10);
  text("DINNER",startX+lengthX*0.6-4,273);
  textSize(25);
  text("17:25",startX+lengthX*0.6-4,290);
  }else if(gender == 1 && degree == 3){
  textSize(10);
  text("DINNER",startX+lengthX*0.6+4,273);
  textSize(25);
  text("17:40",startX+lengthX*0.6+4,290);
  }else{
  textSize(10);
  text("DINNER",startX+lengthX*0.6,273);
  textSize(25);
  text("17:30",startX+lengthX*0.6,290);
  }
  
  //peaktime折线图
  if (mouseX < startX+lengthX/18*4.0 && mouseX > startX+lengthX/18*2.0){
  stroke(mousetext);
  }else if(mouseX <= startX+lengthX/18*2.0){
  stroke(255);
  }else if(mouseX >= startX+lengthX/18*4.0 && mouseX <= startX+lengthX/18*12.0 ){
  stroke(60);
  }else if(mouseX < startX+lengthX/18*14.0 && mouseX > startX+lengthX/18*12.0){
  stroke(mousetext2);
  }else if(mouseX >= startX+lengthX/18*14.0){
  stroke(255);
  }
  float[] timex = new float[24];
  float[] timey = new float[24];
  noFill();
  curveTightness(0);
  strokeWeight(2);
  beginShape();
  for(int i = 0; i < 24; i++){
   timex[i] = -30+30*i+startX;
   timey[i] = map(time[i],0,100,450,-450);  
   curveVertex(timex[i],timey[i]);
  }
  endShape();
  
  for(int i = 0; i < 24; i++){
  if (mouseX > timex[i] && mouseX < timex[i]+30 && mouseX < startX+lengthX){
  stroke(235);
  strokeWeight(2);
  line(mouseX,startY+lengthY,mouseX,height);
  fill(#ffc7c7);
  //line(100,250,200,250);
  textFont(font2);
  textSize(13);
  text("用 餐 高 峰 期",650,533);
  textFont(font);
  textSize(25);
  text("PEAK TIME",650,550);
  }
  }
}



void page3(){
  
  image(imgmap,10,10,width,height);
  image(imgpk,818,423,160,160);
  textFont(font);
  fill(255);
  textSize(80);
  text("PK",840,520);
  textFont(font2);
  textSize(20);
  text("餐 厅 擂 台",845,550);
  fill(50);
  textSize(10);
  text("两 个 食 堂 各 时 间 段 流 量 擂 台",826.5,579);
  drawOrbiter();
  if (mouseX > 820 && mouseX < 960 && mouseY > 430 && mouseY < 590){
    fill(255,150);
    noStroke();
    rect(820,430,140,140);
    if(mousePressed){
      pagehint = 4;
    } 
  }
  
  if (mouseX >200 && mouseX<400 && mouseY >300 && mouseY<500){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,300,400);
    text("第一餐饮大楼",mouseX+10,mouseY-10);
  }else if(mouseX>470 && mouseX<670 && mouseY>340 && mouseY<540){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,570,440);
    text("第二餐饮大楼",mouseX+10,mouseY-10);
  }else if(mouseX>320 && mouseX<520 && mouseY>120 && mouseY<320){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,420,220);
    text("第三餐饮大楼",mouseX+10,mouseY-10);
   }else if(mouseX>50 && mouseX<250 && mouseY>100 && mouseY<300){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,150,200);
    text("第四餐饮大楼",mouseX+10,mouseY-10);
    }else if(mouseX>600 && mouseX<800 && mouseY>380 && mouseY<580){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,700,480);
    text("第五餐饮大楼",mouseX+10,mouseY-10);
    }else if(mouseX>700 && mouseX<900 && mouseY>100 && mouseY<300){
    textSize(20);
    stroke(100);
    strokeWeight(1);
    line(mouseX,mouseY,800,200);
    text("第六餐饮大楼",mouseX+10,mouseY-10);}
    
  
}


void page4(){
  image(img3,0,0,width,height);
  updatecanteentable();
  mycanteen[0].drawbarleft();
  mycanteen[0].drawbarright();
  canteenline();
  imageMode(CENTER);
  image(imgcanteenvs,width/2,height/2,413,290);
  image(imgback,width/2,500,200,110);
  
  fill(#ffc7c7);
  textFont(font2);
  textSize(38);
  if(canteenhint == 1){
    text("一餐",370,275);
  }else if(canteenhint ==2){
    text("二餐",370,275);
  }else if(canteenhint ==3){
    text("三餐",370,275);
  }else if(canteenhint ==4){
    text("四餐",370,275);
  }else if(canteenhint ==5){
    text("五餐",370,275);
  }else if(canteenhint ==6){
    text("六餐",370,275);}
    
  fill(#8785a2);
  if(canteenhint2 == 1){
    text("一餐",540,275);
  }else if(canteenhint2 ==2){
    text("二餐",540,275);
  }else if(canteenhint2 ==3){
    text("三餐",540,275);
  }else if(canteenhint2 ==4){
    text("四餐",540,275);
  }else if(canteenhint2 ==5){
    text("五餐",540,275);
  }else if(canteenhint2 ==6){
    text("六餐",540,275); }
  
  imageMode(CORNER);
  textFont(font);
  fill(100);
  textSize(28);
  text("<BACK",444,508);
  if (mouseX > 440 && mouseX < 560 && mouseY > 455 && mouseY < 500){
    fill(255,100);
    noStroke();
    rect(440,455,120,20);
    if(mousePressed){
      pagehint = 3;
    }

  }
  
}