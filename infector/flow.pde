
boolean triggerBabies;
ArrayList<Flow> childSpawners;
ArrayList<PVector> flow1;
ArrayList childSpawnType;
ArrayList<PVector> listOfVertices;


void drawSpawn()
{
  float randX = random(0,2);
  float randY = random(0,2);
  float randZ = random(0,2);
  
  for(int j = 0; j < childSpawners.size(); j++)
  {
  if (!childSpawners.get(j).isOutside())
  {
    float randXX = random(-1,1);
    float randYY = random(-1,1);
    float randZZ = random(-1,1);

    /*PVector v = new PVector (childSpawners.get(j).get(childSpawners.get(j).size() - 1).x + randXX, 
                             childSpawners.get(j).get(childSpawners.get(j).size() - 1).y + randYY,
                             childSpawners.get(j).get(childSpawners.get(j).size() - 1).z + randZZ);
    childSpawners.get(j).add(v);*/
    if (childSpawners.get(j).dead == false)
    {
      PVector v = new PVector (childSpawners.get(j).getStartVector().x + randXX, 
                             childSpawners.get(j).getStartVector().y + randYY,
                             childSpawners.get(j).getStartVector().z + randZZ);
      childSpawners.get(j).startVector = v;
      childSpawners.get(j).getFlow().add(v);
      childSpawners.get(j).getFlowAlpha().add((Float) childSpawners.get(j).spawnAlpha);
      childSpawners.get(j).life++;
    
    /*if (abs(objectDirection.x - childSpawners.get(j).get(childSpawners.get(j).size() - 1).x) > 5 &&
        abs(objectDirection.y - childSpawners.get(j).get(childSpawners.get(j).size() - 1).y) > 5 &&
        abs(objectDirection.z - childSpawners.get(j).get(childSpawners.get(j).size() - 1).z) > 5)
    {
      isOutside1=!isOutside1;
  }*/
  
      if (abs(childSpawners.get(j).flowDirection.x - childSpawners.get(j).getStartVector().x) > 5 &&
        abs(childSpawners.get(j).flowDirection.y - childSpawners.get(j).getStartVector().y) > 5 &&
        abs(childSpawners.get(j).flowDirection.z - childSpawners.get(j).getStartVector().z) > 5)
        {
          childSpawners.get(j).outside = true;
        }
    }
    
    if (childSpawners.get(j).life > 30)
        childSpawners.get(j).dead = true;
    
  }
  else
  {
    
    PVector v = new PVector();
    
    /*if (objectDirection.x - childSpawners.get(j).get(childSpawners.get(j).size() - 1).x > 0)
    {
      v.x = childSpawners.get(j).get(childSpawners.get(j).size() - 1).x + randX;
    }
    else
    {
        v.x = childSpawners.get(j).get(childSpawners.get(j).size() - 1).x - randX;
    }*/
    
    if (childSpawners.get(j).flowDirection.x - childSpawners.get(j).getStartVector().x > 0)
    {
      v.x = childSpawners.get(j).getStartVector().x + randX;
    }
    else
    {
        v.x = childSpawners.get(j).getStartVector().x - randX;
    }
    
    /*if (objectDirection.y - flow1.get(flow1.size() - 1).y > 0)
    {
      v.y = flow1.get(flow1.size() - 1).y + randY;
    }
    else
    {
        v.y = flow1.get(flow1.size() - 1).y - randY;
    }
    flow1.add(v);
    
    println(objectDirection);
    println(flow1.get(flow1.size() - 1).x,
            flow1.get(flow1.size() - 1).y);
    
    if (abs(objectDirection.x - flow1.get(flow1.size() - 1).x) < 10 &&
        abs(objectDirection.y - flow1.get(flow1.size() - 1).y) < 10)
    {
    isOutside1 = !isOutside1;
    }*/
    
    /*if (objectDirection.y - childSpawners.get(j).get(childSpawners.get(j).size() - 1).y > 0)
    {
      v.y = childSpawners.get(j).get(childSpawners.get(j).size() - 1).y + randY;
    }
    else
    {
        v.y = childSpawners.get(j).get(childSpawners.get(j).size() - 1).y - randY;
    }*/
    
    if (childSpawners.get(j).flowDirection.y - childSpawners.get(j).getStartVector().y > 0)
    {
      v.y = childSpawners.get(j).getStartVector().y + randY;
    }
    else
    {
        v.y = childSpawners.get(j).getStartVector().y - randY;
    }
    
    
    /*if (objectDirection.z - childSpawners.get(j).get(childSpawners.get(j).size() - 1).z > 0)
    {
      v.z = childSpawners.get(j).get(childSpawners.get(j).size() - 1).z + randZ;
    }
    else
    {
        v.z = childSpawners.get(j).get(childSpawners.get(j).size() - 1).z - randZ;
    }*/
    
    if (childSpawners.get(j).flowDirection.z - childSpawners.get(j).getStartVector().z > 0)
    {
      v.z = childSpawners.get(j).getStartVector().z + randZ;
    }
    else
    {
        v.z = childSpawners.get(j).getStartVector().z - randZ;
    }
    
    
   
    childSpawners.get(j).startVector = v;
    childSpawners.get(j).getFlow().add(v);
    childSpawners.get(j).getFlowAlpha().add((Float) childSpawners.get(j).spawnAlpha);
    
   
    
    
    /*if (abs(objectDirection.x - childSpawners.get(j).get(childSpawners.get(j).size() - 1).x) < 10 &&
        abs(objectDirection.y - childSpawners.get(j).get(childSpawners.get(j).size() - 1).y) < 10 &&
        abs(objectDirection.z - childSpawners.get(j).get(childSpawners.get(j).size() - 1).z) < 10)
    {
    isOutside1 = !isOutside1;
    }*/
    
      if (abs(childSpawners.get(j).flowDirection.x - childSpawners.get(j).getStartVector().x) < 10 &&
        abs(childSpawners.get(j).flowDirection.y - childSpawners.get(j).getStartVector().y) < 10 &&
        abs(childSpawners.get(j).flowDirection.z - childSpawners.get(j).getStartVector().z) < 10)
      {
        childSpawners.get(j).outside = false;
      }
    
      
    }
  }
}


