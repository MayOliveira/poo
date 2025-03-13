import UIKit

enum Manufacturer {
    case toyota
    case nissan
    case hyundai
    case fiat
    case ford
    case volkswagen
    case citroen
    case jeep
}

enum Transmission {
    case manual
    case automatic
}

// MARK: Classes

class CarDealership {

    let name: String
    var cars: [Car]

    init(name: String,
         cars: [Car]) {
        self.name = name
        self.cars = cars
    }

    func buy(suv: SUV) {
        cars.append(suv)
    }

    func buy(sedan: Sedan) {
        cars.append(sedan)
    }

    func buy(hatch: Hatch) {
        cars.append(hatch)
    }

    func sell(suv: SUV) {
        cars.removeAll { car in
            car.id == suv.id
        }
    }

    func sell(sedan: Sedan) {
        cars.removeAll { $0.id == sedan.id }
    }

    func sell(hatch: Hatch) {
        cars.removeAll { $0.id == hatch.id }
    }

    func getSUVAmount() -> Int {
        let suvCars = cars.filter { car in
            car is SUV
        }

        return suvCars.count
    }

    func getHatchAmount() -> Int {
        let hatchCars = cars.filter { car in
            car is Hatch
        }

        return hatchCars.count
    }

    func getSedanAmount() -> Int {
        let sedanCars = cars.filter { car in
            car is Sedan
        }

        return sedanCars.count
    }

    func showAllCars() {
        for car in cars {
            print("Nome do carro: \(car.name)\nFabricante: \(car.manufacturer)\nAno: \(car.modelYear)\n\n")
        }
    }
}

class Car {

    var id: UUID
    var name: String
    var topSpeed: Double
    var transmission: Transmission
    var seatingCapacity: Int
    var modelYear: Int
    var manufacturer: Manufacturer

    init(id: UUID = UUID(),
         name: String,
         topSpeed: Double,
         transmission: Transmission,
         seatingCapacity: Int = 5,
         modelYear: Int,
         manufacturer: Manufacturer) {
        self.id = id
        self.name = name
        self.topSpeed = topSpeed
        self.transmission = transmission
        self.seatingCapacity = seatingCapacity
        self.modelYear = modelYear
        self.manufacturer = manufacturer
    }

}

class SUV: Car {

    var is4x4: Bool = false

    func increaseSeatingCapacity(in amount: Int) {
        seatingCapacity += amount
    }

}

class Hatch: Car {

    func increaseSeatingCapacity(in amount: Int) {
        seatingCapacity += amount
    }

}

class Sedan: Car {

    func increaseSeatingCapacity(in amount: Int) {
        seatingCapacity += amount
    }

}

// MARK: Objects

var cars: [Car] = [SUV(name: "Kicks",
                       topSpeed: 200.0,
                       transmission: .automatic,
                       seatingCapacity: 5,
                       modelYear: 2023, 
                       manufacturer: .nissan),
                   Sedan(name: "Sentra",
                         topSpeed: 210.0,
                         transmission: .manual,
                         seatingCapacity: 5,
                         modelYear: 2025, 
                         manufacturer: .nissan),
                   Hatch(name: "C3 You!",
                         topSpeed: 180.0,
                         transmission: .automatic,
                         modelYear: 2025, 
                         manufacturer: .citroen),
                   Hatch(name: "C3 Live",
                         topSpeed: 160.0,
                         transmission: .manual,
                         modelYear: 2024, 
                         manufacturer: .citroen)]


// MARK: Actions

var carDealership = CarDealership(name: "May Car", cars: cars)

print("Na concessionária \(carDealership.name) há \(carDealership.cars.count) carros.")

let renegade = SUV(name: "Renegade", 
                   topSpeed: 250.0,
                   transmission: .automatic,
                   modelYear: 2025,
                   manufacturer: .jeep)
renegade.is4x4 = true
carDealership.buy(suv: renegade)

print("Na concessionária \(carDealership.name) há \(carDealership.cars.count) carros.")
print("Quantidade de SUVs: \(carDealership.getSUVAmount()).")

carDealership.showAllCars()
