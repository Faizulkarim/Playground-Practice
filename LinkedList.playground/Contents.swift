import UIKit

class Node {
    var value : Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    var head: Node?
    
    func addValue(value: Int) {
        var newNode = Node(value: value)
        if let head = head {
            var current = head
            while let next = current.next {
                current = next
            }
            current.next = newNode
        }else {
            head = newNode
        }
    }
    
    func displayList() {
        var current = head
        while let node = current {
            print(node.value, terminator: "->")
            current = node.next
        }
        print("nil")
    }
    
    func removeValue(value: Int) {
        if head?.value == value {
            head = head?.next
            return
        }
        
        var current = head
        while let next = current?.next {
            if next.value == value {
                current?.next = next.next
            }
            current = next
        }
    }
    
    func insert(at index: Int, with value: Int) {
        let newNode = Node(value: value)

        // Case 1: Insert at the head
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }

        // Case 2: Insert at the given index
        var current = head
        var currentIndex = 0

        while let node = current, currentIndex < index - 1 {
            current = node.next
            currentIndex += 1
        }

        // Ensure the index is within the valid range
        if currentIndex == index - 1 {
            newNode.next = current?.next
            current?.next = newNode
        } else {
            print("Index out of range")
        }
    }
}

var list = LinkedList()
list.addValue(value: 5)
list.addValue(value: 8)
list.addValue(value: 3)
list.addValue(value: 9)
list.displayList()
list.removeValue(value: 8)
list.displayList()
list.insert(at: 3, with: 3)
list.displayList()
