//: [Previous](@previous)

import Foundation
import UIKit
var str = "Hello, playground"

//: [Next](@next)
//: 类型转换 is as

//: 检查类型 用类型检查操作符 is 来检查一个实例是否属于特定子类型。
//: 向下转型 某类型的一个常量或变量可能在幕后实际上属于一个子类。当确定是这种情况时，你可以尝试用类型转换操作符（as? 或 as!）向下转到它的子类型。
//: Any 可以表示类型 包括函数类型
//: AnyObject 可以表示任何类类型的实例
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}



let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]


var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")

for item in library {
    if let move = item as? Movie {
        print("movie: director is \(move.director), name is \(move.name)")
    } else if let song = item as? Song {
        print("Song: name is\(song.name), artist is \(song.artist)")
    }
}

var things = [Any]()
let abc: Int? = 10
/// 这样没有警告⚠️
things.append(abc as Any)
