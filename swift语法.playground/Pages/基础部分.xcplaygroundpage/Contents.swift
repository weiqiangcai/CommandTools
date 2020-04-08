//: [Previous](@previous)

import Foundation

// 错误处理
func canThrowAnError () throws {
    // 这个函数有可能抛出错误
}

// 当你的函数能够抛出错误时，你因该在表达式中前置try关键词
do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch  {
    // 有一个错误消息抛出
}

func makeASandwich() throws {
    
}

func eatASandwich () {}

    
/// 断言和先决条件
// 断言仅在调试环境运行，而先决条件则在调试环境和生产环境中运行。

// 1. 断言
let age = -3
//assert(age >= 0,"A person's age cannot be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
//    assertionFailure("A person's age can't be less than zero.")
}


/// 元组比较
// 元组比较 从左到右 逐值比较
let a = (1, "zebra") < (2, "zebra")
let b = (3, "apple") < (3, "bird")
let c = (4, "dog") == (4, "dog")
print("a", a)
print("b", b)
print("c", c)


/// 空合运算符  a ?? b
// 简短表达： a != nil ? a! : b
// 空合运算符将对可选类型a进行空判断，如果a包含一个值就进行解包，否则就返回一个默认值b。表达式a必须是Optional可选类型。默认值b的类型必须要和a存储值的类型一致。

