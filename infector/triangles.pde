Face randomFace = new Face(new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0),
                          new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0));

//chooses random triangle face from the face grid
void chooseRandomFace()
{
  //int rand = (int)random(0,s.getChildCount());
  /*int rand = 0;
  println(rand);
  PShape child = s.getChild(rand);
  if (child.getVertexCount() == 3)
  {  
    randomFace = new Face(new PVector(child.getVertex(0).x,child.getVertex(0).y,child.getVertex(0).z),
                          new PVector(child.getVertex(1).x,child.getVertex(1).y,child.getVertex(1).z),
                          new PVector(child.getVertex(2).x,child.getVertex(2).y,child.getVertex(2).z),
                          new PVector(0,0,0),new PVector(0,0,0),new PVector(0,0,0));
  */
  
  randomFace = faces.get(0);
}

//finds center of triangle face and draws vertex at this point
void triangleCenter()
{
  if (randomFace != null)
  {
      float centerX = (randomFace.v1.x + randomFace.v2.x + randomFace.v3.x)/3;
      float centerY = (randomFace.v1.y + randomFace.v2.y + randomFace.v3.y)/3;
      float centerZ = (randomFace.v1.z + randomFace.v2.z + randomFace.v3.z)/3;
      
      float normalCenterX = (randomFace.n1.x + randomFace.n2.x + randomFace.n3.x)/3;
      float normalCenterY = (randomFace.n1.y + randomFace.n2.y + randomFace.n3.y)/3;
      float normalCenterZ = (randomFace.n1.z + randomFace.n2.z + randomFace.n3.z)/3;
      
      
      point(centerX,centerY,centerZ);
      point(centerX+normalCenterX/10,centerY+normalCenterY/10,centerZ + normalCenterZ/10);
  }
}
