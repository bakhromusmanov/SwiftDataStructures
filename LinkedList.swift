class Node {
    var data: String
    var next: Node? = nil

    init(data: String) {
        self.data = data
    }
}

class LinkedList {
    var head: Node? = nil
    var tail: Node? = nil

    func append(_ data: String) {
        let newNode = Node(data: data)
        if let lastNode = tail {
            lastNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func getNode(at index: Int) -> Node? {
        guard index >= 0 else { return nil }
        var current = head

        for _ in 0..<index {
            guard let next = current?.next else { return nil }
            current = next
        }
        return current
    }

    func removeNode(from index: Int) -> Node? {
    guard index >= 0 else { return nil } 
    var removedNode: Node?

    if index == 0 {
      removedNode = head
      head = head?.next
      if head == nil {
        tail = nil
      }
      return removedNode
    }

    guard let previous = getNode(at: index - 1) else { return nil }
    removedNode = previous.next
    if removedNode?.next == nil{
      tail = previous
    }
    previous.next = removedNode?.next

    return removedNode
  }

}
