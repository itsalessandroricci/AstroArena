//
//  GameModel.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 21/02/24.
//

import Foundation
import SwiftUI

struct Game1 {
    var currentQuestionIndex: Int
    var quizGameModel: Game1Model
    var quizGameCompleted: Bool = false
    var quizGameVictoryStatus: Bool = false
}

struct Game1Model {
    var id: Int
    var question: String
    var answer: String
    var optionsList: [Game1Answer]
}
struct Game1Answer : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected : Bool = false
    var isMatched : Bool = false
}

struct Game2 {
    var currentQuestionIndex: Int
    var quizGameModel: Game2Model
    var quizGameCompleted: Bool = false
    var quizGameVictoryStatus: Bool = false
}

struct Game2Model {
    var id: Int
    var question: String
    var answer: String
    var optionsList: [Game2Answer]
}
struct Game2Answer : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected : Bool = false
    var isMatched : Bool = false
}

struct Game3 {
    var currentQuestionIndex: Int
    var quizGameModel: Game3Model
    var quizGameCompleted: Bool = false
    var quizGameVictoryStatus: Bool = false
}

struct Game3Model {
    var id: Int
    var question: String
    var answer: String
    var optionsList: [Game3Answer]
}
struct Game3Answer : Identifiable {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected : Bool = false
    var isMatched : Bool = false
}
