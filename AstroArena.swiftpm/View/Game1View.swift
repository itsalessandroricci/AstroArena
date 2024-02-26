//
//  Game1View.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 22/02/24.
//

import SwiftUI

struct Game1View: View {
    @ObservedObject var game1LogicViewModel: Game1LogicViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .ignoresSafeArea()
                
                if (game1LogicViewModel.model.quizGameCompleted) {
                    Game1OverView(game1LogicViewModel: game1LogicViewModel)
                } else {
                    ScrollView(showsIndicators: false){ 
                        VStack{
                            VStack {
                                TextComponent(text: "QUIZ #1", size: 70)
                                    .padding()
                                
                                TextComponent(text: game1LogicViewModel.model.quizGameModel.question, size: 35)
                                    .lineLimit(3)
                                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment: .center)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                ZStack {
                                    Circle()
                                        .stroke(lineWidth: 15)
                                        .foregroundColor(Color("bgPlanetInformation"))
                                        .opacity(0.8)
                                    
                                    Circle()
                                        .trim(from: 0.0, to: min(CGFloat((Double(game1LogicViewModel.progress1) * Double(game1LogicViewModel.maxProgress1))/30),1.0))
                                        .stroke(Color("redAstroArena"),
                                                style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                        .rotationEffect(Angle(degrees: 270))
                                        .animation(Animation.linear(duration: Double(game1LogicViewModel.maxProgress1)), value: game1LogicViewModel.progress1)
                                    
                                    TextComponent(text: String(game1LogicViewModel.progress1), size: 50)
                                }.frame(width: 150, height: 200)
                                
                                Spacer()
                                
                                OptionsGrid1View(game1LogicViewModel: game1LogicViewModel)
                            }
                            
                        }
                    }
                    .aspectRatio(contentMode: .fit)
                }
            }
            .navigationBarHidden(true)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Game1View(game1LogicViewModel: Game1LogicViewModel())
}


struct OptionsGrid1View: View {
    var game1LogicViewModel: Game1LogicViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(200), spacing: 390), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(game1LogicViewModel.model.quizGameModel.optionsList) { game1Answer in
                OptionCard1View(game1Answer: game1Answer)
                    .onTapGesture {
                        game1LogicViewModel.verifyAnswer(selectedOption: game1Answer)
                    }
            }
        }
    }
}

struct OptionCard1View : View {
    var game1Answer: Game1Answer
    var body: some View {
        VStack {
            if (game1Answer.isMatched) && (game1Answer.isSelected) {
                OptionStatusImage2View(imageName: "checkmark")
            } else if (!(game1Answer.isMatched) && (game1Answer.isSelected)) {
                OptionStatusImage1View(imageName: "xmark")
            } else {
                Option1View(game1Answer: game1Answer)
            }
        }.frame(width: 550, height: 120)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (game1Answer.isMatched) && (game1Answer.isSelected) {
            return Color("greenAstroArena")
        } else if (!(game1Answer.isMatched) && (game1Answer.isSelected)) {
            return Color("redAstroArena")
        } else {
            return Color("blueAstroArena")
        }
    }
}

struct Option1View: View {
    var game1Answer: Game1Answer
    var body: some View {
        HStack{
            Text(game1Answer.optionId)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 60, height: 60)
                .background(game1Answer.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(35)
            
            Text(game1Answer.option)
                .frame(width: 350, height: 38)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct OptionStatusImage1View: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}

struct PlayGame1View: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    
                    .ignoresSafeArea()

                VStack(spacing: 100){
                            HStack{
                                TextComponent(text: "QUIZ #1", size: 70)
                            }
                  
                            HStack{
                                Text("The game in a nutshell")
                                    .font(.system(size: 60))
                                    .foregroundColor(.white)
                            }
                            
                            HStack{
                                Buttons1View(textP: "1) You have 30 seconds to complete the quiz")
                                
                            }
                         
                            HStack{
                                Buttons1View(textP: "2) Have fun discovering our magical solar system!")
                                
                            }
                            
                            NavigationLink{
                                Game1View(game1LogicViewModel: Game1LogicViewModel())
                            } label: {
                                Image("PlayButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:580, height: 270)
                            }
                            
                        
                        
                }
            }
             
        }
       
    }
}



struct Buttons1View: View {
    let textP: String
    var body: some View {
        
        VStack{
            
            Text(textP)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.leading, 50)
                .frame(width:1100, height: 100, alignment: .leading)
                .font(.system(size: 45))
                .foregroundColor(Color("bgPlanetInformation"))
                .background( RoundedRectangle(cornerRadius: 30)
                    .fill(Color.white)
                    )
                .frame(alignment: .trailing)
        }
    }
}
