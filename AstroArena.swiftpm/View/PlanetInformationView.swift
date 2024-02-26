//
//  PlanetInformationView.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 18/02/24.
//

import SwiftUI
import SceneKit

struct PlanetInformationView: View {
    
    var planet: Planet
    
    var body: some View {
        NavigationStack{
           
                ZStack{
                    Image("background")
                        .resizable()
                        .ignoresSafeArea()
                    ScrollView(showsIndicators: false){

                    VStack{
                        
                        SceneView(
                            scene: {
                                let scene = SCNScene(named: planet.fileName)!
                                scene.background.contents = UIImage(named: "background")
                                
                                return scene
                            }(),
                            options: [.autoenablesDefaultLighting, .allowsCameraControl]
                        )
                        .frame(width: 400, height: 400, alignment: .center)
                        .scaleEffect(1.099)
                        .cornerRadius(300)
                    }
                    .padding(.top, 100)
                    
                    VStack(alignment: .center) {
                        
                        Text(planet.planetName)
                            .font(.system(size: 80))
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("redAstroArena"))
                        Text(formatPlanetDetails(planet.planetDetails))        .font(.system(size: 35))
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
    let planet = Planet(planetCard: "c1", planetName: "THE SUN", fileName: "SunAstroArena.usdz", planetDetails: "The Sun is the star at the center of our solar system, around which the planets, including Earth, orbit. It is a glowing ball of gas, mainly composed of hydrogen and helium, which produces energy through nuclear fusion processes. This energy is radiated into space in the form of light and heat. The Sun is incredibly large, with a diameter of about 1.4 million kilometers, and accounts for about 99.8 percent of the total mass of the solar system. Its surface temperature is about 5,500 degrees Celsius, while at its core it can reach temperatures in excess of 15 million degrees Celsius.Light from the Sun provides vital energy for life on Earth through the process of photosynthesis, which enables plants to produce oxygen and create food. The Sun has a solar activity cycle that lasts about 11 years, characterized by variations in the number of sunspots and solar flares.Studying the Sun is critical to understanding the mechanisms that drive climate and energy in our solar system, as well as to better understand stars and their life cycles in the universe.")
    
   return PlanetInformationView(planet: planet)
}



