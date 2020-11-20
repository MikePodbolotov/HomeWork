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


// 3.1 Создать возрастающий массив из 100 чисел. Вариант 1
var someArrey = [Int]()
var number = 1
while someArrey.count < 100 {
    someArrey.append(number)
    number += 1
}
print("Изначальный массив:")
print(someArrey)
someArrey.count

// 3.2 Создать возрастающий массив из 100 чисел. Вариант 2
var array = [Int]()
for i in 0...99 {
    array.append(i)
}
print("Изначальный массив:")
print(array)
array.count

// 3.3 Создать возрастающий массив из 100 чисел. Вариант 3
var arrayNext = Array(1...100)
print("Изначальный массив:")
print(arrayNext)
arrayNext.count


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
var index = 0
repeat {
    if evenNumber(number: someArrey[index]) || !division(number: someArrey[index], denominator: 3) {
        someArrey.remove(at: index)
    } else {
        index += 1
    }
} while index <= someArrey.count-1

print("_______________________________________________________")
print("Массив после удаления чисел не удовлетворяющих условию:")
print(someArrey)
someArrey.count


// 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
//Fn = Fn-1 + Fn-2
var fibonacciNumbers: Int?
var arrayFibonacciNumbers = [0, 1]
var count = 2

func addFibonacciNumbers(_ count: Int) {
    fibonacciNumbers = arrayFibonacciNumbers[count-1] + arrayFibonacciNumbers[count-2]
    arrayFibonacciNumbers.append(fibonacciNumbers!)
}

while count < 50 {
    addFibonacciNumbers(count)
    count += 1
}
print("_______________________________________________________")
print("Массив c числами Фибоначчи:")
print(arrayFibonacciNumbers)


/*6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/
var set = Set(2...100)
for value in set {
    var index = 2
    while value * index <= 100 {
        set .remove(value * index)
        index += 1
    }
}
print("_______________________________________________________")
print(set.sorted(by: <))

// 6.2 Вариант 2 с кратчайшей записью
var max = 500
var s = Set(2...max)
var i = 2

s.forEach{while i*$0<=max{s.remove(i*$0);i+=1};i=2}
print("_______________________________________________________")
print(s.sorted(by: <))
