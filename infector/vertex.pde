public class Vertex 
{
  private float x; //x position of vertex
  private float y;
  private float z;//y postion of 

  //constructor of Vertex
  public Vertex(float x, float y, float z) {    
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  public double getX()
  {
    return  this.x;
  }
  
  public double getY()
  {
    return  this.y;
  }
  
  public double getZ()
  {
    return  this.z;
  }
}

void findVertices(float x, float y, float r)
{
  float randomNumber = random(0,0.05);
  for (int i = 0; i < s.getChildCount(); i++) {
         PShape child = s.getChild(i);
         for (int j = 0; j < child.getVertexCount(); j++) { //<>//
           println(child.getVertex(j).x*scaleObject,child.getVertex(j).y*scaleObject);
         if (child.getVertex(j).x*scaleObject <= (x+r) && child.getVertex(j).x*scaleObject >= (x-r)
         && child.getVertex(j).y*scaleObject <= (y+r) && child.getVertex(j).y*scaleObject >= (y-r))  
           {
           println(child.getVertex(j).x*scaleObject,child.getVertex(j).y*scaleObject);
           child.setVertex(j,new PVector(child.getVertex(j).x+ randomNumber,child.getVertex(j).y + randomNumber));
           }
         }
       }
}
