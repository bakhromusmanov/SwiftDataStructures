class TreeNode {
  var data: String
  var children: [TreeNode]

  init(data: String) {
    self.data = data
    self.children = []
  }

  func addChild(_ newChild: TreeNode) {
    children.append(newChild)
  }

  func addChild(_ newChildData: String){
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

class Tree {
  var root: TreeNode

  init(root: TreeNode){
    self.root = root
  }

  //search from node
  func depthFirstSearch(_ fromNode: TreeNode){
    print(fromNode.data)

    if fromNode.children.isEmpty { return }

    for child in fromNode.children {
      depthFirstSearch(child)
    }
  }

  func breadthFirstSearch(){
    var queue: [TreeNode] = [root]
    while !queue.isEmpty {
      let currentNode = queue.removeFirst()
      print(currentNode.data)
      queue.append(contentsOf: currentNode.children)
    }
    
  }
}
