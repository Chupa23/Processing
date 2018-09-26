

void setBS(){
  
  data.setInt("score", BScore);
  saveJSONObject( data,"save.json" );
  
  int sc = data.getInt("score");
  BScore=sc;
 // print(sc);
  
}

void loadBS(){
  int sc = data.getInt("score");
  BScore=sc;
  //print( "best score:" +sc);

}    
