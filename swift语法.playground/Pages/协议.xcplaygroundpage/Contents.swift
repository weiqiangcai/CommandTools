//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"



//: 协议：协议定义了一个蓝图，规定了用来实现某一特定任务或功能的方法、属性、以及他需要的东西。类、结构体、枚举都可以遵循协议，
/// 协议语法
protocol SomeProtocol {// 这里是协议定义的部分
    
}

//: 协议总是用 var 关键字来声明变量属性，在类型声明后加上{set get} 来表示属性是可读可写的，可读属性则用{get}来表示。
protocol OneProtocol {
        var mustBeSettable: Int{ get set }
        var doesNotNeedToBeSettable: Int { get }
}
protocol FullyNamed {
        var fullName : String { get }
        
}

struct Person: FullyNamed {
        var fullName: String
        
}
let json = Person.init(fullName: ".. test")
// Person 结构体的每一个实例都有一个string类型的存储属性fullname

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + "" :"") + name
    }
}
let asan = Starship.init(name: "san", prefix: "1a")
print(asan)

// 不支持 为协议中的方法提供默认参数
protocol TwoProtocol {
    static func someTypeMethod()
}

// 下面的方法定义了一个含有一个实例的方法的协议
protocol RandomNumberGenerator {
//    func random() -> Double
    func random() -> Double
}
// RandomNumberGenerator 并不关心每一个随机数是怎样生成的，它只要求必须提供一个随机数生成器
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
//print("here's a random number:\(generator.random())")

//: mutating toggle()方法在定义的时候，使用mutating 关键字标记，这表明当他被调用时，该方法将会改变遵循协议的类型
protocol Togglable {
   mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}


//: 协议初始化器 ，如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么改构造器的实现需要同时标注 required 和 override 修饰符
protocol MyProtocol {
    init()
}

class Person1 {
    init() {
         // 这里是构造器的实现部分
    }
}

class Student: Person1, MyProtocol {
    // 以为遵循协议需要加上 required
    // 因为重写父类所有要加上 override
   required override init() {
        
    }
}

//: 可失败构造器 init?

//: 协议作为类型 ：
// 尽管协议未实现任何功能，但可以当做一个类型来使用。可以作为函数、 常亮、 变量、 数组、
    

// dice 骰子， sides 面， generator 点数的大小
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides) + 1)
    }
}
// 向下转型？疑问

var d6 = Dice.init(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//class Dice1 {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//    func roll() -> Int{
//        return Int(generator.random() * Double(sides) + 1)
//    }
//}
//let dice11 = Dice1(sides: 6, generator: LinearCongruentialGenerator())


