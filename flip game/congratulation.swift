//
//  congratulation.swift
//  flip game
//
//  Created by applelab03 on 2/16/26.
//
import SwiftUI

struct congratulation: View {
    var body: some View {
      NavigationStack{
          ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                  .edgesIgnoringSafeArea(.all)
               VStack{
                  Text("Congratulation!")
                      .font(.largeTitle)
                      .padding()
                  
                   Text("You have completed the game!")
                      .font(.title2)
                      .padding(EdgeInsets(top: 200, leading: 0, bottom: 0, trailing: 0))
                  
                  ZStack{
                      Rectangle()
                          .frame(width: 200, height: 50)
                          .cornerRadius(50)
                          .foregroundColor(.blue)
                         
                      
                      NavigationLink(destination: ContentView()){
                          Text("Play again")
                              .font(.largeTitle)
                              .foregroundColor(.white)
                      }
                     
                  }.padding(EdgeInsets(top: 290, leading: 0, bottom: 0, trailing: 0))
              }
           
              
          }
          .ignoresSafeArea(edges: .all)
      }.toolbar(.hidden)
       
    }
}

#Preview{
    congratulation()
}
