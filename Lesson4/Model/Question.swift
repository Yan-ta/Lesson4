//
//  Question.swift
//  Lesson4
//
//  Created by Ян Таше on 25.03.2022.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestion() -> [Question]{
        return [Question(text: "Какую пищу вы предпочитаете",
                         type: .single,
                         answers: [Answer(text: "Стейк", type: .dog),
                                   Answer(text: "Рыба", type: .monkey),
                                   Answer(text: "Морковь", type: .pig),
                                   Answer(text: "Кукуруза", type: .mouse)]),
                Question(text: "Что вы любите делать?",
                         type: .multiple,
                         answers: [Answer(text: "Плавать", type: .dog),
                                   Answer(text: "Спать", type: .monkey),
                                   Answer(text: "Обниматься", type: .pig),
                                   Answer(text: "Есть", type: .mouse)]),
                Question(text: "Любите ли вы поездки на машине?",
                         type: .range,
                         answers: [Answer(text: "Обожаю", type: .dog),
                                   Answer(text: "Обожаю", type: .monkey),
                                   Answer(text: "Ненавижу", type: .pig),
                                   Answer(text: "Ненавижу", type: .mouse)]),
               ]
    }
}
