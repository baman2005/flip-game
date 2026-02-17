//
//  oops.swift
//  flip game
//
//  Created by applelab03 on 2/17/26.
//
import SwiftUI
struct oops: View {
    var body: some View {
        NavigationStack{
            ZStack{
              LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                 VStack{
                    Text("oops!")
                        .font(.largeTitle)
                        .padding()
                    
                     Text("You are failed to complete game bcoz you do more than 6 moves!")
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
#Preview {
    oops()
}
