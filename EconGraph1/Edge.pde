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
