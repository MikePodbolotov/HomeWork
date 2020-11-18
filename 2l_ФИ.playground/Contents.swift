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


// 3. Создать возрастающий массив из 100 чисел.
var someArrey = [Int]()
var number = 1
while someArrey.count < 100 {
    someArrey.append(number)
    number += 1
}

print("Изначальный массив:")
print(someArrey)
someArrey.count

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var index = 0
repeat {
    if evenNumber(number: someArrey[index]) || !division(number: someArrey[index], denominator: 3) {
        someArrey.remove(at: index)
    } else {
        index += 1
    }
} while index <= someArrey.count-1

print("Массив после удаления чисел не удовлетворяющих условию:")
print(someArrey)
someArrey.count
