class Button{
  float x,y,w,h;
  String act;
  Button(float x_ , float y_, float w_ ,float h_ , String action){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    act = action;
  }
 
 void action(){
  switch(act){
   case "restart": restart(); 
   
  }
 }
 
  void show(){
    fill(120);
    rect(x,y,w,h);
    fill(0);
    textSize(100);//(20);//<<<<<<<<<<<<<<<<<<<<<<--------------------------
    text(act,x+w/2-150,y+h/2+25);//(act,x+w/2-20,y+h/2);//<<<<<<<<<<-----------------
  }
  
}  
