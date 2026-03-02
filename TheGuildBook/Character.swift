import Foundation

struct Character {
    let id = UUID()
    var name: String
    var job: Job
    var level: Int
    var description: String?
}

enum Job: CaseIterable, Identifiable {
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

extension Character: Identifiable { }

import Playgrounds

#Playground {
    let characters = [
        Character(name: "Aria", job: .warrior, level: 5, description: nil),
        Character(name: "Luna", job: .mage, level: 3, description: "A new character"),
        Character(name: "Finn", job: .rogue, level: 4, description: "There is a rogue")
    ]
}
