//
//  Question.swift
//  StackOv
//
//  Created by 360 medlink on 8/31/20.
//  Copyright © 2020 360 medlink. All rights reserved.
//

import Foundation

struct Question {
    let id: Int
    let question, answer: String
    let choices : [String]
    
    init(id : Int , question : String, rawChoices : String , answer : String) {
        self.id = id
        self.question = question
        self.choices = rawChoices.components(separatedBy: "\n")
        self.answer = answer
    }

}
