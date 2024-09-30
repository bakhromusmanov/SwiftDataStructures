class GraphNode{
  var data: String
  var neighboringNodes: [GraphNode]

  init(data: String) {
    self.data = data
    self.neighboringNodes = []
  }

  func addNeighbor(_ node: GraphNode) {
    neighboringNodes.append(node)
  }

  func removeNeighbor(_ node: GraphNode){
    if let index = neighboringNodes.firstIndex(where: { $0 == node }){
      neighboringNodes.remove(at: index)
    }
  }
}

extension GraphNode : Equatable, CustomStringConvertible {
  static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
    return lhs === rhs
  }
  var description: String {
    return "\(data)"
  }
}

class GraphEdge{
  var firstNode: GraphNode
  var secondNode: GraphNode
  var weight: Int?

  init(firstNode: GraphNode, secondNode: GraphNode, weight: Int? = nil){
    self.firstNode = firstNode
    self.secondNode = secondNode
    self.weight = weight
  }
}

class Graph {
  var nodes: [GraphNode]
  var edges: [GraphEdge]

  init(nodes: [GraphNode]){
    self.nodes = nodes
    self.edges = []
  }

  func addNode(node: GraphNode){
    nodes.append(node)
  }

  func addEdge(firstNode: GraphNode, secondNode: GraphNode, isBidirectional: Bool = true, weight: Int? = nil) {
    firstNode.addNeighbor(secondNode)
    edges.append(GraphEdge(firstNode: firstNode, secondNode: secondNode, weight: weight))

    if isBidirectional {
      secondNode.addNeighbor(firstNode)
      edges.append(GraphEdge(firstNode: secondNode, secondNode: firstNode, weight: weight))
    }
  }

  func removeNode(_ node: GraphNode){
    if let index = nodes.firstIndex(where: {$0 == node}){
      nodes.remove(at: index)
    }

    edges = edges.filter {$0.firstNode != node && $0.secondNode != node}

    nodes.forEach {$0.removeNeighbor(node)}
  }
}
