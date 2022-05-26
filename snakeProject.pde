int lives = 2;
boolean check = false;
int highscore = -1;
int score =0;
int angle=0;
int snakesize=5;
int time=0;
int[] headx= new int[2500];
int[] heady= new int[2500];
int applex=(round(random(47))+1)*8;  //Random allocation of the apple
int appley=(round(random(47))+1)*8;
boolean redo=true;
boolean stopgame=false;            //These are the variables necessary to plot the game characters and boundaries.

void setup()
{
  restart();
  textAlign(CENTER);
}
public void settings() {
  size(600, 600);
}

void draw()
{
  if (stopgame)          
  {
  }
  
  else
  {
  time+=1;
  fill(255,0,0);          //Colour of apple and pos of apple
  stroke(0);
  rect(applex,appley,8,8);
  fill(0);
  stroke(0);
  rect(0,0,width,8);
  rect(0,height-8,width,8);
  rect(0,0,8,height);
  rect(width-8,0,8,height);        
  
  if ((time % 5)==0)
  {
    travel();
    display();
    checkdead();              
  }
  }
}

void keyPressed()                    // The controls are set to up, down, left and right arrows of the keyboard. You can change them accordingly.
{
  if (key == CODED)
  {
    if (keyCode == UP && angle!=270 && (heady[1]-8)!=heady[2])
    {
      angle=90;
    }
    if (keyCode == DOWN && angle!=90 && (heady[1]+8)!=heady[2])          //Movement of the snake
    {
      angle=270;
    }if (keyCode == LEFT && angle!=0 && (headx[1]-8)!=headx[2])
    {
      angle=180;
    }if (keyCode == RIGHT && angle!=180 && (headx[1]+8)!=headx[2])
    {
      angle=0;
    }
    if (keyCode == SHIFT)
    {
      restart();
    }
    
  }
}

void travel()
{
  for(int i=snakesize;i>0;i--)                    // loop for the creation of snake.
  {
    if (i!=1)
    {
      headx[i]=headx[i-1];
      heady[i]=heady[i-1];
    }
    else
    {
      switch(angle)
      {
        case 0:
        headx[1]+=8;
        break;
        case 90:
        heady[1]-=8;
        break;
        case 180:
        headx[1]-=8;
        break;
        case 270:
        heady[1]+=8;
        break;
      }
    }
  }
  
}

void display()            // displaying the snake as well as the apple.
{
  if (headx[1]==applex && heady[1]==appley)
  {
    snakesize+=1; //snakesize increasing
    score += 1;
    redo=true;
    while(redo)
    {
      applex=(round(random(47))+1)*8;
      appley=(round(random(47))+1)*8;
      for(int i=1;i<snakesize;i++)
      {     
        if (applex==headx[i] && appley==heady[i])
        {
          redo=true;
        }
        else
        {
          redo=false;
          i=1000;
        }
      }
    }
  }
  stroke(255,255,255);
  fill(0);
  rect(headx[1],heady[1],8,8);
  fill(255);
  rect(headx[snakesize],heady[snakesize],8,8);
}

void checkdead()          //end game method to check if the snake is dead or alive.
{
  for(int i=2;i<=snakesize;i++)
  {
    if (headx[1]==headx[i] && heady[1]==heady[i])
    {
      check = true;
      fill(255);
      rect(125,125,160,100);
      fill(0);
      //lives--;
      //if(lives > 0){
      //  text("Lives: " + lives, 200, 250);
      //}
      if(score > highscore) {
    highscore = score;
      }
      text("Score:  "+str(score)+" apples eaten",200,175);
      text("High Score:  "+str(highscore),200,200);
      text("Press SHIFT to RESTART",200,225);
     //  if(lives == 0) {
      //  text("GAME OVER",200,275);
      //}
      stopgame=true;
      score = 0;
    }
    else if (headx[1]>=(width-8) || heady[1]>=(height-8) || headx[1]<=0 || heady[1]<=0)
    {
      check = true;
      fill(255);
      rect(125,125,160,100);
      fill(0);
      //lives--;
      //if(lives > 0){
      //  text("Lives: " + lives, 200, 250);
      //}
      if(score > highscore) {
    highscore = score;
      }
      text("Score:  "+str(snakesize-5)+" apples eaten",200,175);
      text("High Score:  "+str(highscore),200,200);
      text("Press SHIFT to RESTART",200,225);
      //if(lives == 0) {
      //  text("GAME OVER",200,275);
      //}
      stopgame=true;
      score = 0;
    }
  }
  if(check)
  {
     lives--;
      if(lives > 0){
        text("Lives: " + lives, 200, 250);
      } else if(lives <= 0) {
        text("GAME OVER",200,275);
      }
        
  }
 
}

/* void control()
{
  background(0,0,255);
  headx[1]=200;
  heady[1]=200;
  for(int i=2;i<1000;i++)
  {
    headx[i]=0;
    heady[i]=0;
  }
  stopgame=false;
  applex=(round(random(47))+1)*8;
  appley=(round(random(47))+1)*8;
  snakesize=5;
  time=0;
  angle=0;
  redo=true;
}
*/

void restart()        //if we press shift then the game is restarted. SHIFT is the key to restart the game. You can change it as well to any other key.
{
  background(255);
  headx[1]=200;
  heady[1]=200;
  for(int i=2;i<1000;i++)
  {
    headx[i]=0;
    heady[i]=0;
  }
  stopgame=false;
  applex=(round(random(47))+1)*8;
  appley=(round(random(47))+1)*8;
  snakesize=5;
  time=0;
  angle=0;
  redo=true;
}
void lives() {
  if(lives > 0) {
    lives--;
  } if(lives == 0) {
    print("GAME OVER");
  }


    
}
