import UIKit

// Create a set of integers
var set: Set<Int> = [1, 2, 3, 4, 5]

// Add elements to the set
set.insert(6)
set.insert(7)

// Remove an element from the set
set.remove(4)

// Check if an element exists in the set
if set.contains(3) {
    print("3 exists in the set")
} else {
    print("3 does not exist in the set")
}

// Union operation
let set2: Set<Int> = [4, 5, 6, 7, 8]
let unionSet = set.union(set2)
print("Union: \(unionSet)")

// Intersection operation
let intersectionSet = set.intersection(set2)
print("Intersection: \(intersectionSet)")

// Difference operation
let differenceSet = set.subtracting(set2)
print("Difference: \(differenceSet)")
