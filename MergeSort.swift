func mergeSort(_ inputArray: [Int]) -> [Int] {
    guard inputArray.count > 1 else {
        return inputArray
    }

    let midIndex = inputArray.count / 2
    let leftArray = Array(inputArray[0..<midIndex])
    let rightArray = Array(inputArray[midIndex..<inputArray.count])

    let leftMerge = mergeSort(leftArray)
    let rightMerge = mergeSort(rightArray)

    return merge(leftArray: leftMerge, rightArray: rightMerge)
}

func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [Int] = []
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else {
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    return orderedArray + Array(leftArray.dropFirst(leftIndex)) + Array(rightArray.dropFirst(rightIndex))
}
