
class LocationState {
  //public
   ArrayList<PVector> Locations = new ArrayList<PVector>();
   //Keep track of location of the last person node added;
   //defaulting first Loc  to 10,, 10 but be overridden with constructor
   int xStart = 10;
   int yStart = 10;
   PVector nextPersonNodeLoc = new PVector(xStart , yStart);
   int nodeSeperation = 20;
   //TotalNumberOfNodes
   int numberOfNodes = 0;
   //Keep track of total node count for positioning
   int nodeCount = 0;
   //Maximum number of nodes that can go in each column
   int maxColCount = 12;
   
   //todo - look up multiple constructors
   /*
   EconGraph(){
     nextPersonNodeLoc.set(xStart,yStart); 
     personNodes = new ArrayList<PersonNodes>();
   }
   */
   
   LocationState(int numberOfNodes, int xStart,int yStart,int nodeSeperation, int maxColCount){
     this.xStart = xStart;
     this.yStart = yStart;
     //initialize starting location to the new specification
     nextPersonNodeLoc.set(xStart,yStart); 
     this.numberOfNodes = numberOfNodes;
     this.maxColCount = maxColCount;
     this.nodeSeperation = nodeSeperation;
     //now we can generate an array representing the grid
     SetLocations();
   }
   
   void SetLocations(){
     for(int i = 0; i < numberOfNodes; i++){
       Locations.add(new PVector(nextPersonNodeLoc.x, nextPersonNodeLoc.y));
     nodeCount += 1;
     setNextLocation();
     }
     
   }
   
   
   //assumes nodeCount is incremented first
   void setNextLocation(){
     if(nodeCount % maxColCount == 0){
       //start new column
        nextPersonNodeLoc.
          set(nextPersonNodeLoc.x + nodeSeperation,yStart); 
     }else{
       //continue down column
       nextPersonNodeLoc.
          set(nextPersonNodeLoc.x,nextPersonNodeLoc.y + nodeSeperation); 
     }
   }
}
