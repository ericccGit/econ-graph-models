class PersonPopulation {
   ArrayList<PersonNode> personNodes;
  //int numberOfNodes;
  int personNodeSize;
  
   
   
   PersonPopulation(int personNodeSize){
     this.personNodeSize = personNodeSize;
     //this.numberOfNodes = numberOfNodes;
   }
   
   void CreatePopulation(NetworkEngine engine, LocationState locState){
     //todo - take min size 
     for(int i = 0; i < engine.size; i++){
       PersonNode pnode = new PersonNode(locState.Locations.get(i).x, locState.Locations.get(i).y, personNodeSize);
      personNodes.add(pnode);
     }
   }
   
   void run(){
    for (PersonNode n : personNodes) {
      n.run();  // Passing the entire list of boids to each boid individually
    }
   }
   

}
