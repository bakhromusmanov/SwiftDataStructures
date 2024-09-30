class TreeNode <T: Equatable> {
  var data: T
  var children: [TreeNode]

  init(data: T) {
    self.data = data
    self.children = []
  }

  func addChild(_ newChild: TreeNode) {
    children.append(newChild)
  }

  func addChild(_ newChildData: T){
    children.append(TreeNode(data: newChildData))
  }

  func addChildren(_ newChildren: [TreeNode]){
    children.append(contentsOf: newChildren)
  }

  func removeChild(_ childToRemove: TreeNode){
    if children.isEmpty { return }

    if children.contains(childToRemove) {
      children.removeAll(){$0 == childToRemove}
      return
    }

    for child in children {
      child.removeChild(childToRemove)
    }

  }
}

extension TreeNode : Equatable {
  static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
    return lhs.data == rhs.data && lhs.children == rhs.children
  }
}

class Tree <T: Equatable> {
  var root: TreeNode<T>

  init(root: TreeNode<T>){
    self.root = root
  }

  //search from node
  func depthFirstSearch(_ fromNode: TreeNode<T>){
    print(fromNode.data)

    if fromNode.children.isEmpty { return }

    for child in fromNode.children {
      depthFirstSearch(child)
    }
  }

  func breadthFirstSearch(){
    var queue: [TreeNode<T>] = [root]
    while !queue.isEmpty {
      let currentNode = queue.removeFirst()
      print(currentNode.data)
      queue.append(contentsOf: currentNode.children)
    }
    
  }
}
