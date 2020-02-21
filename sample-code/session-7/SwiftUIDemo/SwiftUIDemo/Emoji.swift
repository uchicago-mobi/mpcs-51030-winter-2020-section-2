//
//  Emoji.swift
//  SwiftUIDemo
//
//  Created by Susan Stevens on 2/17/20.
//  Copyright © 2020 Susan Stevens. All rights reserved.
//

import Foundation

struct Emoji: Codable, Identifiable {
    let name: String
    let year: String
    let imageName: String
    let id: UUID = UUID()
}

func emojiData() -> [Emoji] {
    let url = Bundle.main.url(forResource: "emojiData", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    return try! JSONDecoder().decode([Emoji].self, from: data)
}
