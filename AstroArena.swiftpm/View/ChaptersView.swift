//
//  ChaptersView.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 19/02/24.
//

import SwiftUI

struct ChaptersView: View {
    
    var viewModel = PlanetViewModel()
    
    var body: some View {
        NavigationStack{
            
                ZStack{
                    Image("ChaptersBGAstroArena")
                        .resizable()
                        .ignoresSafeArea()
                    
                    
                ScrollView(showsIndicators: false){
                    VStack(spacing: 30){
                        Text("Chapters")
                            .font(.system(size: 92))
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 750)
                        
                           
                        
                        VStack {
                            ForEach(viewModel.planets.prefix(3)) { planet in
                                NavigationLink(destination: PlanetInformationView(planet: planet)) {
                                    Image(planet.planetCard)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            
                            NavigationLink{
                                PlayGame1View()
                            } label: {
                                Image("q1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                                NavigationLink(destination: PlanetInformationEMView()) {
                                    Image("c4")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            
                            ForEach(viewModel.planets.suffix(5).prefix(2)) { planet in
                                NavigationLink(destination: PlanetInformationView(planet: planet)) {
                                    Image(planet.planetCard)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            NavigationLink{
                                PlayGame2View()
                            } label: {
                                Image("q2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            ForEach(viewModel.planets.suffix(3)) { planet in
                                NavigationLink(destination: PlanetInformationView(planet: planet)) {
                                    Image(planet.planetCard)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                            NavigationLink{
                                PlayGame3View()
                            } label: {
                                Image("q3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                        
                    }   .padding(.top, 100)
                        
                }
                    .aspectRatio(contentMode: .fit)
            }
                .navigationBarHidden(true)
                .ignoresSafeArea()
            
        }
        
            
    }
}

#Preview {
    ChaptersView()
}

