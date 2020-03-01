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





//contains logic regarding the data state of the model without 
//worrying about the visual implementation
class NetworkEngine
{
  int size;
  int followersMin = 2;
  int followersMax = 10;
  ArrayList<NetworkNode> nodes = new ArrayList<NetworkNode>();
  
  NetworkEngine (int _size){
    size = _size;
    //add inital set of nodes
    //with IDs 0-[size - 1]
    for (int i = 0; i < size; i++) {
      //set the id prop to be an it's index, although I am not currently getting by index in the addRandomFollowings fxn
      //todo - get by id or make id a guid
      NetworkNode n = new NetworkNode(i);
      nodes.add(n);
       println("ADDED NODE WITH ID: " + str(i));
    }
    //once the nodes are added, create relationships between them
    AddRandomFollowings();
  }
  
  void AddRandomFollowings(){
    int j = 1;
    for(NetworkNode n : nodes){
      //todo - normally distribute 
      int numFollowers = round(random(followersMin,followersMax));
      for(int i=0; i < numFollowers; i++){
        println("i: " + str(i));
        int node2followId = floor(random(0,size-1));
        println("node2followId: " + str(node2followId));
        
        NetworkNode node2follow = nodes.get(node2followId);
        n.follow(node2follow);
        node2follow.addFollower(n);
        
        //todo make probablity of mutual following higher 
      }
       println("j: " + str(j));
      j++;
    }
     println("DONE ASSIGNING RANDOM FOLLOWINGS");
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
  ArrayList<NetworkNode> followers = new ArrayList<NetworkNode>();
  ArrayList<NetworkNode> following = new ArrayList<NetworkNode>();
  
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
