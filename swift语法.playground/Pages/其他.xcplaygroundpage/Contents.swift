//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

let qita_9 = "true"
let abc = Bool.init(qita_9)
if abc != nil {
    if abc == true {
        
        debugPrint("这个bool类型是true")
    }
}

var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

let dictKeys = [Int](someDict.keys)
let dictValues = [String](someDict.values)

let one = dictValues[0]
//
//for (key) in dictKeys {
//    print("\(key)")
//}
//
//print("输出字典的值(value)")
//
//for (value) in dictValues {
//    print("\(value)")
//}
