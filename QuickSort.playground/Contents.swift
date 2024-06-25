import UIKit


class QuickSort {
    
    func sort(_ array: inout[Int]) {
        
        quickSort(&array, low: 0, heigh: array.count - 1)
    }
    
    func quickSort(_ array : inout [Int], low: Int, heigh: Int) {
        guard low < heigh else {return}
        var pivotItem = partition(&array,low : low,heigh: heigh)
        
        quickSort(&array, low: low, heigh: pivotItem - 1)
        quickSort(&array, low: pivotItem + 1, heigh: heigh)
    }
    
    func partition (_ array : inout [Int], low: Int, heigh: Int) -> Int {
        let pivot = array[heigh]
        var i = low
        for j in low..<heigh {
           if array[j] <=  pivot {
                array.swapAt(i, j)
                i += 1
            }
        }
        array.swapAt(i, heigh)
        return i
    }
    
    
}

var unsortedArray = [4, 2, 9, 1, 5]
var sort = QuickSort()
sort.sort(&unsortedArray)

print(unsortedArray)
