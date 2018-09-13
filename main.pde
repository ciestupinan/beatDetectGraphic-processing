import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
PShader blur; //new

void setup(){
  size(300,550);
  background(0,0,0);
  strokeWeight(6);
  minim = new Minim(this);
  song = minim.loadFile("the_mother_we_share.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
}

float[] H1 = {0,50,100,150,200};
float[] H2 = {0,50,100,150,200,250,300,350,400,450,500,550};
float[] H3 = {0,50,100,150,200,250,300};
float[] V1 = {0,50,100,150,200,250,300};
float[] V2 = {0,50,100,150,200,250,300,350,400,450,500,550};

void draw(){
  beat.detect(song.mix);
  h_display();
  v_display();
  
  if (beat.isOnset() || beat.isKick() || beat.isSnare() || beat.isHat()){
    h_remove();
    v_remove();
  }  
}

// choose a random horizontal line to display
void h_display(){
  float h1 = H1[int(random(H1.length))];
  float h2 = H2[int(random(H2.length))];
  float h3 = H3[int(random(H3.length))];
 
  stroke(0,255,253);
  line(h1,h2,h3,h2);
}

//choose a random vertical line to display
void v_display(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(0,255,253);
  line(v1,0,v1,v2);
}

void h_remove(){
  float h1 = H1[int(random(H1.length))];
  float h2 = H2[int(random(H2.length))];
  float h3 = H3[int(random(H3.length))];
  stroke(127,255,0);
  line(h1,h2,h3,h2);
}

void v_remove(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(127,255,0);
  line(v1,0,v1,v2);
}
