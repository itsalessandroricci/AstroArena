//
//  Game3View.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 22/02/24.
//

import SwiftUI

struct Game3View: View {
    @ObservedObject var game3LogicViewModel: Game3LogicViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .ignoresSafeArea()
                
                if (game3LogicViewModel.model.quizGameCompleted) {
                    Game3OverView(game3LogicViewModel: game3LogicViewModel)
                } else {
                    ScrollView(showsIndicators: false){
                        VStack{
                            VStack {
                                TextComponent(text: "QUIZ #3", size: 70)
                                    .padding()
                                
                                TextComponent(text: game3LogicViewModel.model.quizGameModel.question, size: 35)
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
                                        .trim(from: 0.0, to: min(CGFloat((Double(game3LogicViewModel.progress3) * Double(game3LogicViewModel.maxProgress3))/30),1.0))
                                        .stroke(Color("redAstroArena"),
                                                style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                                        .rotationEffect(Angle(degrees: 270))
                                        .animation(Animation.linear(duration: Double(game3LogicViewModel.maxProgress3)), value: game3LogicViewModel.progress3)
                                    
                                    TextComponent(text: String(game3LogicViewModel.progress3), size: 50)
                                }.frame(width: 150, height: 200)
                                
                                Spacer()
                                
                                OptionsGrid3View(game3LogicViewModel: game3LogicViewModel)
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
    Game3View(game3LogicViewModel: Game3LogicViewModel())
}


struct OptionsGrid3View: View {
    var game3LogicViewModel: Game3LogicViewModel
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(200), spacing: 390), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(game3LogicViewModel.model.quizGameModel.optionsList) { game3Answer in
                OptionCard3View(game3Answer: game3Answer)
                    .onTapGesture {
                        game3LogicViewModel.verifyAnswer(selectedOption: game3Answer)
                    }
            }
        }
    }
}

struct OptionCard3View : View {
    var game3Answer: Game3Answer
    var body: some View {
        VStack {
            if (game3Answer.isMatched) && (game3Answer.isSelected) {
                OptionStatusImage2View(imageName: "checkmark")
            } else if (!(game3Answer.isMatched) && (game3Answer.isSelected)) {
                OptionStatusImage2View(imageName: "xmark")
            } else {
                Option3View(game3Answer: game3Answer)
            }
        }.frame(width: 550, height: 120)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    
    func setBackgroundColor() -> Color {
        if (game3Answer.isMatched) && (game3Answer.isSelected) {
            return Color("greenAstroArena")
        } else if (!(game3Answer.isMatched) && (game3Answer.isSelected)) {
            return Color("redAstroArena")
        } else {
            return Color("blueAstroArena")
        }
    }
}

struct Option3View: View {
    var game3Answer: Game3Answer
    var body: some View {
        HStack{
            Text(game3Answer.optionId)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 60, height: 60)
                .background(game3Answer.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(35)
            
            Text(game3Answer.option)
                .frame(width: 350, height: 38)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct OptionStatusImage3View: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            .foregroundColor(Color.white)
    }
}

struct PlayGame3View: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                VStack(spacing: 100){
                    HStack{
                        TextComponent(text: "QUIZ #3", size: 70)
                    }
                    
                    HStack{
                        Text("The game in a nutshell")
                            .font(.system(size: 60))
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Buttons3View(textP: "1) You have 30 seconds to complete the quiz")
                        
                    }
                    
                    HStack{
                        Buttons3View(textP: "2) Have fun discovering our magical solar system!")
                        
                    }
                    
                    NavigationLink{
                        Game3View(game3LogicViewModel: Game3LogicViewModel())
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



struct Buttons3View: View {
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
