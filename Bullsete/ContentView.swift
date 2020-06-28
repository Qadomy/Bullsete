//
//  ContentView.swift
//  Bullsete
//
//  Created by mac on 6/28/20.
//  Copyright © 2020 com.qadomy. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    @State var round = 0
    
  struct LabelStyle:ViewModifier {
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .font(Font.custom("Avenir-Heavy", size: 18))
            .modifier(Shadow())
        }
  }
    

    struct ValueStyle:ViewModifier {
          func body(content: Content) -> some View {
              return content
              .foregroundColor(Color.yellow)
              .font(Font.custom("Avenir-Heavy", size: 24))
              .modifier(Shadow())
          }
    }
    
    struct ButtonLargStyle:ViewModifier {
          func body(content: Content) -> some View {
              return content
              .foregroundColor(Color.yellow)
              .font(Font.custom("Avenir-Heavy", size: 18))
          }
    }
    
    struct ButtonSmallStyle:ViewModifier {
          func body(content: Content) -> some View {
              return content
              .foregroundColor(Color.yellow)
              .font(Font.custom("Avenir-Heavy", size: 12))
          }
    }
    
    
    struct Shadow:ViewModifier {
          func body(content: Content) -> some View {
              return content
              .shadow(color:Color.black, radius: 5, x:2, y:2)
          }
    }
    

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to: ").modifier(LabelStyle())

                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            HStack{
                Text("1").modifier(LabelStyle())
                Slider(value: $sliderValue, in: 1...100)
                Text("100").modifier(LabelStyle())
            }
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit Me!").modifier(ButtonLargStyle())
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text(titleAlert()),
                message:
                    Text("Your Score:\(roundedNumber()) \n" +
                        "You record \(pointForCurrentRound()) points this round"),
                dismissButton: .default(Text("Awosome!")){
                    self.score = self.score + self.pointForCurrentRound()
                    self.target = Int.random(in: 1...100)
                    self.round += 1
                    })
            }
            .background(Image("Button")).modifier(Shadow())
            Spacer()
            HStack{
                Button(action:{
                    self.startNewGame()
                }){
                    HStack{
                        Image("StartOverIcon")
                        Text("Start Over").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
                
                Spacer()
                
                Text("Score: ").modifier(LabelStyle())
                Text("\(score)").modifier(ValueStyle())
                
                Spacer()
                
                Text("Round: ").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                
                Spacer()
                

                NavigationLink(destination:InfoView()){
                    HStack{
                        Image("InfoIcon")
                        Text("Info").modifier(ButtonSmallStyle())
                    }
                }
                .background(Image("Button")).modifier(Shadow())
            }
            .padding(.bottom, 20)
        }
        .background(Image ("Background"),alignment: .center)
        .navigationBarTitle("Bullseye")
    }
    
    
    func roundedNumber() -> Int {
        Int(sliderValue.rounded())
    }
    
    fileprivate func differenceAmount() -> Int {
        return abs(target  - roundedNumber())
    }
    
    func pointForCurrentRound() -> Int {
        let maxScore = 100
        let difference = differenceAmount()
        let bonus:Int
        
        if difference == 0 {
            bonus = 100
        }else if difference == 1{
            bonus = 50
        }else{
            bonus = 0
        }
        
        return maxScore - difference + bonus
    }
    
    func titleAlert() -> String {
        let title: String
        
        if differenceAmount()==0 {
            title = "Perfect"
        }else if differenceAmount() < 5{
            title = "Not Bad"
        }else if differenceAmount() < 10{
            title = "Try Again"
        }else{
            title = "Are you even TRY!!"
        }
        
        
        return title
    }
    
    func startNewGame(){
        round = 0
        sliderValue = 50.0
        score = 0
        target = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
