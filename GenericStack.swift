struct Stack<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element) 
    }
    
    mutating func pop() -> T? {
        return elements.popLast() 
    }
    
    func peek() -> T? {
        return elements.last 
    }
    
    func isEmpty() -> Bool {
        return elements.isEmpty
    }
    
    func size() -> Int {
        return elements.count
    }
}
