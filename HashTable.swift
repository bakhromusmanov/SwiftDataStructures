struct HashTable {
  private var buckets: [[(String, String)]]

  public init(capacity: Int) {
    buckets = Array(repeating: [], count: capacity)
  }
  
  private func index(for key: String) -> Int {
    return abs(key.hashValue) % buckets.count
  }
  
  public subscript(key: String) -> String? {
    set {
      if let value = newValue {
        update(value: value, for: key)
      } else {
        removeValue(for: key) 
      }
    }
    get {
      return value(for: key) 
    }
  }
  
  private func value(for key: String) -> String {
    let bucketIndex = index(for: key)

    if let (_, currentValue) = buckets[bucketIndex].first(where: { $0.0 == key }) {
      return currentValue
    } else {
      return "" 
    }
  }
  
  private mutating func update(value: String, for key: String) {
    let bucketIndex = index(for: key)

    if let elementIndex = buckets[bucketIndex].firstIndex(where: { $0.0 == key }) {
      buckets[bucketIndex][elementIndex] = (key, value) 
    } else {
      buckets[bucketIndex].append((key, value)) 
    }
  }
  
  private mutating func removeValue(for key: String) {
    let bucketIndex = index(for: key)
    // Search for the key in the bucket and remove it if found
    if let elementIndex = buckets[bucketIndex].firstIndex(where: { $0.0 == key }) {
      buckets[bucketIndex].remove(at: elementIndex)
    }
  }
}
