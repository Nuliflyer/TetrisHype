class Line{
   color colour;
   int xPosition;
   int yPosition;
   block[][] line = new block[10][20];
   
   Line(block[][] board){
     xPosition = 3;
     yPosition = 0;
     colour = color(200,200,20);
      = board;
     line[xPosition][yPosition].display(colour);
     line[xPosition + 1][yPosition].display(colour);
     line[xPosition + 2][yPosition].display(colour);
     line[xPosition + 3][yPosition].display(colour);
   }
   boolean moveDown(){
     if(yPosition + 1 < 20 && (line[xPosition][yPosition+1].checkVisable() ||line[xPosition + 1][yPosition+1].checkVisable() ||line[xPosition + 2][yPosition+1].checkVisable() ||line[xPosition + 3][yPosition+1].checkVisable())){
       return true;
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
       return false;
     }
   }
   boolean moveRight(){
    if(xPosition + 2 < 10 && (line[xPosition + 2][yPosition].checkVisable() ||line[xPosition+2][yPosition+1].checkVisable())){
       return true;
     }
     else{
       line[xPosition][yPosition].invisible();
       xPosition++;
       line[xPosition + 3][yPosition].display(colour);
       return false;
     }
   }
    boolean moveLeft(){
    if(xPosition -1 >=0 && (line[xPosition - 1][yPosition].checkVisable() ||line[xPosition - 1][yPosition+1].checkVisable())){
       return true;
     }
     else{
       line[xPosition+1][yPosition].invisible();
       xPosition--;
       line[xPosition][yPosition].display(colour);
       line[xPosition][yPosition + 1].display(colour);
       return false;
     }
   }
}