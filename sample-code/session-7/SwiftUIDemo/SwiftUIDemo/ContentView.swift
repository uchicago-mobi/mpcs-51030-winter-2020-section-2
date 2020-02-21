//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Susan Stevens on 2/17/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: [Emoji] = emojiData()
    
    @EnvironmentObject var preferences: Preferences
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $preferences.displayYears, label: {
                    Text("Display years")
                })
                
                ForEach(emojis) { emoji in
                    NavigationLink(destination: EmojiDetailView(emoji: emoji), label: {
                      EmojiRow(emoji: emoji)
                    })
                }
            }
            .navigationBarTitle("Emojis")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
