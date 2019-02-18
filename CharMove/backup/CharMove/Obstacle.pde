color c2 =color(219,43,48),c1=color(20,10,37);
int Y_AXIS = 1 ;
int X_AXIS = 2 ;

class Obstacle{
  boolean onScreen = true;
  float x,y,w,h;
  int clr = 0;
  float middleX,middleY,cat1,cat2,ip;
  Obstacle(float ox,float oy,float ow, float oh){
    
    x=ox*m;
    y=oy*m;
    w=ow*m;
    h=oh*m;
    middleX = (ox+ow/2)*m;
    middleY = (oy+oh/2)*m;
    cat1 = (oh/2)*m; 
    cat2 = (ow/2)*m;
    ip = sqrt(pow(cat1,2)+pow(cat2,2));
  
  }
 
  void show(){
    int ax  = 1;
    if(w>h){ax=Y_AXIS;} else{ ax=X_AXIS;}
    // fill(219,43,48);
    // noStroke();
    // rect(x,y,w,h);
    if (y<height/2){
    setGradient(int(x),int(y),w,h,c1,c2,ax);
    }
    else{
    setGradient(int(x),int(y),w,h,c2,c1,ax);
    }
    // fill(255);
    // ellipse(middleX,middleY,5,5);
    
  }
  void prnt(){
 // print(cat1);
 //  print(cat2);
  //print(ip);
  }

   void cam(){
   if(x+w<worldCamera.pos.x||x>worldCamera.pos.x+width){
     onScreen = false;
   }
   else{onScreen= true;}
 }
}
