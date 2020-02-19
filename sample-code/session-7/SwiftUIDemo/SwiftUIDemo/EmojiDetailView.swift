//
//  EmojiDetailView.swift
//  SwiftUIDemo
//
//  Created by Susan Stevens on 2/17/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import SwiftUI

struct EmojiDetailView: View {
    
    let emoji: Emoji
    
    var body: some View {
        VStack {
            Image(emoji.imageName)
            Text(emoji.name)
                .font(.largeTitle)
            Text("Introduced in \(emoji.year)")
                .font(.subheadline)
        }
        .navigationBarTitle(Text(emoji.name), displayMode: .inline)
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(emoji: emojiData()[5])
    }
}
