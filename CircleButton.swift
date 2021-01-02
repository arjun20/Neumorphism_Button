//
//  CircleButton.swift
//  SwiftUI_Button
//
//  Created by Arjun on 18/12/20.
//  Copyright © 2020 Arjun. All rights reserved.
//

import SwiftUI

struct CircleButton: View {
    @State var tap = false
    @State var press = false
    
    var body: some View {
        VStack{
            
        ZStack{
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? -90 : 0, y: press ? -90 : 0)
                .rotation3DEffect(Angle(degrees: press ? 20 : 0), axis: (x: 10, y: -10, z: 0))
            
            Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                .offset(x: press ? 0 : 90, y: press ? 0 : 90)
                .rotation3DEffect(Angle(degrees: press ? 0 : 20), axis: (x: -10, y: 10, z: 0))
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color(press ? #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1)), radius: 3, x: -5, y: -5)

                Circle()
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color(press ?  #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ), radius: 3,x: 3, y: 3)
            }
        )
            .clipShape(Circle())
            .shadow(color: Color(press ?  #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ), radius: 20, x: -20, y: -20)
            .shadow(color: Color(press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)  : #colorLiteral(red: 0.6959404011, green: 0.7919648188, blue: 0.9181742698, alpha: 1)  ), radius: 20, x: 20, y: 20)
            .scaleEffect(tap ? 1.2 : 1)
            .gesture(LongPressGesture().onChanged({ (value) in
                self.tap = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.tap = false
                }
            }).onEnded({ (value) in
                self.press.toggle()
            }))
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(#colorLiteral(red: 0.8072218615, green: 0.9044003463, blue: 0.9771375317, alpha: 1))).edgesIgnoringSafeArea(.all)
        
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        CircleButton()
    }
}
