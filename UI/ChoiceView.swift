//
//  ContentView.swift
//  StackOv
//
//  Created by 360 medlink on 8/31/20.
//  Copyright © 2020 360 medlink. All rights reserved.
//

import SwiftUI

struct ChoiceView: View {
    
    var ranId_CV : Int // random id pass from ContentView
    
    var delegate : ChoiceRowView? // delegates can't be used in SwiftUI
    
    @State var qandaData : [Question] = [
        Question(id : 1 , question : "Which ones are odd number?", rawChoices : "A. 1\nB. 2\nC. 3\nD. 4" , answer : "AC"),
        Question(id : 2 , question : "This is another question", rawChoices : "A. 1\nB. 2\nC. 3\nD. 4" , answer : "B")
    ]
    
    // Array of Line object containing all the question proposition and their state
    @State var lines : [Line] = []
    
    var body: some View {
        ScrollView {
            Text(self.qandaData[ranId_CV].question)
            HStack{
                VStack(alignment: .leading){
                    ForEach (self.lines.indices, id: \.self){ index in
                        ChoiceRowView(line: self.$lines[index])
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding([.top, .leading, .bottom, .trailing])
            .onAppear(perform: {
                self.qandaData[self.ranId_CV].choices.forEach { (label) in
                    self.lines.append(Line(label: label , answer: self.qandaData[self.ranId_CV].answer))
                }
            })
            
            Button(action: {
                self.test_CV()
            }, label: {
                Text("Test_CV")
            })
        }
    }
    
    func test_CV() {
        //        delegate?.checkAnswer()
        
        self.lines.indices.forEach { (index) in
            self.lines[index].state = .none // restore correction state
        }
        
        self.lines.indices.forEach { (index) in
            if self.lines[index].selection == .selected {
                self.qandaData[self.ranId_CV].answer.forEach({ (char) in
                    if self.lines[index].label.prefix(1).contains(char) && self.lines[index].selection == .selected {
                        self.lines[index].state = .valid
                    }else{
                        self.lines[index].state = .invalid
                    }
                    
                })
            }
        }
    }
    
}



struct ChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceView(ranId_CV: 1)
    }
}

