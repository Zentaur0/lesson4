//
//  main.swift
//  lesson4
//
//  Created by Антон Сивцов on 28.12.2020.
//

import Foundation

enum BrandSport {
    case porshe, ferrari, bugatti
}

enum BrandTrunk {
    case volvo, man, daf
}

enum ReleaseYear {
    case year2020, year2019, year2018
}

enum SportMode: String {
    case turnedOn
    case turnedOff
}

enum Spotlights: String {
    case activate
    case dectivate
}

enum Windows: String {
    case open = "открыты"
    case closed = "закрыты"
}

enum TrunkOccupancy: String {
    case full = "полный"
    case empty = "пустой"
}

class Car {
    let releaseYear: ReleaseYear
    var trunkVolume: Double
    var engine: Bool
    var windows: Windows
    var trunkOccupancy: TrunkOccupancy

    func transform() { //обычная машина
        
    }

    init(releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy) {
        self.releaseYear = releaseYear
        self.trunkVolume = trunkVolume
        self.engine = engine
        self.windows = windows
        self.trunkOccupancy = trunkOccupancy
    }
}

class SportCar: Car {
    var brand: BrandSport
    var sportMode: SportMode {
        didSet {
            print("Супер-сверх-режим активирован")
        }
        willSet {
            print("В таком виде мы ничего не сомжем сделать...")
        }
    }

    override func transform() { //спортивный автобот
        print("Трансформируюсь! Автоботы вперед!")
    }
    
    func destroy() {
        print("Уничтожить всех врагов, пиф-паф")
    }

    init(brand: BrandSport, sportMode: SportMode, releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy) {
        self.brand = brand
        self.sportMode = sportMode
        super.init(releaseYear: releaseYear, trunkVolume: trunkVolume, engine: engine, windows: windows, trunkOccupancy: trunkOccupancy)
    }
}

class TrunkCar: Car {
    var brand: BrandTrunk
    var spotlights: Spotlights {
        didSet {
            print("Сверхсветовые прожекторы активированы, но бесполезны. Ослепить всех!")
        }
    }
    
    override func transform() { //грузовой десептикон
        print("Десептиконы повержаны, крх крхкх крхкхкхккк...")
    }
    
    func destroy() {
        print("Мы все умрем, аргххгргрх")
    }

    init(brand: BrandTrunk, spotlights: Spotlights, releaseYear: ReleaseYear, trunkVolume: Double, engine: Bool, windows: Windows, trunkOccupancy: TrunkOccupancy) {
        self.brand = brand
        self.spotlights = spotlights
        super.init(releaseYear: releaseYear, trunkVolume: trunkVolume, engine: engine, windows: windows, trunkOccupancy: trunkOccupancy)
    }
}

var car = Car(releaseYear: .year2018, trunkVolume: 200, engine: false, windows: .closed, trunkOccupancy: .empty)
var sportCar = SportCar(brand: .ferrari, sportMode: .turnedOff, releaseYear: .year2019, trunkVolume: 150, engine: true, windows: .closed, trunkOccupancy: .empty)
var sportCar2 = SportCar(brand: .porshe, sportMode: .turnedOn, releaseYear: .year2020, trunkVolume: 50, engine: true, windows: .open, trunkOccupancy: .empty)
var trunkCar = TrunkCar(brand: .man, spotlights: .dectivate, releaseYear: .year2018, trunkVolume: 1000, engine: true, windows: .open, trunkOccupancy: .full)
var trunkCar2 = trunkCar

sportCar.sportMode = .turnedOn
sportCar.transform()
sportCar2.destroy()
trunkCar2.engine = false
trunkCar.spotlights = .activate
trunkCar.destroy()
trunkCar2.transform()
