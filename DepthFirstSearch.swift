func dfs(startingAt startNode: GraphNode) -> [GraphNode] {
    var stack = [startNode]
    var visitedNodes = [GraphNode]()

    while let currentNode = stack.popLast() {
      if !visitedNodes.contains(currentNode) {
        visitedNodes.append(currentNode)
      }
      
      for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor)  {
        stack.append(neighbor)
      }
    }
    return visitedNodes
}
