func bubbleSort(inputArray: inout [Int]) {
    for i in 0..<inputArray.count {
        for j in 1..<inputArray.count - i {
            if inputArray[j] < inputArray[j - 1] {
                inputArray.swapAt(j, j - 1)
            }
        }
    }
}
