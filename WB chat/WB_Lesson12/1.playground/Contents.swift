import UIKit

var greeting = "Hello, playground"
func hashString(_ string: String) -> Int {
    return string.hashValue
}

let string = "Hello, World!"
let hash = hashString(string)
print("Hash: \(hash)")
