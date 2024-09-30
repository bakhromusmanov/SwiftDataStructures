class HashSet {
    private var buckets: [LinkedList]
    private let size = 1000  // Number of buckets
    
    init() {
        buckets = Array(repeating: LinkedList(), count: size)
    }
    
    private func hash(_ key: Int) -> Int {
        return key % size
    }
    
    func add(_ key: Int) {
        let index = hash(key)
        buckets[index].add(key)
    }
    
    func remove(_ key: Int) {
        let index = hash(key)
        buckets[index].remove(key)
    }
    
    func contains(_ key: Int) -> Bool {
        let index = hash(key)
        return buckets[index].contains(key)
    }
}
