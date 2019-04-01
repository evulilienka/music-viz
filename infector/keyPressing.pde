
void keyPressed() 
{
  if (key == 'r')
  {
    //chooses random triangle face
    
    //println(randomFace.v1.x, randomFace.v1.y,randomFace.v1.z);
    //println(randomFace.v2.x, randomFace.v2.y,randomFace.v2.z);
    //println(randomFace.v3.x, randomFace.v3.y,randomFace.v3.z);
    
    loadVertices();
    loadNormals();
    loadFaces();
    
    chooseRandomFace();
    
    
  /*ss = createShape();
  ss.beginShape();
  
  strokeWeight(1);
  for (int i = 0; i < vertices.size(); i++) {
      ss.vertex(vertices.get(i).x,vertices.get(i).y,vertices.get(i).z);
  }
  ss.endShape();
  //println(ss.getVertexCount()); 
       /*for (int i = 0; i < ss.getVertexCount(); i++) {
         println(ss.getVertex(i));
       }*/
       
       for (int i = 0; i < s.getChildCount(); i++) {
         PShape child = s.getChild(i);
         for (int j = 0; j < child.getVertexCount(); j++) {
           //println(child.getVertex(j));
           set.add(new PVector(child.getVertex(j).x, child.getVertex(j).y, child.getVertex(j).z));
           //point(child.getVertex(j).x, child.getVertex(j).y, child.getVertex(j).z);
         }
         //println("_");
       }
       println("________________");
       println("________________");
       println("________________");
       //for (PVector p: set) {
         //println(p.x,p.y,p.z);
       //}
       
  }
  else if (key == 'w')
  {
    rotX+=0.5;
  }
  else if (key == 's')
  {
    rotX-=0.5;
  }
  else if (key == 'a')
  {
    rotY+=0.5;
  }
  else if (key == 'd')
  {
    rotY-=0.5;
  }
  else if (keyCode == UP)
  {
    scaleObject+=10;
  }
  else if (keyCode == DOWN)
  {
    scaleObject-=10;
  }
  else if (keyCode == LEFT)
  {
    r += 5;
  }
  else if (keyCode == RIGHT)
  {
    r -= 5;
  }
  
  else if(key == 'l')
  {
    addNewSpawn();

  }
  
  else if(key == 'm')
  {
    if ( player.isPlaying() )
    {
      player.pause();
    }

    else if ( player.position() == player.length() )
    {
      player.rewind();
      player.play();
      soundLevels = new ArrayList<PVector>();
    }
    else
    {
      player.play();
    }
  }
  else if (key == 'n')
  {
    scaale = !scaale;  
  }
  
  else if (key == 'b')
  {
    disp = !disp;  
  }
  
  else if (key == 'k')
  {
    eRadius -= 10;
    println(eRadius);
  }
}
