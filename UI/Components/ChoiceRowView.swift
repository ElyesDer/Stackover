//
//  ChoiceRowView.swift
//  StackOv
//
//  Created by 360 medlink on 8/31/20.
//  Copyright © 2020 360 medlink. All rights reserved.
//

import SwiftUI

protocol checkAnswerProtocol {
    func checkAnswer()
}

struct ChoiceRowView: View {
    
    @Binding var line : Line

//    var label: String
//    var answer: String
    @State var isChecked : Bool = false
    @State var fgColor : Color = .black
    
    
    func buttonPress() {
        
        isChecked = !isChecked
        self.line.selection = isChecked ? .selected : .unselected
        
        if isChecked == false {
            fgColor = .black
        } else {
            fgColor = .blue
        }
        
        //            selectedAnswer = selectedAnswer.filter { $0 != item_BP.prefix(1) }
    }
    
    func checkAnswer() {
        
        print("executed checkAnswer")
        
        switch (isChecked, self.line.label.contains(String(self.line.label.prefix(1)))) {
            
        //selected = isChecked = true, qandaData.answer contain prefix(1)  => change to green
        case (true, true) : fgColor = .green
            
        //selected = isChecked = true, incorrect => change to red
        case (true, false) : fgColor = .red
            
        //unselected = isChecked = false, correct => change to red
        case (false, true) : fgColor = .red
        //unselected = isChecked = false, incorrect => remain unchange
        default: print("do nothing")
        }
        
    }
    
    
    var body: some View {
        HStack{
            Button(action: {
                self.buttonPress()
                
            }) {
                
                Image(systemName: isChecked ? "checkmark.square": "square")
                Text(self.line.label)
            }
            .foregroundColor(self.line.state != .none  ? (self.line.state == .valid ? .green : .red) : .blue )
        }
    }
    
}


struct ChoiceRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
