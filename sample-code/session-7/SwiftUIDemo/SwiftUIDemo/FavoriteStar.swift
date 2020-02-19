//
//  FavoriteStar.swift
//  SwiftUIDemo
//
//  Created by Susan Stevens on 2/18/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import SwiftUI

struct FavoriteStar: View {
    
    @Binding var favorite: Bool
    
    var body: some View {
        Image(systemName: self.favorite ? "star.fill" : "star")
            .foregroundColor(self.favorite ? .orange : .gray)
    }
}

struct FavoriteStar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FavoriteStar(favorite: .constant(true))
                .previewLayout(.fixed(width: 50,
                                      height: 50))
            
            FavoriteStar(favorite: .constant(false))
                .previewLayout(.fixed(width: 50,
                                      height: 50))
        }
    }
}
