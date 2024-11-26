//
//  Utils.swift
//  Teste-Unitario
//
//  Created by Gabriel Mors  on 11/25/24.
//

class Utils {
    
    static func average(numbers: [Int]) -> Int {
        var total = 0
        
        for number in numbers {
           total += number
        }
        return total / numbers.count
    }
    
    static func isInteger(_ string: String) -> Bool {
        if let _ = Int(string) {
            return true
        } else {
            return false
        }
    }
    
    static func randomInRange(upperBound: Int) -> Int {
        return Int.random(in: 0...upperBound)
    }
    
    static func trimWhitespace(_ string: String) -> String {
        string.trimmingCharacters(in: .whitespaces)
    }
}
