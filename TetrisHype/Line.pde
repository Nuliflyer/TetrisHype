class Line{
   color colour;
   int xPosition;
   int yPosition;
   block[][] line = new block[10][20];
   
   Line(block[][] board){
     xPosition = 3;
     yPosition = 0;
     colour = color(200,200,20);
     line = board;
     if(!line[xPosition][yPosition].checkVisable() &&
       !line[xPosition + 1][yPosition].checkVisable() &&
       !line[xPosition + 2][yPosition].checkVisable() &&
       !line[xPosition + 3][yPosition].checkVisable()){
       
         line[xPosition][yPosition].display(colour);
         line[xPosition + 1][yPosition].display(colour);
         line[xPosition + 2][yPosition].display(colour);
         line[xPosition + 3][yPosition].display(colour);
     } else{
       text("You Lose (you are trash get good m80)",100,20);
       noLoop();
     }
   }
   int moveDown(){
     int temp = 0;
     if(yPosition + 1 == 20 || (line[xPosition][yPosition+1].checkVisable() ||line[xPosition + 1][yPosition+1].checkVisable() ||line[xPosition + 2][yPosition+1].checkVisable() ||line[xPosition + 3][yPosition+1].checkVisable())){
       for(int j = 0; j < 20; j++){
         for(int i = 0; i < 10; i++){
           if(!line[i][j].isVisable){
             break;
           }
           if(i == 9){
             temp++;
             for(int index = 0; index < 10; index++){
               line[index][j].invisible();
               for( int k = j - 1; k >= 0; k--){
                 if(line[index][k].checkVisable()){
                   line[index][k+1].display(color(255, 0, 0));
                   line[index][k].invisible();
                 }
               }
             }
             //Drop all the shit.
             
           }
         }
       }
       return 2*temp + 1;
     }
     else{
       line[xPosition][yPosition].invisible();
       line[xPosition+1][yPosition].invisible();
       line[xPosition+2][yPosition].invisible();
       line[xPosition+3][yPosition].invisible();
       yPosition++;
       line[xPosition][yPosition].display(colour);
       line[xPosition + 1][yPosition].display(colour);
       line[xPosition + 2][yPosition].display(colour);
       line[xPosition + 3][yPosition].display(colour);
       return 0;
     }
    }
    boolean moveRight(){
    if(xPosition + 4 < 10 && !(line[xPosition + 4][yPosition].checkVisable())){
      line[xPosition][yPosition].invisible();
      xPosition++;
      line[xPosition + 3][yPosition].display(colour); 
      return true;
     }
     else{
       return false;
     }
    }
    boolean moveLeft(){
    if(xPosition -1 >=0 && (!line[xPosition - 1][yPosition].checkVisable())){
      line[xPosition+3][yPosition].invisible();
      xPosition--;
      line[xPosition][yPosition].display(colour);
      return true;
    }
    else{
       return false;
    }
  }
  block[][] updateArray(){
     return line;
   }
   
}