import UIKit

enum CarObjects {
    case windows(WindowsActions)
    case doors(DoorsActions)
    case trunk(TrunkActions)
    case sunroof(SunroofActions)
    case engine(EngineActions)
}


enum SunroofState{
    case isOpen, isClose
}

enum SunroofActions{
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
    let maxTrunkVolume: Double
    let engineState: EngineState
    let doorsState: DoorsState
    let windowsState: WindowState
    let trunkState: TrunkState
    let sunroofState: SunroofState
    
    init(brand: String, year: Int, maxTrunkVolume: Double, engineState: EngineState, doorsState: DoorsState, windowsState: WindowState, trunkState: TrunkState, sunroofState: SunroofState)
    
    init(brand: String, year: Int, maxTrunkVolume: Double)
    
    func performAction(with obj: CarObjects) {}
}

