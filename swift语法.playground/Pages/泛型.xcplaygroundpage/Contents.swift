import UIKit

var str = "Hello, playground"

// 泛型类型 规则：函数名<T> 函数名后+c类型参数 类型参数指定并命名一个展位类型

//struct IntStack {
//    var items = [Int]()
//    mutating func push(_ item: Int) {
//        items.append(item)
//    }
//    mutating func pop() ->Int {
//        return items.removeLast()
//    }
//}

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T){
        items.append(item)
    }
    mutating func pop() -> T{
        items.removeLast()
    }
}

var stackOfString = Stack<String>()

let a = stackOfString.push("navgationOne")
let b = stackOfString.push("navigationTwo")
let c = stackOfString.push("navigationThree")
let d = stackOfString.pop()


// 泛型扩展
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1 ]
    }
}

let e = stackOfString.topItem
print("e  is + \(String(describing: e))")

extension Stack where T: Equatable {
    func isTop(_ item: T) -> Bool {
        guard let topItem = items.last else { return false }
        return topItem == item
    }
}

// 类型约束 指定类型参数必须继承自指定类、遵循特定协议或协议组合
// 类型约束语法
// 在一个类型参数名后面放置一个类名或者协议名，并用冒号进行分隔开，来定义类型约束
class someClass {}
protocol someProtocol {}
func someFunction<T: someClass, U: someProtocol>(someT: T, someU: U) {}
func findIndex(ofString valueToFind: String, in array:[String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakee", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findex<T: Equatable>(of valueToFinde: T, in array:[T]) -> Int?{
    for (index, value) in array.enumerated() {
        if value == valueToFinde {
            return index
        }
    }
    return nil
}

let doubleIndex = findex(of: 10.0, in: [11.1, 1.3, 2.4, 10.0, 3.1, 11.9])
print("doubleIndex is \(String(describing: doubleIndex))")

// 关联类型作为协议的一部分非常有用 声明一个或多个关联类型。关联类型为协议中的某个类型提供了一个占位符名称，其代表的实际类型在协议被遵循时才会被指定。关联类型通过 associatedtype 关键字来指定

// 下面例子定义了一个container协议，该协议定义了一个关联类型Item:

protocol Container {
    associatedtype Item
    mutating func appden(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item{get}
}
struct IntStack: Container {

    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() ->Int {
        return items.removeLast()
    }
    
    // container 协议的实现部分
    typealias Item = Int
    mutating func appden(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct MyStack<T>: Container {
    var items = [T]()
    mutating func push(_ item: T){
        items.append(item)
    }
    mutating func pop() -> T{
        items.removeLast()
    }
    
    /// container 协议的实现部分
    mutating func appden(_ item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
}

/// 关联类型添加约束
protocol myPoto {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) ->Item {get}
    
}
/// 在关联类型u约束里使用协议
// 协议可以作为它自身的要求出现
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) ->Suffix
}

extension MyStack: SuffixableContainer {
    
    func suffix(_ size: Int) -> MyStack {
        var result = MyStack()
        for index in (count - size)..<count{
            result.appden(self[index])
        }
        return result
    }
}

var stackOfInes = MyStack<Int>()
stackOfInes.appden(1)
stackOfInes.appden(11)
stackOfInes.appden(111)

print("suffix 2 is",stackOfInes.suffix(3))
// suffix 是Stack 的关联类型，也是Stack,所以Stack的后缀运算返回另一个Stack

extension Container {
    subscript<Indices:Sequence>(indices: Indices) ->[Item] where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

