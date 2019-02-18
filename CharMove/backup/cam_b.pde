class Camera{
    PVector pos;
   Camera(){
       pos = new PVector(0,0);
   }
   void set(){
       pos.x= player.x-width/2.;
      // pos.y= player.y-height/2;
   }
}

class Button{
   float x,y,h,w,f;
 Button(  float bx , float by , float bw , float bh, float function){
  x = bx*m;
  y=by*m;
  w=bw*m;
  h=bh*m;
  f=function;
 }

  void show(){
   noFill();
   stroke(255);
   rect(x,y,w,h);
  }
  
  void run(){
   if(f == 1) { player.control("right");}
   else if(f==2){player.control("left");}
   else if(f==3){player.jump();}
  }
}
