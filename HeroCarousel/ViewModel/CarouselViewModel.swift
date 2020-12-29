//
//  CarouselViewModel.swift
//  HeroCarousel
//
//  Created by Sree Sai Raghava Dandu on 28/12/20.
//

import SwiftUI

class CarouselViewModel: ObservableObject {
    @Published var cards = [
        Card(cardColor: Color("blue"), title: "Avoid processed junk food"),
        Card(cardColor: Color("purple"), title: "Take care of your gut health with probiotics and fiber"),
        Card(cardColor: Color("green"), title: "Drink some water, especially before meals"),
        Card(cardColor: Color.yellow, title: "Don't skip breakfast"),
        Card(cardColor: Color.orange, title: "Take vitamin D3 if you don’t get much sun exposure")
    ]
    @Published var swipeCard = 0
//    Detail Content...
    @Published var showCard = false
    @Published var selectedCard = Card(cardColor: .clear, title: "")
    @Published var showContent = false
    @Published var content = "When eating healthy, flexibility often works best, says Joyce Meng, MD, assistant professor at the Pat and Jim Calhoun Cardiology Center at UConn Health. If you like to follow a strict diet plan, go for it. If not, it's OK. Find what works for you.Tricia Montgomery, 52, the founder of K9 Fit Club, knows first-hand how the right diet and lifestyle can help. For her, choosing healthy foods and planning small, frequent meals works well."
}

