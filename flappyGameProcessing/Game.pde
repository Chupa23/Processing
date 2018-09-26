Player crt;
ArrayList <Obstacle> obs;
boolean game= false;
boolean gameOver = false; PFont mono;

int BScore;
PImage char_img;
PImage background;
PImage newBack;

JSONObject data;
int backgroundZone ;
 Button rs;

void setup(){
   background(50);
 textSize(100);
 text("Loading...",100,height/2);
 
  data = loadJSONObject("save.json");
  loadBS();

 char_img = loadImage("Aurel.png");
 background = loadImage("background_t.png");
 background.resize(0,3840);

 //size(100,200,P2D);
 fullScreen(P2D);
 orientation(PORTRAIT);   
 mono = createFont("Georgia" ,300 );
 textFont(mono);
  crt= new Player(200,300);//(50,100);//>>>>>>>>>--------------
 obs = new ArrayList<Obstacle>();
 
  rs = new Button (width/2-300,height/2-200,600,200,"restart");//(width/2-50,100,100,50,"restart");//<<<<<<<<<<----------------------
// grav = new PVector(0,0.02);

}

//================================================================================================
 void draw(){
   getBackground();
   
  if(game){
   image(background,0,0,width,height,0,backgroundZone,width,height+backgroundZone);

  if (frameCount%130==0){
   obs.add(new Obstacle(random(-700,-100)));//(-200,-100)));//<<<<<<<<<<<<_-------------------
  }

//Player
crt.show();
crt.update();
crt.detect();

//Obstacle
 for (int i = obs.size() - 1; i>=0;i-- ){ 
 Obstacle o = obs.get(i);
 if (o.pos1.x + o.obWidth < 0){
   obs.remove(i);
 }
 else{
  o.update();
  o.show();
 } 
}
  }
  
  
  else if (!gameOver && !game){
      image(background,0,0,width,height,0,backgroundZone,width,height+backgroundZone);
    crt.show();
  }
  else if (gameOver){
     image(background,0,0,width,height,0,backgroundZone,width,height+backgroundZone);
   crt.show();
   for(int i = 0; i<obs.size();i++){
        Obstacle o = obs.get(i);
        o.show();
   }
      rs.show();  
  }
  fill(0,255,0);
  textSize(50);
  text(frameRate , 100,100);
  text("Best Score: "+BScore,100,200);
  fill(0);
  textSize(200);//(50);//<<<<<<<<<<<<<<<<<<<<<<-----------------------
  text(round(score), width/2-100,160);//50);//<<<<<<<<<<<<------------
}

//================================================================================

void mousePressed(){
  if (!gameOver){game=true;}
   crt.jump();
   
   if (gameOver){
   if (mouseX>rs.x&&mouseX<rs.x+rs.w&&mouseY<rs.y+rs.h&&mouseY>rs.y){
    rs.action();
   }
   }
}

void restart(){
     obs.clear();
     score = 0;
     crt.pos.y=height/2;
     gameOver=false;
}
