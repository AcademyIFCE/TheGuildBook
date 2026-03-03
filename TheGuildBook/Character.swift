import Foundation

import SwiftData

@Model
class Character {
    var name: String
    var job: Job
    var level: Int
    var characterDescription: String?
    
    init(
        name: String,
        job: Job,
        level: Int,
        characterDescription: String? = nil
    ) {
        self.name = name
        self.job = job
        self.level = level
        self.characterDescription = characterDescription
    }
}

enum Job: CaseIterable, Identifiable, Codable {
    case warrior
    case paladin
    case samurai
    case gladiator
    case assassin
    case archer
    case wizard
    case hunter
    case rogue
    case mage
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .warrior: return "Warrior"
        case .paladin: return "Paladin"
        case .samurai: return "Samurai"
        case .gladiator: return "Gladiator"
        case .assassin: return "Assassin"
        case .archer: return "Archer"
        case .wizard: return "Wizard"
        case .hunter: return "Hunter"
        case .rogue: return "Rogue"
        case .mage: return "Mage"
        }
    }
    
    var emoji: String {
        switch self {
        case .warrior: return "🗡️"
        case .paladin: return "🛡️"
        case .samurai: return "⚔️"
        case .gladiator: return "🏟️"
        case .assassin: return "🥷"
        case .archer: return "🏹"
        case .wizard: return "🧙‍♂️"
        case .hunter: return "🐺"
        case .rogue: return "🗝️"
        case .mage: return "🔮"
        }
    }
    
}

import Playgrounds

#Playground {
    let characters = [
        Character(name: "Aria", job: .warrior, level: 5, characterDescription: nil),
        Character(name: "Luna", job: .mage, level: 3, characterDescription: "A new character"),
        Character(name: "Finn", job: .rogue, level: 4, characterDescription: "There is a rogue")
    ]
}

#Playground("Usando struct") {
    struct Item {
        var name: String
    }
    
    var item1 = Item(name: "Maçã")
    var item2 = item1
    item2.name = "Banana"
    
    print("Item1: \(item1.name) \nItem2: \(item2.name)")
}

#Playground("Usando class") {
    class Item {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    var item1 = Item(name: "Maçã")
    var item2 = item1
    item2.name = "Banana"
    
    print("Item1: \(item1.name) \nItem2: \(item2.name)")
}
