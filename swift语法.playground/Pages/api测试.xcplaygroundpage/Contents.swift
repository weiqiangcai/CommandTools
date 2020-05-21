//: [Previous](@previous)

import UIKit

var str = "Hello, playground"


extension String {
    
    func firstIndexOfCharacter(_ char: Character) -> Int? {
        if let index = self.firstIndex(of: char) {
            return self.distance(from: self.startIndex, to: index)
        }
        return nil
    }
    
}

let index = str.firstIndexOfCharacter("p")




