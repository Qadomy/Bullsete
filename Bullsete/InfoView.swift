//
//  Info.swift
//  Bullsete
//
//  Created by mac on 6/28/20.
//  Copyright © 2020 com.qadomy. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    let beige = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct AboutHearderStyle:ViewModifier {
          func body(content: Content) -> some View {
              return content
                  .foregroundColor(Color.black)
                  .font(Font.custom("Avenir-Heavy", size: 20))
                  .padding(.top,20)
                  .padding(.bottom,20)
          }
    }
    
    struct AboutBodyStyle:ViewModifier {
          func body(content: Content) -> some View {
              return content
                  .foregroundColor(Color.black)
                  .font(Font.custom("Avenir-Heavy", size: 10))
                  .padding(.leading,60)
                  .padding(.trailing,60)
                  .padding(.bottom,20)
                  
          }
    }
    
    var body: some View {
        Group{
            VStack{
                    Text("🎯 Bullseye 🎯").modifier(AboutHearderStyle())
                    Text("This is Bullseye, the game whwew you can win points and earn fame by dragging a slider.").modifier(AboutHearderStyle()).lineLimit(nil)
                Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutHearderStyle()).lineLimit(nil)
                    Text("Enjoy!").modifier(AboutHearderStyle())
                }
            .navigationBarTitle("About Bullseye")
            .background(beige)
        }
    .background(Image("Background"))
    }
}

struct Info_Previews: PreviewProvider {
    static var previews: some View {
        InfoView().previewLayout(.fixed(width: 896, height: 414))
    }
}
