import Darwin

// 1. Решить квадратное уравнение.
// Квадратное уравнение — это уравнение вида ax2 + bx + c = 0, где коэффициенты a, b и c — произвольные числа, причем a ≠ 0.
// Решаем через дискриминант D = b2 − 4ac
// Если D < 0, корней нет;
// Если D = 0, есть ровно один корень;
// Если D > 0, корней будет два.
var a = 1.0
var b = 4.0
var c = 3.0

var D:Double = b*b-4*a*c

if D>0 {
    let x1 = (-b+sqrt(D))/(2*a)
    let x2 = (-b-sqrt(D))/(2*a)
    print("Корней два: x1 = " + String(x1) + " и x2 = " + String(x2))
} else if D==0 {
    let x1 = -b/(2*a)
    print("Корень один: x =" + String(x1))
} else {
    print("Корней на множестве действительных чисел нет")
}
print("________________________________________________________________")

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
// Гипотенуза с = sqrt(a2+b2)
a = 3.0
b = 4.0

c = sqrt(a*a+b*b)

let S = (a*b)/2
let P = a+b+c
print("Гипотенуза: " + String(c) + "; Периметр: " + String(P) + "; Площадь: " + String(S))
print("________________________________________________________________")

// 3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет
var depositAmount = 10000.00
let annualInterest = 8.2
let years = 5
var sumPercent = 0.0
var percentYears = 0.0

for _ in 1...years {
    percentYears = depositAmount*annualInterest/100;
    sumPercent = sumPercent + percentYears;
    depositAmount = depositAmount+percentYears;
}

print("Сумма вклада через " + String(years) + " лет составит: " + String(depositAmount))
print("Сумма процентов за весь период составит " + String(sumPercent))
