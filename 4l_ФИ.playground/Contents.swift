import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum SportCarBrand {
    case AstonMartin, Bugatti, Ferrari, Lamborghini, Lotus, McLaren
}
enum TrunkCarBrand {
    case MAN, Kamaz, Mercedes, DAF, Scania, Volvo
}
enum InstallNitro: String {
    case install = "Установили NITRO"
    case deinstall = "Демонтировали NITRO"
}
enum InstallTrailer: String {
    case install = "Прицепили прицеп"
    case deinstall = "Отцепили прицеп"
}
enum CarAction {
    case setNitro(InstallNitro)
    case setTrailer
}

class Car {
    
    let horsePower: Int
    let countWheels: Int
    var color: UIColor
    var yearOfManufacture: Int? = nil
    let maxCapacity: Int
    
    init(horsePower: Int,countWheels: Int,color: UIColor,yearOfManufacture: Int?,maxCapacity: Int) {
        self.horsePower = horsePower
        self.countWheels = countWheels
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.maxCapacity = maxCapacity
    }
    
    func describeSelf() {
        print("Базовые характеристики:")
        print("количество колес - \(countWheels)")
        print("цвет - \(color)")
        print("год выпуска - \(String(describing: yearOfManufacture))")
        print("макимальная грузоподъемность - \(maxCapacity)")
        print("мощность - \(horsePower)")
    }
    
    func action() {}
}

class sportСar: Car {
    
    let carBrand: SportCarBrand
    
    init(horsePower: Int, color: UIColor, yearOfManufacture: Int?, maxCapacity: Int, carBrand: SportCarBrand) {
        self.carBrand = carBrand
        super.init(horsePower: horsePower, countWheels: 4, color: color, yearOfManufacture: yearOfManufacture, maxCapacity: maxCapacity)
    }
    
    override func action() {
        print("Используем NITRO")
    }
    
    override func describeSelf() {
        super.describeSelf()
        print("Бренд - \(carBrand)")
    }
}

class trunkCar: Car {

    let carBrand: TrunkCarBrand

    init(horsePower: Int, color: UIColor, yearOfManufacture: Int?, maxCapacity: Int, carBrand: TrunkCarBrand) {
        self.carBrand = carBrand
        super.init(horsePower: horsePower, countWheels: 12, color: color, yearOfManufacture: yearOfManufacture, maxCapacity: maxCapacity)
    }
    
    override func action() {
        print("Используем прицеп")
    }
    
    override func describeSelf() {
        super.describeSelf()
        print("Бренд - \(carBrand)")
    }
}

var firstCar = sportСar(horsePower: 600, color: .black, yearOfManufacture: 2018, maxCapacity: 200, carBrand: .AstonMartin)
firstCar.describeSelf()
firstCar.action()

var secondCar = trunkCar.init(horsePower: 3000, color: .gray, yearOfManufacture: 2010, maxCapacity: 10000, carBrand: .DAF)
secondCar.describeSelf()
secondCar.action()
