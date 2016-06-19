void setup(){
  size(300,600);
  background(255,255,255);
  strokeWeight(3);
}

float[] H1 = {0,100,200};
float[] H2 = {100,200,300,400,500};
float[] H3 = {100,200,300};
float[] V1 = {100,200};
float[] V2 = {100,200,300,400,500,600};

int i = 0;

void draw(){
  h_display();
  v_display();
  
  if (i % 8 == 0){
    h_remove();
  }
  if (i % 9 == 0){
    v_remove();
  }

  i++;
}

// choose a random horizontal line to display
void h_display(){
  float h1 = H1[int(random(H1.length))];
  float h2 = H2[int(random(H2.length))];
  float h3 = H3[int(random(H3.length))];
  stroke(0,0,0);
  line(h1,h2,h3,h2);
}

//choose a random vertical line to display
void v_display(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(0,0,0);
  line(v1,0,v1,v2);
}

//'remove' a random horitzonal line
void h_remove(){
  float h1 = H1[int(random(H1.length))];
  float h2 = H2[int(random(H2.length))];
  float h3 = H3[int(random(H3.length))];
  stroke(255,255,255);
  line(h1,h2,h3,h2);
}

//'remove' a random veritcal line
void v_remove(){
  float v1 = V1[int(random(V1.length))];
  float v2 = V2[int(random(V2.length))];
  stroke(255,255,255);
  line(v1,0,v1,v2);
}
