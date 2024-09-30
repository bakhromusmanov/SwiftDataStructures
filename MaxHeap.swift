class Solution {
    
    var heap: [Int] = []
    var size: Int { heap.count }
    
    func add(_ val: Int) {
        heap.append(val)
        heapifyUp()
    }
    
    func removeRoot() -> Int{
        let root = heap[0]
        if !heap.isEmpty{
            heap.swapAt(0, size-1)
            heap.removeLast()
            heapifyDown()
        }
        return root
    }
    
    func heapifyUp(){
        var currentIndex = size - 1
        while currentIndex > 0 && heap[currentIndex] > heap[parentIndex(currentIndex)]{
            heap.swapAt(currentIndex, parentIndex(currentIndex))
            currentIndex = parentIndex(currentIndex)
        }
    }
    
    func heapifyDown(){
        var currentIndex = 0
        var needToSwap = hasOlderChildren(currentIndex)
        while needToSwap.0 {
            heap.swapAt(currentIndex, needToSwap.1)
            currentIndex = needToSwap.1
            needToSwap = hasOlderChildren(currentIndex)
        }
    }
    
    func hasOlderChildren(_ currentIndex: Int) -> (Bool, Int) {
        var toSwap: (Bool, Int) = (false, 0)
        let rightChildIndex = rightChild(currentIndex)
        let leftChildIndex = leftChild(currentIndex)
        
        if indexExists(leftChildIndex) && heap[currentIndex] < heap[leftChildIndex] {
            toSwap.0 = true
            toSwap.1 = leftChildIndex
        }
        
        if indexExists(rightChildIndex) && heap[currentIndex] < heap[rightChildIndex] && heap[rightChildIndex] > heap[leftChildIndex] {
            toSwap.0 = true
            toSwap.1 = rightChildIndex
        }
        
        return toSwap
    }
    
    func parentIndex(_ index: Int) -> Int{
        return (index-1)/2
    }
    
    func leftChild(_ index: Int) -> Int{
        return index*2 + 1
    }
    
    func rightChild(_ index: Int) -> Int {
        return index*2 + 2
    }
    
    func indexExists(_ index: Int) -> Bool {
        return index < size
    }
}
