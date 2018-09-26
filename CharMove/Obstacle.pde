
class Obstacle{
  int x,y,w,h;

  float middleX,middleY,cat1,cat2,ip;
  Obstacle(int ox,int oy,int ow, int oh){
    x=ox;
    y=oy;
    w=ow;
    h=oh;
    middleX = ox+ow/2;
    middleY = oy+oh/2;
    cat1 = oh/2; 
    cat2 = ow/2;
    ip = sqrt(pow(cat1,2)+pow(cat2,2));
  
  }
 
  void show(){
    fill(0);
    rect(x,y,w,h);
    fill(255);
    ellipse(middleX,middleY,5,5);
    
  }
  void prnt(){
 // print(cat1);
 //  print(cat2);
  print(ip);
  }
}
