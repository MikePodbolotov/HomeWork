import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//let tempArrey = [1,2,3,4,5,6,7,8,9]
//tempArrey.filter {
//    return $0 % 2 == 0
//}
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

protocol Shape {
    var weigth: Int { get set }
}

class Circle: Shape {
    var weigth: Int
    var radius: Double
    
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    
    init(weidth: Int, radius: Double) {
        self.weigth = weidth
        self.radius = radius
    }
}

class Rectangle: Shape {
    var weigth: Int
    var sideA: Double
    var sideB: Double
    
    func calculatePerimiter() -> Double {
        return sideA + sideB
    }
    
    init(weigth: Int, sideA: Double, sideB: Double) {
        self.weigth = weigth
        self.sideA = sideA
        self.sideB = sideB
    }
}

struct Queue<T: Shape> { // в скобочках <> указываем тип - это называется дженерик
    private var array: [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T?{
        guard array.count > 0 else { return nil }
        return array.removeFirst()
    }
    
    var totalWeigth: Int {
        var weigth = 0
        for element in array {
            weigth += element.weigth
        }
        return weigth
    }
    
    subscript(indecies: Int ...) -> Int? {
        var weight: Int? = 0
        for index in indecies where index >= self.array.count {
            weight = nil
        }
        return weight
    }
}

//var queue = Queue<String>()  Можно указывать тип и работать с ним. На данном примере String
//queue.push("1")

var queueRectangle = Queue<Rectangle>()
var queueCircle = Queue<Circle>()

queueRectangle.push(Rectangle(weigth: 4, sideA: 2.0, sideB: 3.0))
queueRectangle.push(Rectangle(weigth: 4, sideA: 3.0, sideB: 2.0))
queueRectangle.push(Rectangle(weigth: 5, sideA: 4.0, sideB: 3.0))
var totalWeigthRectangle = queueRectangle.totalWeigth
queueRectangle[1]
queueRectangle[3]
queueRectangle.pop()



queueCircle.push(Circle(weidth: 2, radius: 5.0))
queueCircle.push(Circle(weidth: 4, radius: 10.0))
queueCircle.push(Circle(weidth: 3, radius: 7.5))
var totalWeigthCircle = queueCircle.totalWeigth
queueCircle.pop()


// Вопрос к Амиру: Как применить filter к коллекции «очередь»?
// filter к массиву из чисел понятно как применить, но вот как сделать его к описанно выше коллекции «очередь» непонятно
var tempArray = [1,2,3,4,5,6,7,8,9,10]

func filter(array: [Int], predicate: (Int) -> Bool) -> [Int] {
    var tmpArray = [Int]()               // создает временный массив
        for element in array {
            if predicate(element) {         // вызываем замыкание, чтобы проверить элемент
                tmpArray.append(element)
            }
        }
        return tmpArray
}

print(tempArray.filter { $0 % 2 == 0 })
print(tempArray.filter { $0 % 2 != 0 })
