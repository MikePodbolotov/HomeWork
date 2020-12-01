import UIKit
import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum SportCarBrand {
    case AstonMartin, Bugatti, Ferrari, Lamborghini, Lotus, McLaren
}

enum TrunkCarBrand {
    case MAN, Kamaz, Mercedes, DAF, Scania, Volvo
}

enum StartStopEngine: String {
    case srart = "Запускаем двигатель"
    case stop = "Глушим двигатель"
}

enum OpenCloseWindows: String {
    case open = "Открываем окна"
    case close = "Закрываем окна"
}

enum InstallNitro: String {
    case install = "Установили NITRO"
    case deinstall = "Демонтировали NITRO"
}

enum InstallTrailer: String {
    case install = "Прицепили прицеп"
    case deinstall = "Отцепили прицеп"
}

protocol Car {
    var horsePower: Int { get }
    var countWheels: Int { get }
    var color: UIColor { get }
    var yearOfManufacture: Int? { get }
    var maxCapacity: Int { get }
    var engineAction: StartStopEngine { get set }
    var windowAction: OpenCloseWindows { get set }

    func action()
}

extension Car {
    mutating func StartStopEngine(action: StartStopEngine) {
        switch action {
        case .srart:
            self.engineAction = .stop
            print(engineAction.rawValue)
        case .stop:
            self.engineAction = .srart
            print(engineAction.rawValue)
        }
    }
    
    mutating func OpenCloseWindows(action: OpenCloseWindows) {
        switch action {
        case .open:
            self.windowAction = .close
            print(windowAction.rawValue)
        case .close:
            self.windowAction = .open
            print(windowAction.rawValue)
        }
    }
}

class SportCar: Car {
    var horsePower: Int
    var countWheels: Int
    var color: UIColor
    var yearOfManufacture: Int?
    var maxCapacity: Int
    var engineAction: StartStopEngine = .stop
    var windowAction: OpenCloseWindows = .close
    func action() {
        print(InstallNitro.install.rawValue)
    }
    
    var carBrand: SportCarBrand
    func describeSelf() {
        print("------- Спортивный автомобиль - Марка: \(carBrand) -------")
    }
    
    init(horsePower: Int,countWheels: Int,color: UIColor,yearOfManufacture: Int?,maxCapacity: Int,carBrand: SportCarBrand) {
        self.horsePower = horsePower
        self.countWheels = countWheels
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.maxCapacity = maxCapacity
        self.carBrand = carBrand
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Описание спортивной машины"
    }
}

class TrunkCar: Car {
    var horsePower: Int
    var countWheels: Int
    var color: UIColor
    var yearOfManufacture: Int?
    var maxCapacity: Int
    var engineAction: StartStopEngine = .stop
    var windowAction: OpenCloseWindows = .close
    func action() {
        print(InstallTrailer.install.rawValue)
    }
    
    var carBrand: TrunkCarBrand
    func describeSelf() {
        print("------- Грузовой автомобиль - Марка: \(carBrand) -------")
    }
    
    init(horsePower: Int,countWheels: Int,color: UIColor,yearOfManufacture: Int?,maxCapacity: Int,carBrand: TrunkCarBrand) {
        self.horsePower = horsePower
        self.countWheels = countWheels
        self.color = color
        self.yearOfManufacture = yearOfManufacture
        self.maxCapacity = maxCapacity
        self.carBrand = carBrand
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Описание грузовика"
    }
}

var firstCar = SportCar(horsePower: 600, countWheels: 4, color: .black, yearOfManufacture: 2018, maxCapacity: 100, carBrand: .Bugatti)
firstCar.describeSelf()
firstCar.action()
firstCar.OpenCloseWindows(action: .close)
firstCar.StartStopEngine(action: .stop)

var secondCar = TrunkCar(horsePower: 2000, countWheels: 12, color: .gray, yearOfManufacture: 2016, maxCapacity: 10000, carBrand: .DAF)
secondCar.describeSelf()
secondCar.action()
secondCar.OpenCloseWindows(action: .open)
secondCar.StartStopEngine(action: .srart)

// Реализация перечисления в расширении протокола
enum OnOffSwitch {
    case off, on
}

protocol LightSwitchble: AnyObject {
    var lightState: OnOffSwitch { get set }
    func toggle()
}

extension LightSwitchble {
        func toggle() {
            self.lightState = self.lightState == .off ? .on : .off
        }
}

class Light: LightSwitchble {
    var lightState: OnOffSwitch
    
    init(lightState: OnOffSwitch) {
        self.lightState = lightState
    }
}

let myLight = Light(lightState: .off)
myLight.lightState
myLight.toggle()
myLight.lightState
