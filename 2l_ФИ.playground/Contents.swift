import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
func evenNumber(number: Int) -> Bool {
    let remainder = number % 2
    return remainder == 0
}

var result = evenNumber(number: 11)

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func division(number: Int, denominator: Int) -> Bool {
    let remainder = number % denominator
    return remainder == 0
}

result = division(number: 12, denominator: 3)
