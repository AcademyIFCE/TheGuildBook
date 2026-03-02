import Foundation

struct Character {
    let id = UUID()
    var name: String
    var job: String?
    var level: Int
}

extension Character: Identifiable { }

import Playgrounds

#Playground {
    let characters = [
        Character(name: "Aria", job: "Warrior", level: 5),
        Character(name: "Luna", job: "Mage", level: 3),
        Character(name: "Finn", job: "Rogue", level: 4)
    ]
}
