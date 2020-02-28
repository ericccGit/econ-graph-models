PersonPopulation pop;

void setup() {
  
  int numNodes = 100;
  //data state
  NetworkEngine _engine = new NetworkEngine(numNodes);
  
  
  //visual state
  size(1000, 1000);
  //int numberOfNodes, int xStart,int yStart,int nodeSeperation, int maxColCount
  LocationState _locationState = new LocationState(numNodes, 30, 30, 50, 12);
  //create the rendering population
  pop = new PersonPopulation(20);
  pop.CreatePopulation(_engine,_locationState);
  
  /*
  econGraph = new EconGraph(30, 30, 50, 20);
  //add inital set of nodes
  for (int i = 0; i < numNodes; i++) {
    econGraph.addPersonNode();
  }
  */
}

void draw() {
  background(50);
  pop.run();
}



class Edge {
  PVector start = new PVector(0,0);
  PVector end = new PVector(0,0);
  
  Edge (PVector start, PVector end){
    this.start = start;
    this.end = end;
  }
  
  void render(){
    line(start.x, start.y, end.x, end.y);
    stroke(126);
  }
}

//contains logic regarding the data state of the model without 
//worrying about the visual implementation
class NetworkEngine
{
  int size;
  int followersMin = 2;
  int followersMax = 30;
  ArrayList<NetworkNode> nodes = new ArrayList<NetworkNode>();
  
  NetworkEngine (int _size){
    size = _size;
    //add inital set of nodes
    for (int i = 0; i < size; i++) {
      //set the id prop to be an it's index, although I am not currently getting by index in the addRandomFollowings fxn
      //todo - get by id or make id a guid
      NetworkNode n = new NetworkNode(i);
      nodes.add(n);
    }
    //once the nodes are added, create relationships between them
    AddRandomFollowings();
  }
  
  void AddRandomFollowings(){
    for(NetworkNode n : nodes){
      //todo - normally distribute 
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
  
  NetworkNode(int id){
    this.id = id;
  }
  
  void addFollower(NetworkNode n){
    followers.add(n);
  }
  
  void follow(NetworkNode n){
    following.add(n);
  }
  
  
} 
