import UIKit

enum CarObjects {
    case windows(WindowsActions)
    case doors(DoorsActions)
    case trunk(TrunkActions)
    case hatch(HatchActions)
    case engine(EngineActions)
}



enum HatchState{
    case isOpen, isClose
}

enum HatchActions{
    case open, close
}

enum WindowState {
    case isOpen, isClose
}

enum WindowsActions{
    case open, close
}


enum TrunkState {
    case isOpen, isClose
}

enum TrunkActions {
    case put(value: Double), take(value: Double)
    case open, close
}

enum DoorsState {
    case isOpen, isClose
}

enum DoorsActions {
    case open, close
}


enum EngineState {
    case on, off
}

enum EngineActions {
    case turnOff, turnOn
}



class Car{
    let brand: String
    let year: Int
    var engineState: EngineState = .off
    var doorsState: DoorsState = .isClose
    var windowsState: WindowState = .isClose

    
    init(brand: String, year: Int, engineState: EngineState, doorsState: DoorsState, windowsState: WindowState) {
        self.brand = brand
        self.year = year
        self.engineState = engineState
        self.doorsState = doorsState
        self.windowsState = windowsState
    }
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
    
    func performAction(with obj: CarObjects) {
        print("Вызвали функцию родителя")
        
        
    }
}

class SportCar: Car {
    let maxTrunkVolume: Double
    var trunkState: TrunkState = .isClose
    var hatchState: HatchState = .isClose
    
    init(brand: String, year: Int, maxTrunkVolume: Double) {
        self.maxTrunkVolume = maxTrunkVolume
        
        super.init(brand: brand, year: year)
    }
    
    override func performAction(with obj: CarObjects) {
        super.performAction(with: obj)
        print("Вызвали дочернюю функцию")
        switch obj {
        case .doors(.close):
            doorsState = .isClose
            print("Дверь закрыта")
        case .doors(.open):
            doorsState = .isOpen
            print("Дверь открыта")
        case .engine(.turnOn):
            engineState = .on
            print("Мотор включен")
        case .engine(.turnOff):
            engineState = .off
            print("Мотор выключен")
        case .hatch(.open):
            hatchState = .isOpen
            print("Люк открыт")
        case .hatch(.close):
            hatchState = .isClose
            print("Люк закрыт")
        case .trunk(.open):
            trunkState = .isOpen
            print("Багажник открыт")
        case .trunk(.close):
            trunkState = .isClose
            print("Багажник закрыт")
        case let .trunk(.put(value)):
            print("В багажник положили груз весом: \(value)")
        case let .trunk(.take(value)):
            print("Из багажника достали груз весом: \(value)")
        case .windows(.open):
            windowsState = .isOpen
            print("Окно открыто")
        case .windows(.close):
            windowsState = .isClose
            print("Окно закрыто")
        }

        
    }
    
}

class TrunkCar: Car {
    var hasTrailer: Bool = false
    var hasHatch: Bool = false
    var trailerState: TrunkState = .isClose
    var hatchState: HatchState = .isClose
    var maxTrailerVolume: Double
    
    init(brand: String, year: Int, hasTrailer: Bool, hasHatch: Bool, maxTrailerVolume: Double) {
        self.maxTrailerVolume = maxTrailerVolume
        self.hasTrailer = hasTrailer
        self.hasHatch = hasHatch
        
        super.init(brand: brand, year: year)
    }
    
    override func performAction(with obj: CarObjects) {
        super.performAction(with: obj)
        print("Вызвали дочернюю функцию")
        switch obj {
        case .doors(.close):
            doorsState = .isClose
            print("Дверь закрыта")
        case .doors(.open):
            doorsState = .isOpen
            print("Дверь открыта")
        case .engine(.turnOn):
            engineState = .on
            print("Мотор включен")
        case .engine(.turnOff):
            engineState = .off
            print("Мотор выключен")
        case .hatch(.open):
            if hasHatch == false {
                print("Опция люка не предоставлена")
            } else {
                hatchState = .isOpen
                print("Люк открыт")
            }
        case .hatch(.close):
            if hasHatch == false {
                print("Опция люка не предоставлена")
            } else {
                hatchState = .isClose
                print("Люк закрыт")
            }
        case .trunk(.open):
            if hasTrailer == false {
                print("Опция трейлера не предоставлена")
            } else {
                trailerState = .isOpen
                print("Багажник открыт")
            }
        case .trunk(.close):
            if hasTrailer == false {
                print("Опция трейлера не предоставлена")
            } else {
                trailerState = .isClose
                print("Багажник закрыт")
            }
        case let .trunk(.put(value)):
            if hasTrailer == false {
                print("Опция трейлера не предоставлена")
            } else {
                print("В багажник положили груз весом: \(value)")
            }
        case let .trunk(.take(value)):
            if hasTrailer == false {
                print("Опция трейлера не предоставлена")
            } else {
                print("Из багажника достали груз весом: \(value)")
            }
        case .windows(.open):
            windowsState = .isOpen
            print("Окно открыто")
        case .windows(.close):
            windowsState = .isClose
            print("Окно закрыто")
        }

        
    }
    
}
var car1 = Car(brand: "Lada", year: 2020)
print("\(car1.engineState)")
var sportCar1 = SportCar(brand: "Honda", year: 2020, maxTrunkVolume: 100)
print("\(sportCar1.engineState)")
car1.performAction(with: .engine(.turnOn))
print("\(car1.engineState)")
sportCar1.performAction(with: .engine(.turnOn))
print("\(sportCar1.engineState)")
sportCar1.performAction(with: .trunk(.put(value: 100)))


var trunkCar1 = TrunkCar(brand: "Volvo", year: 2018, hasTrailer: false, hasHatch: false, maxTrailerVolume: 0)

trunkCar1.performAction(with: .hatch(.open))


