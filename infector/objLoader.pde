ArrayList<PVector> vertices;
ArrayList<PVector> normals;
ArrayList<Face> faces;

void loadVertices()
{
  vertices = new ArrayList<PVector>();
  String[] data=loadStrings("cubeillusion.obj");
    vertices = new ArrayList<PVector>();
    for (int i = 0; i < data.length; i++) {
      if (data[i].startsWith("v "))      
      {
       String[] list = split(data[i], ' ');
       vertices.add(new PVector(Float.parseFloat(list[1]), Float.parseFloat(list[2]), Float.parseFloat(list[3])));
      }
    }
}

void loadNormals()
{
  normals = new ArrayList<PVector>();
  String[] data=loadStrings("cubeillusion.obj");
    normals = new ArrayList<PVector>();
    for (int i = 0; i < data.length; i++) {
      if (data[i].startsWith("vn "))
      
      {
       String[] list = split(data[i], ' ');
       //println(list[1]);
       normals.add(new PVector(Float.parseFloat(list[1]), Float.parseFloat(list[2]), Float.parseFloat(list[3])));
      }
    }
}

void loadFaces()
{
    String[] data=loadStrings("cubeillusion.obj");
    faces = new ArrayList<Face>();
    for (int i = 0; i < data.length; i++) {
      if (data[i].startsWith("f "))      
      {
       String[] list = split(data[i], ' ');
       int v1 = 1;
       int v2 = 1;
       int v3 = 1;
       int n1 = 1;
       int n2 = 1;
       int n3 = 1;
         for (int j = 1; j < list.length; j++)
         {
           
         String[] list2 = split(list[j], '/');
         
           if(j == 1)
           {
             v1 = Integer.parseInt(list2[0]) ;  
             n1 = Integer.parseInt(list2[2]) ;  

           }
           else if(j == 2)
           {
             v2 = Integer.parseInt(list2[0]);  
             n2 = Integer.parseInt(list2[2]); 
           }
           else if(j == 3)
           {
             v3 = Integer.parseInt(list2[0]);  
             n3 = Integer.parseInt(list2[2]); 
           }
         }  
         
       faces.add(new Face(vertices.get(v1-1),vertices.get(v2-1), vertices.get(v3-1),normals.get(n1-1),normals.get(n2-1), normals.get(n3-1)));
      }
    }
}
