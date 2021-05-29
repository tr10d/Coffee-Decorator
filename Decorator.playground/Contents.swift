import Foundation

let cur = "₽"

// MARK: - Coffee
protocol Coffee {
  var cost: Int { get }
}

// MARK: - CoffeeDecorator
protocol CoffeeDecorator: Coffee {
  var coffee: Coffee? { get set }
  var costDecorator: Int { get }
  var nameDecorator: String { get }

  init()
}

extension CoffeeDecorator {
  var cost: Int {
    var nextCost = 0
    if let coffee = coffee {
      nextCost = coffee.cost
    }
    print("+", nameDecorator, costDecorator, cur)
    return costDecorator + nextCost
  }

  init(_ coffee: Coffee? = nil) {
    self.init()
    self.coffee = coffee
  }
}

// MARK: - Classes
class SimpleCoffee: Coffee {
  var cost: Int {
    let cost = 3
    print("Кофе:", cost, cur)
    return cost
  }
}

class Milk: CoffeeDecorator {
  var coffee: Coffee?
  let costDecorator: Int
  var nameDecorator: String

  required init() {
    costDecorator = 5
    nameDecorator = "Молоко"
  }
}

class Whip: CoffeeDecorator {
  var coffee: Coffee?
  let costDecorator: Int
  var nameDecorator: String

  required init() {
    costDecorator = 7
    nameDecorator = "Взбить"
  }
}

class Sugar: CoffeeDecorator {
  var coffee: Coffee?
  let costDecorator: Int
  let nameDecorator: String

  required init() {
    costDecorator = 11
    nameDecorator = "Сахар"
  }
}

class Syrup: CoffeeDecorator {
  var coffee: Coffee?
  let costDecorator: Int
  let nameDecorator: String
  
  required init() {
    costDecorator = 13
    nameDecorator = "Сироп"
  }
  
}

// MARK: - Demo
print("Набор 1:")
print("Сумма:", SimpleCoffee().cost, cur, "\n")

print("Набор 2:")
print("Сумма:", Milk(SimpleCoffee()).cost, cur, "\n")

print("Набор 3:")
print("Сумма:", Milk(Sugar(SimpleCoffee())).cost, cur, "\n")

print("Набор 4:")
print("Сумма:", Milk(Sugar(Whip(SimpleCoffee()))).cost, cur, "\n")

print("Набор 5:")
print("Сумма:", Milk(Sugar()).cost, cur, "\n")
