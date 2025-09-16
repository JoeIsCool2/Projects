import UIKit

enum Button: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case add = "+", subtract = "-", multiply = "*", divide = "/", percentage = "%"
    case decimal = ".", equals = "=", clear = "C", invert = "+/-"
}

var total: Double = 0
var numbers: [Double] = [0]
var operations: [Button] = []
var currentNumber = 0
var isDecimal = 0

func mapInputToButton(_ input: String) -> Button? {
    return Button(rawValue: input)
}

@MainActor func press( _ input: String) {
    guard let button = mapInputToButton(input) else {
        print("Unknown input: \(input)")
        return
    }
    switch button {
    case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
        if let digit = Double(button.rawValue) {
            if isDecimal > 0 {
                isDecimal *= 10
                numbers[currentNumber] += digit / Double(isDecimal)
            } else {
                numbers[currentNumber] = (numbers[currentNumber] * 10) + digit
            }
        } else {
            print("it broke")
        }
        
    case .decimal:
        if isDecimal == 0 {
            isDecimal = 1
        }
        
    case .add, .subtract, .multiply, .divide:
        switch button {
        case .add: operations.append(.add)
        case .subtract: operations.append(.subtract)
        case .multiply: operations.append(.multiply)
        case .divide: operations.append(.divide)
        default: print("No way this ever prints")
        }
        numbers.append(0)
        currentNumber += 1
        isDecimal = 0
        
    case .percentage: numbers[currentNumber] /= 100
        
    case .clear:
        total = 0
        numbers = [0]
        operations = []
        currentNumber = 0
        isDecimal = 0
        
    case .invert:
        if numbers[currentNumber] != 0 {numbers[currentNumber] *= -1
        } else {
            print("you can't inverse a zero")
        }
        
    case .equals: runMath()
    }
}

@MainActor func runMath() {
        total = numbers[0]
        numbers.remove(at: 0)
        for index in 0..<operations.count {
            let nextNumber = numbers[index]
            switch operations[index] {
                case .add: total += nextNumber
                case .subtract: total -= nextNumber
                case .multiply: total *= nextNumber
                case .divide: total /= nextNumber
                default: print("I can't find that operation")
            }

        }
        print("That equals \(total)")
    }
        
press("6")
press("+")
press("7")
press(".")
press("7")
press("/")
press("2")
press("*")
press("1")
press("0")
press("0")
press("+/-")
press("=")

press("C")

press("8")
press("/")
press("5")
press(".")
press("5")
press("=")

press("C")

press("9")
press("9")
press("+")
press("1")
press("=")

press("C")

press("2")
press("+")
press("+")
press("3")
press("=")

press("C")

press("5")
press("%")
press("=")

press("C")

press("1")
press(".")
press("2")
press("3")
press("+/-")
press("=")

