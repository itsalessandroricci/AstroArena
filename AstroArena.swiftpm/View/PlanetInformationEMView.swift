//
//  PlanetInformationEMView.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 24/02/24.
//

import SwiftUI
import SceneKit

struct PlanetInformationEMView: View {
    
    var body: some View {
        NavigationStack{
           
                ZStack{
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    ScrollView(showsIndicators: false){
                    HStack{
                        
                        SceneView(
                            scene: {
                                let scene = SCNScene(named: "EarthAstroArena.usdz")!
                                scene.background.contents = UIImage(named: "background")
                                return scene
                            }(),
                            options: [.autoenablesDefaultLighting, .allowsCameraControl]
                        )
                        .frame(width: 400, height: 400, alignment: .center)
                        .scaleEffect(1.099)
                        .cornerRadius(300)
                        SceneView(
                            scene: {
                                let scene = SCNScene(named: "MoonAstroArena.usdz")!
                                scene.background.contents = UIImage(named: "background")
                                return scene
                            }(),
                            options: [.autoenablesDefaultLighting, .allowsCameraControl]
                        )
                        .frame(width: 400, height: 400, alignment: .center)
                        .scaleEffect(1.099)
                        .cornerRadius(300)
//                        .padding(.bottom, 550)
                    }
                     .padding(.top, 100)
                    
                    VStack(alignment: .center) {
                        
                        Text("EARTH & MOON")
                            .font(.system(size: 80))
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("redAstroArena"))
                        Text(formatPlanetDetails("Earth is the third planet in the solar system and the only planet known to harbor life. It has a wide range of environments, including land, oceans and atmosphere that support a wide variety of life forms. Earth has an oxygen-rich atmosphere, which is essential for life as we know it. The Moon is Earth's natural satellite and is the fifth largest satellite in the solar system. It is a very close object to Earth, making it a celestial object clearly visible to us on Earth. The Moon has no atmosphere and its surface is characterized by craters, mountains, valleys and lunar seas. The Moon has played a significant role in human history, inspiring myths, legends and contributing to the development of science and space exploration."))
                            .font(.system(size: 35))
                            .foregroundColor(.white)

                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width - 380, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .background(Color("bgPlanetInformation").opacity(0.5))
                    
                    
                }
            }
                .toolbarBackground(
                    Color("bgPlanetInformation").opacity(0.9),
                                for: .navigationBar)
                .ignoresSafeArea()
        }
    }
    private func formatPlanetDetails(_ details: String) -> String {
        return details.replacingOccurrences(of: ". ", with: ".\n")
    }
}

#Preview {
    PlanetInformationEMView()
}



