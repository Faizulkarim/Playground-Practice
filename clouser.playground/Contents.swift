import UIKit
import Foundation

///closer

var mycloser : (Int, Int) -> Int = { (a,b) in
    
    return a * b
}
let bb = mycloser(2,2)
print(bb)


// as a function peramiter


func getData(completion: (Data?,Error?) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        
        let data : Data? = nil
        let error : Error? = nil
      //  completion(data,error)
    }
    
}

