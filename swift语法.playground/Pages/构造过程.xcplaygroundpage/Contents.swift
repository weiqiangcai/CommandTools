//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// 子类不具备继承父类的便利构造器

/// 基类
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(self)--:\(numberOfWheels) wheels"
    }
}

let vehicle = Vehicle()
print(vehicle.description)

/// bicycle 类继承自Vehicle，重写了父类的默认构造器，调用super.init()方法开始表示开始调用父类的默认构造器，这样是确保在子类中修改 属性numberOfWheels 时可以被改变
class Bicycle: Vehicle {
    var money = 100
    
    override init() {
        super.init()
        numberOfWheels = 3

    }
}

let bicycle = Bicycle()
print(bicycle.description, bicycle.money)


/// 这个类隐式的调用了父类的 默认构造器。 因为这个类在阶段二中没有自定义使用
class HoverBoard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = HoverBoard(color: "white")
print(hoverboard.description)


/// 指定构造器、便利构造器以及构造器的自动继承。

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init () {
        self.init(name: "unknow")
    }
    
}
let namedMeat = Food(name: "Bacon")
print(namedMeat.name)


class RecipeIngredient: Food {
    var quantity: Int
    init(quantity: Int, name: String) {
        self.quantity = quantity
        super.init(name: name)
    }
    convenience override init(name: String) {
        self.init(quantity: 1, name: name)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✅" : " ❌"
        return output
    }

}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bascon"),
    ShoppingListItem(quantity: 2, name: "Eggs")
]

breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true

breakfastList[2].purchased = true

for item in breakfastList {
    print(item.description)
}


/// 可失败构造器
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}


let dog = Animal(species: "dog")

if let dog = dog {
    print("可失败构造器dog初始化success")
}

let pig = Animal(species: "")
if  pig == nil {
    print("pig 初始化失败")
}

