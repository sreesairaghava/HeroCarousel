//
//  ContentView.swift
//  HeroCarousel
//
//  Created by Sree Sai Raghava Dandu on 28/12/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeModel =  CarouselViewModel()
    var body: some View {
        Home()
        //Using it as environmental variable
            .environmentObject(homeModel )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
