//
//  Card.swift
//  HeroCarousel
//
//  Created by Sree Sai Raghava Dandu on 28/12/20.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardColor: Color
    var offset: CGFloat = 0
    var title:String
}
