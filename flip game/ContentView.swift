//
//  ContentView.swift
//  flip game
//
//  Created by applelab03 on 2/16/26.
//

import SwiftUI
struct cardmodel: Identifiable {
    let id = UUID()
    let name: String
    var ismatched: Bool = false
    var isfaceup: Bool = false
}
struct ContentView: View {
    @State private var cards: [cardmodel] = []
    @State private var selection1: Int? = nil
    @State private var Moves: Int = 0
    
    let cardnames = ["a1", "a5", "a2" ]
    let columns = [GridItem(.flexible(minimum: 80, maximum: 180)),
                     GridItem(.flexible(minimum: 80, maximum: 180)) ]
    init() {
        _cards = State(initialValue: newcard())
    }
    var body: some View {
        
                NavigationStack {
                    
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Spacer()
                            HStack{
                                Text("Memory Game")
                                   .font(.largeTitle)
                                   .padding()
                                   .bold()
                                Button{
                                    restart()
                                    Moves = 0
                                } label: {
                                    Image(systemName: "restart")
                                           .bold()
                                           .font(.largeTitle)
                                           .foregroundStyle(Color.black)
                                }
                            }
                            Spacer()
                  LazyVGrid(columns: columns) {
                      ForEach(cards.indices, id: \.self) { index in
                          ZStack{
                              if cards[index].isfaceup || cards[index].ismatched{
                                  Image(cards[index].name)
                                      .resizable()
                                      .scaledToFit()
                                      .padding(10)
                                      .background(Color.white)
                              }else{
                                  RoundedRectangle(cornerRadius: 10)
                                      .fill(Color.white.opacity(0.6))
                              }
                            
                          }.frame(height: 180)
                              .onTapGesture {
                                  handlecardtap(index: index)
                                  Moves += 1
                              }
                      }
                  }
                   ZStack{
                       Rectangle()
                           .frame(width: 300, height: 50)
                           .foregroundColor(.black.opacity(0.5))
                           .cornerRadius(50)
                       VStack{
                           Text("Moves: \(Moves)")
                               .font(.largeTitle)
                               .foregroundColor(.white)
                       }
                     
                   }
                            ZStack{
                                Rectangle()
                                    .frame(width: 150, height: 80)
                                    .foregroundColor(.black.opacity(0.5))
                                    .cornerRadius(50)
                                NavigationLink{
                                    if Moves == 6{
                                        congratulation()
                                    }else {
                                       oops()
                                    }
                                        
                                }label: {
                                    Text("submit")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                }
                            }
                            Spacer()
                        }.padding(10)
     //                        .background(.pink.opacity(0.4))
                             .ignoresSafeArea()
                    }
           
                }.toolbar(.hidden)
        
        
        }
    func newcard() -> [cardmodel] {
        var newcards: [cardmodel] = []
        
        for name in cardnames{
            newcards.append(cardmodel(name: name))
            newcards.append(cardmodel(name: name))
            
        }
        return newcards.shuffled()
    }
    func handlecardtap(index: Int){
        if cards[index].ismatched || cards[index].isfaceup {
            return
        }
        cards[index].isfaceup = true
        
        if let firstindex = selection1 {
            if cards[firstindex].name == cards[index].name{
                cards[firstindex].ismatched = true
                cards[index].ismatched = true
            }else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    cards[firstindex].isfaceup = false
                    cards[index].isfaceup = false
                }
            }
            selection1 = nil
        } else{
            selection1 = index
        }
    }
    func restart() {
        cards = newcard()
        selection1 = nil
    }
}

#Preview {
    ContentView()
}
