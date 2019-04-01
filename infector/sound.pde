import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
AudioOutput out;

BeatDetect beat;
float eRadius;

int j = 0;

ArrayList<PVector> soundLevels = new ArrayList<PVector>();

void soundWaveform()
{
  strokeWeight(0.5);
  
  for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    
    line( x1, 550 + player.left.get(i)*50, x2, 550 + player.left.get(i+1)*50 );
    line( x1, 580 + player.right.get(i)*50, x2, 580 + player.right.get(i+1)*50 );
  }
  j++;
  
  float posx = map(player.position(), 0, player.length(), 0, width);
  stroke(30,200,200);
  line(posx, 530, posx, height);
  line(posx, 510, posx, 510 - player.left.level()*300);
  
  soundLevels.add(new PVector(posx, 520 - player.left.level()*300));
  
  for (int i = 0; i < soundLevels.size() - 1; i++)
  {
      line(soundLevels.get(i).x, 520, soundLevels.get(i).x, soundLevels.get(i).y);
  }
}

void detectBeat()
{
  beat.detect(player.mix);  
  
  if ( beat.isOnset() ) 
  {
    eRadius = 400;
    scaleFlow = 1.75;
    

  }
  
      eRadius *= 0.95;
  scaleFlow *= 0.95;
  if ( eRadius < 220 ) eRadius = 220;
  if ( scaleFlow < 1 ) scaleFlow = 1;
  
}
