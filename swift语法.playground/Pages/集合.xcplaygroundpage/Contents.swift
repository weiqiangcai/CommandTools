//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


var abc = Array(repeating: "11", count: 3)
var bcd = Array(repeating: "22", count: 3)

var he = abc + bcd

he += ["abc", "1232", "nicai"]


print("he count ",he.count)

he[3...5] = ["三", "cun" , "人"]
print(he)

//: fallthrough 贯穿到下一个分支
let jh_24 = "switch-贯穿"
switch jh_24 {
case "switch-贯穿":
    print("这里是switch-贯穿")
    fallthrough
case "guan-chuan":
    print("guan-chuan")
default:
    break
}
