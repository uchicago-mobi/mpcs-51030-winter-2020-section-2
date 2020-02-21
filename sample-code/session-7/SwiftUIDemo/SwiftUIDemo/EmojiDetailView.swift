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
    
    @EnvironmentObject var preferences: Preferences
    
    @State var favorite: Bool = false
    
    var body: some View {
        VStack {
            Image(emoji.imageName)
            Text(emoji.name)
                .font(.largeTitle)
            
            if self.preferences.displayYears {
                Text("Introduced in \(emoji.year)")
                    .font(.subheadline)
            }
        }
        .navigationBarTitle(Text(emoji.name), displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            self.favorite.toggle()
        }, label: {
            FavoriteStar(favorite: self.$favorite)
        }))
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmojiDetailView(emoji: emojiData()[5])
        }
    }
}