PVector objectDirection(){
    /*PVector randomObjectVertex = new PVector(
    s.getChild((int)random(0,s.getChildCount()-1)).getVertex((int)random(0,s.getVertexCount() - 1)).x,
    s.getChild((int)random(0,s.getChildCount()-1)).getVertex((int)random(0,s.getVertexCount() - 1)).y,
    s.getChild((int)random(0,s.getChildCount()-1)).getVertex((int)random(0,s.getVertexCount() - 1)).z);*/
    
    
    int randomVertex = (int) random(0,listOfVertices.size()-1);
    PVector randomObjectVertex = new PVector(
    listOfVertices.get(randomVertex).x,
    listOfVertices.get(randomVertex).y,
    listOfVertices.get(randomVertex).z);
    listOfVertices.remove(randomVertex);
    
    return randomObjectVertex;
}

void addNewSpawn()
{
  ArrayList<PVector> flow = new ArrayList<PVector>();
  ArrayList<Float> flowAlpha = new ArrayList<Float>();
  
  PVector direction = objectDirection();
  direction.x = direction.x*220 + 400;
  direction.y = direction.y*220 + 300;
  direction.z = direction.z*220;

  Flow newFlow = new Flow(new PVector(random(0,800),random(0,600),random(-300,300)),direction,flow, flowAlpha, false, 0, false,1);
  
  //PVector newFlowStart = new PVector(random(0,800),random(0,600),10);
  
  //newFlow.add(newFlowStart);
  childSpawners.add(newFlow);
}

public class Flow 
{
  private PVector startVector; //x position of vertex
  private PVector flowDirection;
  private ArrayList<PVector> flow;
  private ArrayList<Float> flowAlpha;
  private boolean outside;
  private int life;
  private boolean dead;
  private float spawnAlpha;

  //constructor of Flow
  public Flow(PVector startVector, PVector flowDirection,ArrayList<PVector> flow, 
  ArrayList<Float> flowAlpha, boolean outside, int life, boolean dead, float spawnAlpha) {    
    this.startVector = startVector;
    this.flowDirection = flowDirection;
    this.flow = flow;
    this.flowAlpha = flowAlpha;
    this.outside = outside;
    this.life = life;
    this.dead = dead;
    this.spawnAlpha = spawnAlpha;
    
  }
  
  public PVector getStartVector()
  {
    return  this.startVector;
  }
  
  public PVector getFlowDirection()
  {
    return  this.flowDirection;
  }
  
  public ArrayList<PVector> getFlow()
  {
    return  this.flow;
  }
  
  public ArrayList<Float> getFlowAlpha()
  {
    return  this.flowAlpha;
  }
  
  public boolean isOutside()
  {
    return  this.outside;
  }
  
}
