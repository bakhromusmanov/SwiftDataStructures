class Stack {
    private var list: LinkedList
    private var size: Int
    private var maximumSize: Int

    init(maximumSize: Int = Int.max) {
        list = LinkedList()
        size = 0
        self.maximumSize = maximumSize
    }

    func isEmpty() -> Bool {
        return size == 0
    }

    func hasSpace() -> Bool {
        return size < maximumSize
    }

    func push(_ data: String) {
        if hasSpace() {
            list.add(data)
            size += 1
        } 
    }

    func pop() -> String? {
        if !isEmpty() {
            let nodeData = list.remove()
            if nodeData != nil {
                size -= 1
            }
            return nodeData
        }
        return nil
    }

    func peek() -> String? {
        if !isEmpty() {
            return list.head?.data
        }
        return nil
    }
}
