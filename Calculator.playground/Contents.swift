import UIKit


// Creates all possible inputs for calculator
enum Button: String {
    case zero = "0", one = "1", two = "2", three = "3", four = "4"
    case five = "5", six = "6", seven = "7", eight = "8", nine = "9"
    case add = "+", subtract = "-", multiply = "*", divide = "/", percentage = "%"
    case decimal = ".", equals = "=", clear = "C", invert = "+/-", squareRoot = "√"
    case power = "^", abs = "abs"
}

//Makes all variblues needed in global
var total: Double = 0
var currentTotal: Double = 0
var numbers: [Double] = [0]
var operations: [Button] = []
var currentNumber = 0
var isDecimal = 0

//Main function
@MainActor func press( _ input: Button) {
    // checks all possible inputs to calc
    switch input {
        //checks for numbers
    case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
        //turns all enum values into a Int value
        if let digit = Double(input.rawValue) {
            //checks to see if it is decimal
            if isDecimal > 0 {
                //changes decimal by one place down
                isDecimal *= 10
                //divides by the number to get to the current decimal place
                numbers[currentNumber] += digit / Double(isDecimal)
            } else {
                //multiples the current number in the list by 10 then adds the inputed number to it if not a decimal
                numbers[currentNumber] = (numbers[currentNumber] * 10) + digit
            }
        } else {
            //Just to let me know that something broke
            print("it broke")
        }
        
    case .decimal:
        // Makes the number a decimal if it is not already a decimal
        if isDecimal == 0 {
            isDecimal = 1
        }
    // checks all cases for operations except =, invert, pecentage
    case .add, .subtract, .multiply, .divide, .squareRoot, .power, .abs:
        //adds the apropriate operation to my operations list
        switch input {
        case .add: operations.append(.add)
        case .subtract: operations.append(.subtract)
        case .multiply: operations.append(.multiply)
        case .divide: operations.append(.divide)
        case .squareRoot: operations.append(.squareRoot)
        case .power: operations.append(.power)
        case .abs: operations.append(.abs)
        default: print("No way this ever prints")
        }
        // adds a new number
        numbers.append(0)
        //changes the current number to the new number
        currentNumber += 1
        //resets the decimal so there is no decimal
        isDecimal = 0
    // math for percentage
    case .percentage:
        numbers[currentNumber] /= 100
        
    //resets everything
    case .clear:
        total = 0
        numbers = [0]
        operations = []
        currentNumber = 0
        isDecimal = 0
    // math for inverting
    case .invert:
        //makes sure the number is not 0 because you cant inverse a 0 then just multiples the current number by -1
        if numbers[currentNumber] != 0 {numbers[currentNumber] *= -1
        } else {
            print("you can't inverse a zero")
        }
    // checks for = if it is then it runs the run math function which does all the math
    case .equals: runMath()
    }
}

@MainActor func runMath() {
    //makes the total the first number then deletes the first number
        total = numbers[0]
        numbers.remove(at: 0)
    //repeats for as many operations there are
        for index in 0..<operations.count {
            // sets the next number to the current index in number because we deleted the first number
            let nextNumber = numbers[index]
            //switches between the diferent operations in operations list the prefores the specific task based on that operation to the total and current number
            switch operations[index] {
                case .add: total += nextNumber
                case .subtract: total -= nextNumber
                case .multiply: total *= nextNumber
                case .divide: total /= nextNumber
                case .squareRoot: total = sqrt(total)
                case .power: total = pow(total, nextNumber)
                case .abs: if total < 0 { total *= -1 }
                default: print("I can't find that operation")
            }

        }
    //Saves total to a number before clearing
    currentTotal = total
    //Prints all the value of the equation
    print("That equals \(currentTotal)")
    //resets everything
    press(.clear)
    //add the numbers that you just calculated to the current numbers
    numbers = [currentTotal]
    }
//tests
press(.six)
press(.invert)
press(.seven)
press(.abs)
press(.squareRoot)
press(.add)
press(.nine)
press(.percentage)
press(.decimal)
press(.eight)
press(.equals)
press(.multiply)
press(.six)
press(.seven)
press(.equals)
press(.clear)
press(.one)
press(.decimal)
press(.two)
press(.three)
press(.four)
press(.equals)
press(.clear)
press(.six)
press(.zero)
press(.multiply)
press(.one)
press(.five)
press(.percentage)
press(.equals)



