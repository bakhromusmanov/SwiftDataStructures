class HashMap {
    private var buckets: [[(key: Int, value: Int)]]
    private let size = 1000
    
    init() {
        self.buckets = Array(repeating: [], count: size)
    }
    
    private func hash(_ key: Int) -> Int {
        return key % size
    }
    
    func contains(_ key: Int) -> Bool {
        let hashIndex = hash(key)
        for tuple in buckets[hashIndex] {
            if tuple.key == key {
                return true
            }
        }
        return false
    }
    
    func put(_ key: Int, _ value: Int) {
        let hashIndex = hash(key)
        let newTuple = (key: key, value: value)
        
        for (index, tuple) in buckets[hashIndex].enumerated() {
            if tuple.key == key {
                buckets[hashIndex][index].value = value
                return
            }
        }
        buckets[hashIndex].append(newTuple)
    }
    
    func get(_ key: Int) -> Int {
        let hashIndex = hash(key)
        for tuple in buckets[hashIndex] {
            if tuple.key == key {
                return tuple.value
            }
        }
        return -1
    }
    
    func remove(_ key: Int) {
        let hashIndex = hash(key)
        for (index, tuple) in buckets[hashIndex].enumerated() {
            if tuple.key == key {
                buckets[hashIndex].remove(at: index)
                return
            }
        }
    }
}
