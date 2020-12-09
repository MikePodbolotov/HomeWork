import UIKit

//1.    Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2.    Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

struct DescriptionAirport {
    var trafficVolume: Int
    let title: String
    var price: Double
    var countTicket: Int
}

enum BuyingErrors: Error {                          // ошибки при попытке купить билет
    case invalidCodeAirport                         // не найден аэропорт
    case outOfStock                                 // билетов нет в наличии
    case insufficientFunds(moneyNeeded: Double)     // недостаточно денег, передаем недостаточную сумму
}

var moneyInWallet = 10_000.00 // количество денег в нашем кошельке

class Airport {
    var airport = ["DME": DescriptionAirport(trafficVolume: 40_000, title: "Домодедово", price: 7_000, countTicket: 10),
                   "SVO": DescriptionAirport(trafficVolume: 50_000, title: "Шереметьево", price: 10_000, countTicket: 10),
                   "VKO": DescriptionAirport(trafficVolume: 20_000, title: "Внуково", price: 5_000, countTicket: 10),
                   "LED": DescriptionAirport(trafficVolume: 5_000, title: "Пулково", price: 4_000, countTicket: 0)]
    
    func findDescription(airportCode: String) -> (DescriptionAirport?, BuyingErrors?) {
        guard let descriptionAirport = airport[airportCode] else {
            return (nil, BuyingErrors.invalidCodeAirport)
        }
        return (descriptionAirport, nil)
    }
    
    func buyTicket(airportCode: String) throws -> DescriptionAirport {
        guard let descriptionAirport = airport[airportCode] else {
            throw BuyingErrors.invalidCodeAirport
        }
        guard descriptionAirport.countTicket > 0 else {
            throw BuyingErrors.outOfStock
        }
        guard descriptionAirport.price <= moneyInWallet else {
            throw BuyingErrors.insufficientFunds(moneyNeeded: descriptionAirport.price - moneyInWallet)
        }

        moneyInWallet -= descriptionAirport.price
        var newDescription = descriptionAirport
        newDescription.countTicket -= 1
        airport[airportCode] = newDescription
        return newDescription
    }
}

let airport = Airport()
let descriptionAirport = airport.findDescription(airportCode: "DME")
if let description = descriptionAirport.0 {
    print("По вашему запросу найден аэропорт: \(description.title)")
} else if let error = descriptionAirport.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}

do {
let purchase1 = try airport.buyTicket(airportCode: "DME")
    print("По вашему запросу найден аэропорт: \(purchase1.title) и куплен билет. Билетов осталось: \(purchase1.countTicket)")
    print("Денег в кошельке \(moneyInWallet)")
} catch BuyingErrors.invalidCodeAirport {
    print("С кодом DME не существует аэропорта")
} catch BuyingErrors.outOfStock {
    print("В аэропорту нет билетов в продаже.")
}catch BuyingErrors.insufficientFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyInWallet), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}

do {
let purchase2 = try airport.buyTicket(airportCode: "DME")
    print("По вашему запросу найден аэропорт: \(purchase2.title) и куплен билет. Билетов осталось: \(purchase2.countTicket)")
    print("Денег в кошельке \(moneyInWallet)")
} catch BuyingErrors.invalidCodeAirport {
    print("С кодом DME не существует аэропорта")
} catch BuyingErrors.outOfStock {
    print("В аэропорту нет билетов в продаже.")
}catch BuyingErrors.insufficientFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyInWallet), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}

do {
let purchase3 = try airport.buyTicket(airportCode: "LED")
    print("По вашему запросу найден аэропорт: \(purchase3.title) и куплен билет. Билетов осталось: \(purchase3.countTicket)")
    print("Денег в кошельке \(moneyInWallet)")
} catch BuyingErrors.invalidCodeAirport {
    print("С кодом DME не существует аэропорта")
} catch BuyingErrors.outOfStock {
    print("В аэропорту нет билетов в продаже.")
}catch BuyingErrors.insufficientFunds(let moneyNeeded) {
    print("В кошельке недостаточно денег. У вас в кошельке \(moneyInWallet), а необходимо \(moneyNeeded)")
} catch let error {
    print("Произошла ошибка: \(error.localizedDescription)")
}

