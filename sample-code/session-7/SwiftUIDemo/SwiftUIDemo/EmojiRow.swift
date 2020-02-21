//
//  EmojiRow.swift
//  SwiftUIDemo
//
//  Created by Susan Stevens on 2/19/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import SwiftUI

struct EmojiRow: View {
    
    let emoji: Emoji
    
    var body: some View {
        HStack {
            Image(emoji.imageName)
                .resizable()
                .frame(width: 60, height: 60)
            Text(emoji.name)
                .font(.headline)
        }
    }
}

struct EmojiRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmojiRow(emoji: emojiData()[5])
                .previewLayout(.fixed(width: 400, height: 80))
            EmojiRow(emoji: emojiData()[6])
        }
    }
}
