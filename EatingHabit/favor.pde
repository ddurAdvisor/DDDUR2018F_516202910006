class favor{
  float sales,newsales;
  int i;
  float favorradius, Xellipse ,Yellipse, newXellipse, newYellipse,xPos, yPos;
  float Xspeed = 0.0;
  float Yspeed = 0.0;
  float theta = 22.5;
  float speed = 0.2;
  boolean hint = false;  
  boolean updatehint = false;
  float textsize1,textsize2,textsize3;
  String[] foodname = new String [8];
  String[] favorshop = new String[8];
  float realsales;
  
  
  favor(int it, float xt){
    i = it;
    //xt =  1+xt2/49;
   // sales = xt;
   realsales = xt;
    if ( xt > 20){
      xt = 20 + xt/10;
    }
    sales = map(xt,0,50,200,100);
    theta = theta * (2*i + 1) * PI / 180;
    Xellipse = sales *sales* cos(theta) * 0.1;
    Yellipse = sales *sales*  sin(theta) * 0.1;
    favorradius = map(sales,100,250,100,10);
    foodname[0]="面   食";
    foodname[1]="客   饭";
    foodname[2]="清   真";
    foodname[3]="甜   点";
    foodname[4]="西   餐";
    foodname[5]="川   辣";
    foodname[6]="粤   式";
    foodname[7]="小   吃";
    favorshop[0] = "吉祥小厨"+"\n"+"西北面点"+"\n"+"六餐面馆";
    favorshop[1] = "淮扬快餐"+"\n"+"大众餐厅"+"\n"+"绿园餐厅";
    favorshop[2] = "新疆餐厅"+"\n"+"一餐清真食堂";
    favorshop[3] = "梦圆面包房"+"\n"+"甜魔咖啡"+"\n"+"四餐面包房";
    favorshop[4] = "吉姆利德"+"\n"+"二餐西餐厅"+"\n"+"伊诺咖啡简餐";
    favorshop[5] = "苏记麻辣烫"+"\n"+"串串烧"+"\n"+"川味点心";
    favorshop[6] = "中式点心"+"\n"+"江南小吃"+"\n"+"顾日北小吃";
    favorshop[7] = "烧腊饭"+"\n"+"风味煲仔饭"+"\n"+"笼仔饭";
    
    
     
  }
  
 
  void updatefavor(){
  frameRate(2000);
  if (updatehint){
    
    //设定移动目标
    newXellipse = newsales  * newsales* cos(theta) * 0.0074;
    newYellipse = newsales  *newsales*sin(theta) * 0.0074;
    favorradius = map(newsales,100,250,100,10);
    println("00i= "+i+", favorradius  "+favorradius+", newsales= "+newsales);
    
    //确定移动方向
    if(newXellipse > Xellipse){
      xPos = 1;
      Xspeed = abs(cos(theta)*speed)*abs(newXellipse-Xellipse);
    }else if(newXellipse < Xellipse){
      xPos = -1;
      Xspeed = -abs(cos(theta)*speed)*abs(newXellipse-Xellipse);
    }
    if(newYellipse > Yellipse){
      yPos = 1;
      Yspeed = abs(sin(theta)*speed)*abs(newXellipse-Xellipse);
    }else if(newYellipse < Yellipse){
      yPos = -1;
      Yspeed = -abs(sin(theta)*speed)*abs(newXellipse-Xellipse);
    }
    
    //判断是否移动到指定位置
    if(newXellipse-3 >= Xellipse && xPos == -1 ){xPos = 0 ;}  
    if(newXellipse+3 <= Xellipse && xPos == 1 ){xPos = 0 ;}    
    if(newYellipse-3 >= Yellipse && yPos == -1){yPos = 0 ;} 
    if(newYellipse+3 <= Yellipse && yPos == 1){yPos = 0 ;} 
    
    
    if(xPos == 0 && yPos == 0){hint = true;
    }
    
   //速度设定 
   Xellipse = Xellipse + Xspeed;
   Yellipse = Yellipse + Yspeed;
   
    }

  }
    
  void buildfavor(){
  frameRate(2000);
  
  pushMatrix(); 
  ellipseMode(CENTER);
  translate(xCenter,yCenter); 
  fill(#3c3c3c);
  noStroke();
  ellipse(Xellipse, -Yellipse, favorradius+3, favorradius+3);
  image(imgfood[i],Xellipse-favorradius/2, -Yellipse-favorradius/2, favorradius, favorradius);
  
  if(mouseX > xCenter+Xellipse-favorradius/2 && mouseX < xCenter+Xellipse+favorradius/2 && mouseY > yCenter-Yellipse-favorradius/2 && mouseY < yCenter-Yellipse+favorradius/2){
  fill(#3c3c3c);
  stroke(#8888b5);
  strokeWeight(5);
  ellipse(Xellipse, -Yellipse, favorradius+3, favorradius+3);
  
  //鼠标移动后显示
  fill(#ffffff);
  textFont(font2);
  textsize1 = map(favorradius,10,80,3,10);
  textSize(textsize1);
  textAlign(CENTER,CENTER);
  text("消费占比",Xellipse, -Yellipse-textsize1*2);
  
  textFont(font);
  textsize2 = map(favorradius,10,80,8,30);
  textSize(textsize2);
  textAlign(CENTER,CENTER);
  text(ceil(realsales)+"%",Xellipse, -Yellipse+3);
  
  //显示具体商家名字
  fill(#3c3c3c);
  textFont(font2);
  
  textAlign(CENTER,CENTER);
  textSize(20);
  text("「 风味餐厅TOP3 」",-410,-120);
  textSize(15);
  text(favorshop[i],-410,-60);
  println(favorshop[i]);
  }
  
  //口味名字
  fill(#3c3c3c);
  textFont(font2);
  textsize3 = map(favorradius,10,80,6,14);
  textSize(textsize3);
  textAlign(CENTER,CENTER);
  text(foodname[i],Xellipse, -Yellipse+favorradius/1.6);
  popMatrix();
  
  
  
  }
  
 }
 
 