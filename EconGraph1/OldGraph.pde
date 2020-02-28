/*
class EconGraph {
   ArrayList<PersonNode> personNodes;
   //Keep track of location of the last person node added;
   //defaulting first Loc  to 10,, 10 but be overridden with constructor

   int xStart = 10;
   int yStart = 10;
   int pNodeSize = 20; //size of person nodes
   PVector nextPersonNodeLoc = new PVector(xStart , yStart);
   
   int nodeSeperation = 20;
   //Keep track of total node count for positioning
   int nodeCount = 0;
   //Maximum number of nodes that can go in each column
   int maxColCount = 12;
   
   //todo - look up multiple constructors
   
   EconGraph(){
     nextPersonNodeLoc.set(xStart,yStart); 
     personNodes = new ArrayList<PersonNodes>();
   }
   
   
   EconGraph(int numberOfNodes, int personNodeSize){
     pNodeSize = personNodeSize;
   }
   
   
   void run(){
    for (PersonNode n : personNodes) {
      n.run();  // Passing the entire list of boids to each boid individually
    }
   }
   

}
*/
