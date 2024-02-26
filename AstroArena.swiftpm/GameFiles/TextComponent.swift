//
//  TextComponent.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 21/02/24.
//

import SwiftUI

struct TextComponent: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            
    }
}


