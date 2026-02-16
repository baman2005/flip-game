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
    
    let cardnames = ["a1", "a2", "a3", "a4", "a5", "a6"]
      let columns = [GridItem(.flexible()),
                     GridItem(.flexible()),
                     GridItem(.flexible()) ]
    init() {
        _cards = State(initialValue: newcard())
    }
    var body: some View {
        
                NavigationStack {
                    
                   VStack {
                       HStack{
                           Text("Memory Game")
                              .font(.largeTitle)
                              .padding()
                              .bold()
                           Button{
                               restart()
                           } label: {
                               Image(systemName: "restart")
                                      .bold()
                                      .font(.largeTitle)
                                      .foregroundStyle(Color.black)
                           }
                       }
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
                                 .fill(Color.red)
                         }
                       
                     }.frame(height: 180)
                         .onTapGesture {
                             handlecardtap(index: index)
                         }
                 }
             }
            
                   }.padding(10)
           
        }
        
        
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
