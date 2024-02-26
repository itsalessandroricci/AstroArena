//
//  MenuView.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 18/02/24.
//

import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                    Image("MenuBGAstroArena")
                        .resizable()
                        .ignoresSafeArea()
                
               
                
                
                    VStack{
                        
                        HStack(spacing: 20){
                            NavigationLink{
                                ChaptersView()
                            } label: {Image("MButton")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:500, height: 200)
                            }
                            
                        } .padding()
                        
                    }
                        
            }
            
        }
        
    }

}



 
