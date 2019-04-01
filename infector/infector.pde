import  processing.opengl.*;
import java.util.*;


PShape s;
boolean disp = true;
//PShape ss;
boolean saveConfig = false;



//String siteMeshFile = "Baby_G2.stl";
//String siteDisplayMeshFile = "Baby_G3.stl";

void setup() {
  size(800, 600, P3D);
  s = loadShape("cubeillusion.obj");
  //s = loadShape("teapot.obj");
  s.setStroke(color(255));
  frameRate(35);
  
  childSpawners = new ArrayList<Flow>();
  listOfVertices = new ArrayList<PVector>();
  
  for (int i = 0; i < s.getChildCount() - 1; i++)
  {
    for (int j = 0; j < s.getChild(i).getVertexCount() - 1; j++) {
      listOfVertices.add(s.getChild(i).getVertex(j));  
    }
  }
  
  println(listOfVertices.size());
  
  minim = new Minim(this);
  player = minim.loadFile("groove.mp3");
  
  //beat detect
  beat = new BeatDetect();
  eRadius=220;
  
  
  out = minim.getLineOut();
}

float rotX = 0;
float rotY = 0;
float scaleObject =220;
float r = 10;
Set<PVector> set = new HashSet<PVector>();
float pressedX;
float pressedY;
float x;
float y;
boolean scaale = false;
float scaleFlow = 1;

PVector randomObjectPoint;
void draw() {
  
  //float amplitude = map(mouseY, 0, height, 0.4, 0.0);
  
  
  shapeMode(CORNER);
  s.disableStyle();
  background(0);
  

 
  //background(150,130,150);
  //backGroundColor();
  
  //object in z position to posit 200 in front
  
  lights();
  detectBeat();
  
  if (disp)
  {
  pushMatrix();
    translate(width/2, height/2);
    fill(255);
    rotateX(rotX);
    rotateY(rotY);
    
    
    scale(eRadius);
    
     
     
    //shape(s, 0, 0);  
           
    for (int i = 0; i < s.getChildCount(); i++) {
         PShape child = s.getChild(i);
         for (int j = 0; j < child.getVertexCount(); j++) {
           //println(child.getVertex(j));
           int k = j + 1;
           if (k > child.getVertexCount()-1)
           {
             k=0;
           }
           stroke(color(255,150,150,100));
           strokeWeight(0.003);
           
           line(child.getVertex(j).x,child.getVertex(j).y,child.getVertex(j).z,child.getVertex(k).x,child.getVertex(k).y,child.getVertex(k).z);
           point(child.getVertex(j).x, child.getVertex(j).y, child.getVertex(j).z);
          
          
          if (randomFace != null && randomFace.v1 != null && randomFace.v2 != null && randomFace.v3 != null)
          {
            stroke(color(0,150,250,100));
            strokeWeight(0.01);
            line(randomFace.v1.x,randomFace.v1.y,randomFace.v1.z,randomFace.v2.x,randomFace.v2.y,randomFace.v2.z);
            line(randomFace.v2.x,randomFace.v2.y,randomFace.v2.z,randomFace.v3.x,randomFace.v3.y,randomFace.v3.z);
            line(randomFace.v1.x,randomFace.v1.y,randomFace.v1.z,randomFace.v3.x,randomFace.v3.y,randomFace.v3.z);
            //point(randomFace.v1.x, randomFace.v1.y, randomFace.v1.z);
            //point(randomFace.v2.x, randomFace.v2.y, randomFace.v2.z);
            //point(randomFace.v3.x, randomFace.v3.y, randomFace.v3.z);
            triangleCenter();
          }
           //set.add(new PVector(child.getVertex(j).x, child.getVertex(j).y, child.getVertex(j).z));
         }
       }
    
  popMatrix();
  }
  
  //point(0,0,0);
  
  //draws red circle around mouse position
  noFill();
  strokeWeight(2);
  stroke(255,0,0);
  for(int i = 0; i < 360; i++)
  {
    x = mouseX + r*cos(i);
    y = mouseY + r*sin(i);
    point(x,y);  
  }
  
  if (mousePressed && (mouseButton == LEFT))
  {
    findVertices(x-width/2,y-height/2,r);
  }
  //ellipse(mouseX - width/2, mouseY - height/2, 40,40);
  
  
  /*if (vertices.size() != 0)
  {
    for(int i = 0; i < vertices.size();i++)
    point(vertices.get(i).x, vertices.get(i).y, vertices.get(i).z);
  }*/
  
  //drawSphere(anotherVertex.x,anotherVertex.y);
  if ((mouseButton == LEFT)) 
  {
    saveConfig = true;
    
  }
  
  
  pushMatrix();
  
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  if (scaale == true) scale(scaleFlow,scaleFlow,scaleFlow);
  for (int i = 0; i < childSpawners.size(); i++)
  {
    fill(20,100,150);
    //ellipse(childSpawners.get(i).get(childSpawners.get(i).size()-1).x,
      //      childSpawners.get(i).get(childSpawners.get(i).size()-1).y,10,10);
      
      //if (childSpawners.get(i).dead == false)
      //ellipse(childSpawners.get(i).getStartVector().x - width/2,
      //      childSpawners.get(i).getStartVector().y - height/2,10,10);
      
    for (int j = 0; j < childSpawners.get(i).getFlow().size() - 1; j++)
    {
      if(frameCount % 35 == 0) childSpawners.get(i).spawnAlpha += 0.05;
      stroke(30,200,200,childSpawners.get(i).getFlowAlpha().get(j));
      point(childSpawners.get(i).getFlow().get(j).x - width/2,
            childSpawners.get(i).getFlow().get(j).y - height/2,
            childSpawners.get(i).getFlow().get(j).z);
    }
    
  }
  popMatrix();
  
  drawSpawn();
  
  soundWaveform();
  
}


//Vertex anotherVertex = new Vertex(0,0,mouseX/2);
void chooseAnother()
{
  int r = (int)random(0, vert.size()-1);
  //anotherVertex = vert.get(r);
}

int numDivisions = 3;
float radius;
ArrayList<Vertex> vert = new ArrayList<Vertex>();

void drawSphere(float x, float y) {
  strokeWeight(10);
  float angle = TWO_PI / numDivisions;
  radius = mouseX / 2;
    for (int j = 0; j < numDivisions; j++) 
    {
      rotateY(angle);

      for (int i = 0; i < numDivisions; i++) 
      {
        float x1 =  cos(angle * i) * radius;
        float y1 =  sin(angle * i) * radius;
        if (saveConfig)
        {
          //vert.add(new Vertex(x1,y1,radius));
        }
        point(x1, y1, 0);
      }   
  }
  if(saveConfig)
  {
    for(int i = 0; i < vert.size(); i++)
    {

    }
  }
  if (saveConfig)
  {
    chooseAnother();
  }
  
  saveConfig = false;
  
}

//dark background border approximation
PImage mask;
void backGroundColor()
{
  mask = loadImage("mask.jpg");
  mask.resize(width,height);
  tint(255,17);
  image(mask,0,0);
}
