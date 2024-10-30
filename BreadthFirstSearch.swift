func bfs(startingAt startNode: GraphNode) -> [GraphNode] {
    var queue = Queue<GraphNode>()         
    queue.enqueue(startNode)              
    var visitedNodes = [GraphNode]()      

    while let currentNode = queue.dequeue() {

        if !visitedNodes.contains(currentNode) {
            visitedNodes.append(currentNode)
        }

        for neighbor in currentNode.neighboringNodes where !visitedNodes.contains(neighbor) {
            queue.enqueue(neighbor)
        }
    }
    return visitedNodes 
}
