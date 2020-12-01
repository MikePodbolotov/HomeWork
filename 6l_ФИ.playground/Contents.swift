import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue {
    private var array: [Int] = []
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int?{
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
}

var queue = Queue()
