class Queue {
    var head: Node?
    var tail: Node?

    func peek() -> String? {
        return head?.data
    }

    func enqueue(data: String) {
        let newNode = Node(data: data)
        
        if let lastNode = tail {
            lastNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }

    func dequeue()-> String? {
      guard let firstNode = head   else { return nil }
      head = firstNode.next 
      if head == nil {
        tail = nil
      }
      return firstNode.data
    }
}
