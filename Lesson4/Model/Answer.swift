//
//  Answer.swift
//  Lesson4
//
//  Created by Ян Таше on 25.03.2022.
//

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case pig = "🐷"
    case monkey = "🦧"
    case mouse = "🐭"
    var definition: String {
        switch self {
        case .dog:
            return "собака"
        case .mouse:
            return "мышь"
        case .monkey:
            return "обезьяна"
        case .pig:
            return "свинья"
        }
    }
}
