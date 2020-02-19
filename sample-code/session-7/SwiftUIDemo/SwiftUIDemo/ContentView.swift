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
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
