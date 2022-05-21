//
//  DetailView.swift
//  HeroCarousel
//
//  Created by Sree Sai Raghava Dandu on 29/12/20.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: CarouselViewModel
    var animation: Namespace.ID
    var body: some View {
        ZStack {
            VStack{
                Text("Monday 28 December")
                    .font(.caption)
                    .foregroundColor(Color.white.opacity(0.85))
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding()
                    .padding(.top,10)
                    .matchedGeometryEffect(id: "Date-\(model.selectedCard.id)", in: animation)
                HStack {
                    Text(model.selectedCard.title)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width:250,alignment: .leading)
                        .padding()
                        .matchedGeometryEffect(id: "Title-\(model.selectedCard.id)", in: animation)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                //Detail View content
                if model.showContent {
                    Text(model.content)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer(minLength: 0)
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .background(
                model.selectedCard.cardColor
                    .cornerRadius(25)
                    .matchedGeometryEffect(id: "bgColor-\(model.selectedCard.id)", in: animation)
                    .ignoresSafeArea(.all,edges: .bottom)
        )
            
            //Close Button
            VStack{
                Spacer()
                if model.showContent{
                    Button(action: {
                        CloseDetailedView()
                    }, label: {
                        Image(systemName: "arrow.down")
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .background(Color.white.opacity(0.7))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 8)
                    })
                    .padding()
                }
            }
        }
    }
    
    //function to close the detailedView
    func CloseDetailedView(){
        withAnimation(.spring()){
            model.showCard.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeIn){
                    model.showContent = false
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
