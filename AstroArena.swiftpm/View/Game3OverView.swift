//
//  Game3OverView.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 23/02/24.
//

import Foundation
import SwiftUI

struct Game3OverView: View {
    var game3LogicViewModel: Game3LogicViewModel
    var body: some View {
        VStack {
            Image(systemName: "moon.stars")
                .foregroundColor(Color.white)
                .font(.system(size: 80))
                .padding()
            
            TextComponent(text: game3LogicViewModel.model.quizGameVictoryStatus ?
                         "WELL DONE!" :
                            "GAME OVER",
                         size: 50)
                .padding()
            
            TextComponent(text: game3LogicViewModel.model.quizGameVictoryStatus
                         ? "You’ve proved yourself to be a true space expert!"
                         : "Keep trying, I am sure you will succeed!",
                         size: 40)
                .padding()
            VStack(spacing: -80){
                Button {
                    game3LogicViewModel.restartGame()
                } label: {
                    HStack {
                        
                        
                        Image("PlayAgainB")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:480, height: 200)
                    }
                    
                }
                HStack {
                    
                    NavigationLink{
                        ChaptersView()
                    } label: {
                        Image("ChaptersButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:480, height: 200)
                    }
                    
                }
            }
        }
    }
}
