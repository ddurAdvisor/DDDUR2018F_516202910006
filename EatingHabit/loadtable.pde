void loadtable(){
  int Xindex = 0;
  for (TableRow row : table.rows()){
      index[Xindex] = row.getInt("favor");
      Xindex ++; 
  }
  for (int i = 0; i < myfavor.length; i++){
    myfavor[i] = new favor(i,index[i]);
  }
  Xindex = 0;
  for (TableRow row : timetable.rows()){
        time[Xindex] = row.getInt("time1");
        Xindex ++;}
}

void timeloadtable(){
  int Xindex = 0;
  //导入用餐高峰期数值
  for (TableRow row : timetable.rows()){
      if (gender == 0 && degree ==0){
      time[Xindex] = row.getInt("time1");
      Xindex ++;   
      }else if (gender == 1 && degree == 0){
      time[Xindex] = row.getInt("time2");
      Xindex ++;
      }else if (gender == 2 && degree == 0){
      time[Xindex] = row.getInt("time3");
      Xindex ++;
      }else if (gender == 0 && degree == 1){
      time[Xindex] = row.getInt("time4");
      Xindex ++;
      }else if (gender == 1 && degree == 1){
      time[Xindex] = row.getInt("time5");
      Xindex ++;
      }else if (gender == 2 && degree == 1){
      time[Xindex] = row.getInt("time6");
      Xindex ++;
      }else if (gender == 0 && degree == 2){
      time[Xindex] = row.getInt("time7");
      Xindex ++;
      }else if (gender == 1 && degree == 2){
      time[Xindex] = row.getInt("time8");
      Xindex ++;
      }else if (gender == 2 && degree == 2){
      time[Xindex] = row.getInt("time9");
      Xindex ++;
      }else if (gender == 0 && degree == 3){
      time[Xindex] = row.getInt("time10");
      Xindex ++;
      }else if (gender == 1 && degree == 3){
      time[Xindex] = row.getInt("time11");
      Xindex ++;
      }else if (gender == 2 && degree == 3){
      time[Xindex] = row.getInt("time12");
      Xindex ++;
    }
  }

}
void canteenloadtable(){
  int Xindex = 0;
  //导入六个餐厅数值
  for (TableRow row : canteentable.rows()){
        canteentable1[Xindex] = row.getInt("canteen1");
        Xindex ++;}
  Xindex = 0;
  for (TableRow row : canteentable.rows()){
        canteentable2[Xindex] = row.getInt("canteen2");
        Xindex ++;}
  Xindex = 0;
  for (TableRow row : canteentable.rows()){
        canteentable3[Xindex] = row.getInt("canteen3");
        Xindex ++;}
  Xindex = 0;
  for (TableRow row : canteentable.rows()){
        canteentable4[Xindex] = row.getInt("canteen4");
        Xindex ++;}
  Xindex = 0;
  for (TableRow row : canteentable.rows()){
        canteentable5[Xindex] = row.getInt("canteen5");
        Xindex ++;}
  Xindex = 0;
  for (TableRow row : canteentable.rows()){
        canteentable6[Xindex] = row.getInt("canteen6");
        Xindex ++;}
  Xindex = 0;
  //初始化数值
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable1[i];
  canteenindex2[i] = canteentable2[i];}
  
}

void updatecanteentable(){
  if (canteenhint == 1){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable1[i];}}
  if (canteenhint == 2){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable2[i];}}
  if (canteenhint == 3){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable3[i];}}
  if (canteenhint == 4){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable4[i];}}
  if (canteenhint == 5){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable5[i];}}
  if (canteenhint == 6){
  for(int i = 0; i < 22 ; i++){
  canteenindex[i] = canteentable6[i];}}
  
  if (canteenhint2 == 1){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable1[i];}}
  if (canteenhint2 == 2){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable2[i];}}
  if (canteenhint2 == 3){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable3[i];}}
  if (canteenhint2 == 4){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable4[i];}}
  if (canteenhint2 == 5){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable5[i];}}
  if (canteenhint2 == 6){
  for(int i = 0; i < 22 ; i++){
  canteenindex2[i] = canteentable6[i];}}

}

        
      
  



void updatetable(){
    int Xindex = 0;
    for (TableRow row : table.rows()){
      if (gender == 0 && degree ==0){
      newindex[Xindex] = row.getInt("favor");
      myfavor[Xindex].updatehint = true;
      Xindex ++;   
      }else if (gender == 1 && degree == 0){
      newindex[Xindex] = row.getInt("favor2");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 2 && degree == 0){
      newindex[Xindex] = row.getInt("favor3");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 0 && degree == 1){
      newindex[Xindex] = row.getInt("favor4");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 1 && degree == 1){
      newindex[Xindex] = row.getInt("favor5");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 2 && degree == 1){
      newindex[Xindex] = row.getInt("favor6");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 0 && degree == 2){
      newindex[Xindex] = row.getInt("favor7");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 1 && degree == 2){
      newindex[Xindex] = row.getInt("favor8");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 2 && degree == 2){
      newindex[Xindex] = row.getInt("favor9");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 0 && degree == 3){
      newindex[Xindex] = row.getInt("favor10");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 1 && degree == 3){
      newindex[Xindex] = row.getInt("favor11");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
      }else if (gender == 2 && degree == 3){
      newindex[Xindex] = row.getInt("favor12");
      myfavor[Xindex].updatehint = true;
      Xindex ++;
    }
  }
  //for (int i = 0; i < newfavor.length; i++){
  //  newfavor[i] = new favor(i,newindex[i]);
  //}
  
  

  }

 void loadplacetable(){
   int Xindex= 0;
     for (TableRow row : placetable.rows()){
      placeindex[Xindex] = row.getInt("place1");
      Xindex ++;
      }
 }
 
 void updateplacetable(){
     int Xindex= 0;
     for (TableRow row : placetable.rows()){
      if (gender == 0 && degree ==0){
      newplaceindex[Xindex] = row.getInt("place1");
      Xindex ++;   
      }else if (gender == 1 && degree == 0){
      newplaceindex[Xindex] = row.getInt("place2");
      Xindex ++;
      }else if (gender == 2 && degree == 0){
      newplaceindex[Xindex] = row.getInt("place3");
      Xindex ++;
      }else if (gender == 0 && degree == 1){
      newplaceindex[Xindex] = row.getInt("place4");
      Xindex ++;
      }else if (gender == 1 && degree == 1){
      newplaceindex[Xindex] = row.getInt("place5");
      Xindex ++;
      }else if (gender == 2 && degree == 1){
      newplaceindex[Xindex] = row.getInt("place6");
      Xindex ++;
      }else if (gender == 0 && degree == 2){
      newplaceindex[Xindex] = row.getInt("place7");
      Xindex ++;
      }else if (gender == 1 && degree == 2){
      newplaceindex[Xindex] = row.getInt("place8");
      Xindex ++;
      }else if (gender == 2 && degree == 2){
      newplaceindex[Xindex] = row.getInt("place9");
      Xindex ++;
      }else if (gender == 0 && degree == 3){
      newplaceindex[Xindex] = row.getInt("place10");
      Xindex ++;
      }else if (gender == 1 && degree == 3){
      newplaceindex[Xindex] = row.getInt("place11");
      Xindex ++;
      }else if (gender == 2 && degree == 3){
      newplaceindex[Xindex] = row.getInt("place12");
      Xindex ++;
    }
     }
 }