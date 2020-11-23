import UIKit

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum SportCarBrand {
    case AstonMartin, Bugatti, Ferrari, Lamborghini, Lotus, McLaren
}
enum TrunkCarBrand {
    case MAN, Kamaz, Mercedes, DAF, Scania, Volvo
}
enum EngineRunning: String {
    case running = "Запускаем двигатель"
    case stop = "Выключаем двигатель"
}
enum WindowsOpen: String {
    case open = "Открываем окна"
    case close = "Закрываем окна"
}
enum CarAction {
    case setEngine(EngineRunning)
    case load(Int)
    case setWindow
}

struct SportCar {
    let carBrand: SportCarBrand
    let yearOfManufacture: Int?
    let maxCapacity: Int
    var engineRunning: EngineRunning = .stop
    var windowsOpen: WindowsOpen = .close
    let trunkLoad: Int = 0
    
    func describeSelf() {
        let stringYearOfManufacture = yearOfManufacture != nil ? "\(String(yearOfManufacture!)) года выпуска" : ""
        print("Спортивный автомобиль - Марка: \(carBrand) \(stringYearOfManufacture). Максимальная загрузка = \(maxCapacity)")
    }
    
    mutating func makeAction(action: CarAction) {
        switch action {
        case .setEngine(let setEngine):
            print("Текущее состояние двигателя: \(self.engineRunning)")
            if self.engineRunning != setEngine {
                self.engineRunning = setEngine
                print(setEngine.rawValue)
            } else if self.engineRunning == setEngine && self.engineRunning == .stop {
                print("Действий не требуется. Двигатель уже заглушен")
            } else if self.engineRunning == setEngine && self.engineRunning == .running {
                print("Действий не требуется. Двигатель уже запущен")
            }
        case .setWindow:
            if self.windowsOpen == .close {
                self.windowsOpen = .open
                print( WindowsOpen.open.rawValue)
            } else {
                self.windowsOpen = .close
                print(WindowsOpen.close.rawValue)
            }
        case .load(let load):
            if load < maxCapacity {
                print("Загрузили \(load). Еще есть свободное место в багажнике.")
            } else if load == maxCapacity {
                print("Загрузили \(load). Места больше нет.")
            } else {
                print("В багажнике нет места для загрузки \(load).")
            }
        }
    }
}

struct TrunkCar {
    let carBrand: TrunkCarBrand
    let yearOfManufacture: Int?
    let maxCapacity: Int
    var engineRunning: EngineRunning = .stop
    var windowsOpen: WindowsOpen = .close
    let trunkLoad: Int = 0
    
    func describeSelf() {
        let stringYearOfManufacture = yearOfManufacture != nil ? "\(String(yearOfManufacture!)) года выпуска" : ""
        print("Грузовик - Марка: \(carBrand) \(stringYearOfManufacture). Максимальная загрузка = \(maxCapacity)")
    }
    
    mutating func makeAction(action: CarAction) {
        switch action {
        case .setEngine(let setEngine):
            print("Текущее состояние двигателя: \(self.engineRunning)")
            if self.engineRunning != setEngine {
                self.engineRunning = setEngine
                print(setEngine.rawValue)
            } else if self.engineRunning == setEngine && self.engineRunning == .stop {
                print("Действий не требуется. Двигатель уже заглушен")
            } else if self.engineRunning == setEngine && self.engineRunning == .running {
                print("Действий не требуется. Двигатель уже запущен")
            }
        case .setWindow:
            if self.windowsOpen == .close {
                self.windowsOpen = .open
                print( WindowsOpen.open.rawValue)
            } else {
                self.windowsOpen = .close
                print(WindowsOpen.close.rawValue)
            }
        case .load(let load):
            if load < maxCapacity {
                print("Загрузили \(load). Еще есть свободное место в багажнике.")
            } else if load == maxCapacity {
                print("Загрузили \(load). Места больше нет.")
            } else {
                print("В багажнике нет места для загрузки \(load).")
            }
        }
    }
}

var firstCar = SportCar(carBrand: .Bugatti, yearOfManufacture: 2019, maxCapacity: 500, engineRunning: .running, windowsOpen: .open)
var secondCar = SportCar(carBrand: .Lamborghini, yearOfManufacture: nil, maxCapacity: 300)
var thirdCar = TrunkCar(carBrand: .MAN, yearOfManufacture: 2015, maxCapacity: 10000, engineRunning: .stop, windowsOpen: .open)
var fourthCar = TrunkCar(carBrand: .Volvo, yearOfManufacture: 2016, maxCapacity: 15000, engineRunning: .running)


firstCar.describeSelf()
firstCar.makeAction(action: .setEngine(.stop))
firstCar.makeAction(action: .setWindow)
firstCar.makeAction(action: .load(400))
firstCar.makeAction(action: .setEngine(.running))
firstCar.makeAction(action: .setEngine(.running))
print("_________________________________________________________")
secondCar.describeSelf()
secondCar.makeAction(action: .setEngine(.stop))
secondCar.makeAction(action: .setWindow)
secondCar.makeAction(action: .load(400))
print("_________________________________________________________")
thirdCar.describeSelf()
thirdCar.makeAction(action: .setEngine(.running))
thirdCar.makeAction(action: .setWindow)
thirdCar.makeAction(action: .load(5000))
print("_________________________________________________________")
fourthCar.describeSelf()
fourthCar.makeAction(action: .setEngine(.running))
fourthCar.makeAction(action: .setWindow)
fourthCar.makeAction(action: .load(20000))
