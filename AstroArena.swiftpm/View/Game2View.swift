//
//  Game2View.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 22/02/24.
//

import SwiftUI

struct Game2View: View {
    @ObservedObject var game2LogicViewModel: Game2LogicViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .ignoresSafeArea()
                
                if (game2LogicViewModel.model.quizGameCompleted) {
                    Game2OverView(game2LogicViewModel: game2LogicViewModel)
                } else {
                    ScrollView(showsIndicators: false){
                        VStack{
                            VStack {
                                TextComponent(text: "QUIZ #2", size: 70)
                                    .padding()
                                
                                TextComponent(text: game2LogicViewModel.model.quizGameModel.question, size: 35)
                                    .lineLimit(3)
                                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 100, alignment: .center)
                                    .multilineTextAlignment(.center)
                                
                                Spacer()
                                
                                ZStack {
                                    Circle()
                                        .stroke(lineWidth: 15)
                                        .foregroundColor(Color("bgPlanetInformation"))
                                        .opacity(0.8)
                                    
                                    Circle()
                                        .trim(from: 0.0, to: min(CGFloat((Double(game2LogicViewModel.progress2) * Double(game2LogicViewModel.maxProgress2))/30),1.0))
                                        .stroke(Color("redAstroArena"),
                                                style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                        .rotationEffect(Angle(degrees: 270))
                                        .animation(Animation.linear(duration: Double(game2LogicViewModel.maxProgress2)), value: game2LogicViewModel.progress2)
                                    
                                    TextComponent(text: String(game2LogicViewModel.progress2), size: 50)
                                }.frame(width: 150, height: 200)
                                
                                Spacer()
                                
                                OptionsGrid2View(game2LogicViewModel: game2LogicViewModel)
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
    Game2View(game2LogicViewModel: Game2LogicViewModel())
}


struct OptionsGrid2View: View {
    var game2LogicViewModel: Game2LogicViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(200), spacing: 390), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(game2LogicViewModel.model.quizGameModel.optionsList) { game2Answer in
                OptionCard2View(game2Answer: game2Answer)
                    .onTapGesture {
                        game2LogicViewModel.verifyAnswer(selectedOption: game2Answer)
                    }
            }
        }
    }
}

struct OptionCard2View : View {
    var game2Answer: Game2Answer
    var body: some View {
        VStack {
            if (game2Answer.isMatched) && (game2Answer.isSelected) {
                OptionStatusImage2View(imageName: "checkmark")
            } else if (!(game2Answer.isMatched) && (game2Answer.isSelected)) {
                OptionStatusImage2View(imageName: "xmark")
            } else {
                Option2View(game2Answer: game2Answer)
            }
        }.frame(width: 550, height: 120)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (game2Answer.isMatched) && (game2Answer.isSelected) {
            return Color("greenAstroArena")
        } else if (!(game2Answer.isMatched) && (game2Answer.isSelected)) {
            return Color("redAstroArena")
        } else {
            return Color("blueAstroArena")
        }
    }
}

struct Option2View: View {
    var game2Answer: Game2Answer
    var body: some View {
        HStack{
            Text(game2Answer.optionId)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 60, height: 60)
                .background(game2Answer.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(35)
            
            Text(game2Answer.option)
                .frame(width: 350, height: 38)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct OptionStatusImage2View: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}

struct PlayGame2View: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 100){
                    HStack{
                        TextComponent(text: "QUIZ #2", size: 70)
                    }
                    
                    HStack{
                        Text("The game in a nutshell")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Buttons2View(textP: "1) You have 30 seconds to complete the quiz")
                        
                    }
                    
                    HStack{
                        Buttons2View(textP: "2) Have fun discovering our magical solar system!")
                        
                    }
                    
                    NavigationLink{
                        Game2View(game2LogicViewModel: Game2LogicViewModel())
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



struct Buttons2View: View {
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
