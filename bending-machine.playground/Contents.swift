import UIKit

public struct BendingItems {
    var name: String
    var price : Int
    var quantity : Int
}

class BendingMatchine {
    
    var bendingItems : [BendingItems]!
    
    
    init(bendingItems: [BendingItems]) {
        self.bendingItems = bendingItems
    }
    
    func vend(itemIndex : Int, ammoutPaid: Int) -> String {
        guard itemIndex >= 0 && bendingItems.count > 0 else {
          
            return "Invalid Item Selection"
        }
        var item = bendingItems[itemIndex]
        
        guard item.quantity > 0 else {
            return "\(item.name) sold out"
        }
        
        if ammoutPaid >= item.price {
            let change = ammoutPaid - item.price
            item.quantity -= 1
            bendingItems[itemIndex] = item
            return "Enjoy your \(item.name)! Your change is \(change) USD."
        }else {
            return "Insufficient balance"
        }
        
    }
    
    
}

let pepsi = BendingItems(name: "pepsi", price: 20, quantity: 2)
let cocacola = BendingItems(name: "Cocacola", price: 30, quantity: 6)
let mirinda = BendingItems(name: "mirinda", price: 10, quantity: 5)

let bendingItems = [pepsi,cocacola,mirinda]

var bendingMatchine = BendingMatchine(bendingItems: bendingItems)
bendingMatchine.vend(itemIndex: 0, ammoutPaid: 20)
bendingMatchine.vend(itemIndex: 0, ammoutPaid: 20)
bendingMatchine.vend(itemIndex: 0, ammoutPaid: 20)
