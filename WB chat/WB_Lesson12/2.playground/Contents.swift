import UIKit

func calculateCustomHash(_ string: String) -> Int {
    var hash = 0
    for char in string {
        hash += Int(char.asciiValue!)
    }
    return hash
}

let string = "Hello, World!"
let customHashValue = calculateCustomHash(string)
print("Custom Hash: \(customHashValue)")
