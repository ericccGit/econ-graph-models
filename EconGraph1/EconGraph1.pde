EconGraph econGraph;

void setup() {
  
  int numNodes = 100;
  
  size(1000, 1000);
  econGraph = new EconGraph(30, 30, 50, 20);
  //add inital set of nodes
  for (int i = 0; i < numNodes; i++) {
    econGraph.addPersonNode();
  }
}

void draw() {
  background(50);
  econGraph.run();
}

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
   /*
   EconGraph(){
     nextPersonNodeLoc.set(xStart,yStart); 
     personNodes = new ArrayList<PersonNodes>();
   }
   */
   
   EconGraph(int _xStart,int _yStart,int _nodeSeperation, int personNodeSize){
     xStart = _xStart;
     yStart = _yStart;
     pNodeSize = personNodeSize;
     nextPersonNodeLoc.set(xStart,yStart); 
     personNodes = new ArrayList<PersonNode>();
     //EconGraph();
     
     nodeSeperation = _nodeSeperation;
   }
   
   
   void run(){
    for (PersonNode n : personNodes) {
      n.run();  // Passing the entire list of boids to each boid individually
    }
   }
   
   void addPersonNode(){
     //calculate next location
     PersonNode pnode = new PersonNode(nextPersonNodeLoc.x, nextPersonNodeLoc.y, pNodeSize);
      personNodes.add(pnode);
      nodeCount += 1;
      setNextLocation();
   }
   
   void addPersonNode(PersonNode pNode){
     //calculate next location
      pNode.setLocation(nextPersonNodeLoc.x, nextPersonNodeLoc.y);
      pNode.setSize(pNodeSize);
      personNodes.add(pNode);
      nodeCount += 1;
      setNextLocation();
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

class PersonNode {

  
  PVector pos = new PVector(0,0);
  int diameter = 50;
  //Keep track of the followers for each person(node)
  ArrayList<PersonNode> followers;
  ArrayList<PersonNode> following;
  
  
  
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
  }
}


class Edge {
  
  void render(){
    
  }
}

//contains logic regarding the data state of the model without 
//worrying about the visual implementation
class NetworkEngine
{
  int size;
  int followersMin = 2;
  int followersMax = 30;
  ArrayList<NetworkNode> nodes;
  
  NetworkEngine (int _size){
    size = _size;
    //add inital set of nodes
    for (int i = 0; i < size; i++) {
      NetworkNode n = new NetworkNode(i);
      nodes.add(n);
    }
    
  }
  
  void AddRandomFollowings(){
    for(NetworkNode n : nodes){
      //to do - normally distribute 
      int numFollowers = round(random(followersMin,followersMax));
      for(int i=0; i < numFollowers; i++){
        int node2followId = round(random(0,size-1));
        NetworkNode node2follow = nodes.get(node2followId);
        n.follow(node2follow);
        node2follow.addFollower(n);
        //todo make probablity of mutual following higher 
      }
      
      
    }
  }
  
  //Generic Types? - todo
  //Network node for now
  //addNode()
  
}

//class 

class NetworkNode{
  //need an id to keep track of the node number       
  int id = 0;
  //Keep track of the followers for each person(node)
  ArrayList<NetworkNode> followers;
  ArrayList<NetworkNode> following;
  
  NetworkNode(int _id){
    id = _id;
  }
  
  void addFollower(NetworkNode n){
    followers.add(n);
  }
  
  void follow(NetworkNode n){
    following.add(n);
  }
  
  
} //?
