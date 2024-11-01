//1 variant returns new sorted array with higher Space Complexity
func quicksort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
  
    let pivot = array[Int.random(in: 0..<array.count)]
    let smallerElements = array.filter { $0 < pivot }
    let equalElements = array.filter { $0 == pivot }
    let greaterElements = array.filter { $0 > pivot }

    return quicksort(smallerElements) + equalElements + quicksort(greaterElements)
}


//2 variant sorts given array in place with O(1) Space Complexity
func quicksort(_ array: inout [Int], from start: Int, to end: Int) {
    if start < end {
        let partitionIndex = partition(&array, from: start, to: end)
        quicksort(&array, from: start, to: partitionIndex - 1)
        quicksort(&array, from: partitionIndex + 1, to: end)
    }
}

func partition(_ array: inout [Int], from start: Int, to end: Int) -> Int {
    let pivot = array[end]
    var currentIndex = start
    for index in currentIndex..<end {
        if array[index] <= pivot {
            array.swapAt(currentIndex, index)
            currentIndex += 1
        }
    }
    array.swapAt(currentIndex, end)
    return currentIndex
}
