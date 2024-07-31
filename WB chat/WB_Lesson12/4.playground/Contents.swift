import UIKit

// Create a dictionary with city names as keys and population as values
var dictionary: [String: Int] = ["New York": 8405837, "Los Angeles": 3990456]

// Add key-value pairs to the dictionary
dictionary["Chicago"] = 2695598
dictionary["Houston"] = 2320268

// Remove a key-value pair from the dictionary
dictionary.removeValue(forKey: "Los Angeles")

// Update a value for a key
dictionary["New York"] = 8500000

// Get a value for a key
if let population = dictionary["Chicago"] {
    print("Population of Chicago: \(population)")
} else {
    print("City not found")
}
