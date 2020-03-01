class PersonNode {

  PVector pos = new PVector(0,0);
  int diameter = 50;
  ArrayList<Edge> edges = new ArrayList<Edge>();
  
  void addEdge(Edge e){
   edges.add(e); 
  }
  
  void setLocation(float xPos, float yPos){
    pos.set(xPos,yPos); 
  }
  
     void setSize(int _diameter){
       diameter = _diameter;
     }
      
  
  PersonNode(float xPos, float yPos, int _diameter){
    diameter = _diameter;
     pos.set(xPos,yPos); 
  }
  
   void run() {
    render();
  }

  
  void render () {
    ellipse(pos.x, pos.y, diameter, diameter);
    for(Edge e : edges){
      e.render();
    }
  }
}
