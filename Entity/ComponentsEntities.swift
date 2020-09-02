
//
//  ComponentsEntity.swift
//  StackOv
//
//  Created by 360 medlink on 9/1/20.
//  Copyright © 2020 360 medlink. All rights reserved.
//

import Foundation


struct Line {
    let id = UUID()
    let label : String
    let answer : String
    var state : QState = .none
    var selection : Selecction = .unselected
    
}

enum QState {
    case valid,invalid, none
}

enum Selecction {
    case selected, unselected
}
