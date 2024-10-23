func binarySearch<T: Comparable>(for key: T, in arr: [T], withRange range: Range<Int>) -> Int? {
  guard range.lowerBound < range.upperBound else { 
    return nil 
  }

  let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2

  if arr[midIndex] == key {
    return midIndex
  }

  let newRange: Range<Int>

  if arr[midIndex] < key {
    newRange = (midIndex+1)..<range.upperBound
  } else {
    newRange = range.lowerBound..<midIndex
  }
  
  return binarySearch(for: key, in: arr, withRange: newRange)
}
