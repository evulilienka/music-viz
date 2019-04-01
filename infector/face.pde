public class Face
{
  private PVector v1; //x position of vertex
  private PVector v2; //y postion of 
  private PVector v3;
  
  private PVector n1; 
  private PVector n2; 
  private PVector n3;
  

  //constructor of Face
  public Face(PVector v1,PVector v2,PVector v3, PVector n1, PVector n2, PVector n3) {    
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
    
    this.n1 = n1;
    this.n2 = n2;
    this.n3 = n3;
  }
  
  public double getX(PVector v)
  {
    return v.x;
  }
  
  public double getY(PVector v)
  {
    return v.y;
  }
  
  public double getZ(PVector v)
  {
    return v.z;
  }
}
