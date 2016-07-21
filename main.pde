import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

void setup(){
  size(300,600);
  background(0,0,0);
  strokeWeight(3);
  minim = new Minim(this);
  song = minim.loadFile("nahz_original_mix.mp3", 1024);
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
}

float[] H1 = {0,100,200};
float[] H2 = {100,200,300,400,500};
float[] H3 = {100,200,300};
float[] V1 = {100,200};
float[] V2 = {100,200,300,400,500,600};


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
  stroke(0,229,238);
  line(h1,h2,h3,h2);
}

// choose a random vertical line to display
void v_display(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(0,229,238);
  line(v1,0,v1,v2);
}

// 'remove' a random horitzonal line
void h_remove(){
  float h1 = H1[int(random(H1.length))];
  float h2 = H2[int(random(H2.length))];
  float h3 = H3[int(random(H3.length))];
  stroke(127,255,0);
  line(h1,h2,h3,h2);
}

// 'remove' a random veritcal line
void v_remove(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(127,255,0);
  line(v1,0,v1,v2);
}
