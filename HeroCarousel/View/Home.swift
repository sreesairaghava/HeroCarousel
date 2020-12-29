//
//  Home.swift
//  HeroCarousel
//
//  Created by Sree Sai Raghava Dandu on 28/12/20.
//

import SwiftUI
//width...
var width = UIScreen.main.bounds.width
struct Home: View {
    @EnvironmentObject var model: CarouselViewModel
    @Namespace var animation
    var body: some View {
        ZStack {
            VStack{
                HStack{
                    Button(action: {
                        print("Button-1 pressed")
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundColor(.gray)
                    })
                    Text("Health Tips")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.leading)
                    Spacer()
                }//:HSTACK
                .padding()
                //Carousel...
                ZStack{
                    ForEach(model.cards.indices.reversed(),id:\.self ){ index in
                        HStack {
                            CardView(card: model.cards[index], animation: animation)
                                .frame(width: getCardWidth(index: index), height: getCardHeight(index: index))
                                .offset(x:getCardOffset(index: index))
                                .rotationEffect(.init(degrees: getCardRotation(index: index )))
                            Spacer(minLength: 0)
                        }
                        .frame(height:400)
                        .contentShape(Rectangle())
                        .offset(x:model.cards[index].offset)
                        .gesture(DragGesture(minimumDistance: 0)
                                    .onChanged({value in
                                        onChanged(value: value, index: index)
                                    })
                                    .onEnded({value in
                                        onEnded(value: value, index: index)
                                    })
                        )
                        
                    }
                }//:ZSTACK
                .padding(.top,25)
                .padding(.horizontal,30)
                
                Button(action: {
                   ResetViews()
                }, label: {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.white)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(radius: 3)
                })
                .padding(.top,35)
                
                Spacer()
            }
            //Detailed View
            if model.showCard{
                DetailView(animation:  animation)
            }
        }//:VSTACK
    }//:ZSTACK
    //Resting views...
    func ResetViews(){
        for index in model.cards.indices{
            withAnimation(.spring()){
                model.cards[index].offset = 0
                model.swipeCard = 0
            }
        }
    }
    
    //Getting rotation when card is being swiped
    func getCardRotation(index:Int) -> Double {
        let boxWidth = Double(width/3)
        let offset = Double(model.cards[index].offset)
        let angle : Double = 5
        return (offset / boxWidth) * angle
        
    }
    
    func onChanged(value:DragGesture.Value,index:Int) {
        //only left swipe
        if value.translation.width < 0{
            model.cards[index].offset = value.translation.width
        }
    }
    func onEnded(value:DragGesture.Value,index:Int) {
        withAnimation{
            if -value.translation.width > width / 3{
                model.cards[index].offset = -width
                model.swipeCard += 1
            }
            else{
                model.cards[index].offset = 0
            }
        }
       
    }
    //Getting offest for the cards
    func getCardOffset(index:Int) -> CGFloat {
        return (index - model.swipeCard) <= 2 ? CGFloat(index - model.swipeCard) * 30 : 60
    }
    
    //Getting Height and width of the card
    func getCardHeight(index: Int) -> CGFloat {
        let height: CGFloat = 400
        let cardHeight = (index - model.swipeCard) <= 2 ? CGFloat(index - model.swipeCard ) * 35 : 70
        return height - cardHeight
    }
    
    func getCardWidth(index: Int) -> CGFloat {
        let boxWidth = UIScreen.main.bounds.width - 60 - 60
        //For Frist three cards
       // let cardWidth = index <= 2 ? CGFloat(index) * 30 : 60
        return boxWidth
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
