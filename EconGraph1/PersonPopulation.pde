class PersonPopulation {
   ArrayList<PersonNode> personNodes = new  ArrayList<PersonNode>();
  //int numberOfNodes;
  int personNodeSize;
  
   
   
   PersonPopulation(int personNodeSize){
     this.personNodeSize = personNodeSize;
     //this.numberOfNodes = numberOfNodes;
   }
   
   void CreatePopulation(NetworkEngine engine, LocationState locState){
     //todo - take min size 
     println("engine size: " + str(engine.size));
     for(int i = 0; i < engine.size; i++){
       //get the x, y locations
       float xLoc = locState.Locations.get(i).x;
       float yLoc = locState.Locations.get(i).y;
       PersonNode pnode = new PersonNode(xLoc, yLoc, personNodeSize);
       //add all edges
       NetworkNode ithNetNode = engine.nodes.get(i);
       for(NetworkNode netNode : ithNetNode.following){
          float xLocEnd = locState.Locations.get(netNode.id).x;
          float yLocEnd = locState.Locations.get(netNode.id).y;
          // Edge (PVector start, PVector end)
          Edge e = new Edge(new PVector(xLoc,yLoc), new PVector(xLocEnd,yLocEnd));
          pnode.addEdge(e);
       }
       //TODO - add edges ***
      personNodes.add(pnode);
     }
   }
   
   void run(){
    for (PersonNode n : personNodes) {
      n.run();  // Passing the entire list of boids to each boid individually
    }
   }
   

}
