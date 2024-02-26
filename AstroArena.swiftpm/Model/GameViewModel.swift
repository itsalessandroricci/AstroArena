//
//  GameViewModel.swift
//  AstroArena
//
//  Created by Alessandro Ricci on 21/02/24.
//

import Foundation
import SwiftUI

class Game1LogicViewModel : ObservableObject {
    
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Game1 {
        currentIndex = i
        return Game1(currentQuestionIndex: i, quizGameModel: gameData1[i])
    }
    
    @Published var model = Game1LogicViewModel.createGameModel(i: Game1LogicViewModel.currentIndex)
    
    
    var timer: Timer?
    var maxProgress1 = 30
    @Published var progress1 = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: Game1Answer) {
        for index in model.quizGameModel.optionsList.indices {
            model.quizGameModel.optionsList[index].isMatched = false
            model.quizGameModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizGameModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizGameModel.answer {
                model.quizGameModel.optionsList[index].isMatched = true
                model.quizGameModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (Game1LogicViewModel.currentIndex < 3) {
                        Game1LogicViewModel.currentIndex = Game1LogicViewModel.currentIndex + 1
                        self.model = Game1LogicViewModel.createGameModel(i: Game1LogicViewModel.currentIndex)
                    } else {
                        self.model.quizGameCompleted = true
                        self.model.quizGameVictoryStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizGameModel.optionsList[index].isMatched = false
                model.quizGameModel.optionsList[index].isSelected = true
            }
            
        }
    }
    
    func restartGame() {
        Game1LogicViewModel.currentIndex = 0
        model = Game1LogicViewModel.createGameModel(i: Game1LogicViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress1 == self.maxProgress1 {
                self.model.quizGameCompleted = true
                self.model.quizGameVictoryStatus = false
                self.reset()
            } else {
                self.progress1 += 1
            }
        })
    }
    
    func reset () {
        timer?.invalidate()
        self.progress1 = 0
    }
    
    
}

class Game2LogicViewModel : ObservableObject {
    
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Game2 {
        currentIndex = i
        return Game2(currentQuestionIndex: i, quizGameModel: gameData2[i])
    }
    
    @Published var model = Game2LogicViewModel.createGameModel(i: Game2LogicViewModel.currentIndex)
    
    
    var timer: Timer?
    var maxProgress2 = 30
    @Published var progress2 = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: Game2Answer) {
        for index in model.quizGameModel.optionsList.indices {
            model.quizGameModel.optionsList[index].isMatched = false
            model.quizGameModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizGameModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizGameModel.answer {
                model.quizGameModel.optionsList[index].isMatched = true
                model.quizGameModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (Game2LogicViewModel.currentIndex < 3) {
                        Game2LogicViewModel.currentIndex = Game2LogicViewModel.currentIndex + 1
                        self.model = Game2LogicViewModel.createGameModel(i: Game2LogicViewModel.currentIndex)
                    } else {
                        self.model.quizGameCompleted = true
                        self.model.quizGameVictoryStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizGameModel.optionsList[index].isMatched = false
                model.quizGameModel.optionsList[index].isSelected = true
            }
            
        }
    }
    
    func restartGame() {
        Game2LogicViewModel.currentIndex = 0
        model = Game2LogicViewModel.createGameModel(i: Game2LogicViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress2 == self.maxProgress2 {
                self.model.quizGameCompleted = true
                self.model.quizGameVictoryStatus = false
                self.reset()
            } else {
                self.progress2 += 1
            }
        })
    }
    
    func reset () {
        timer?.invalidate()
        self.progress2 = 0
    }
    
    
}

class Game3LogicViewModel : ObservableObject {
    
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Game3 {
        currentIndex = i
        return Game3(currentQuestionIndex: i, quizGameModel: gameData3[i])
    }
    
    @Published var model = Game3LogicViewModel.createGameModel(i: Game3LogicViewModel.currentIndex)
    
    
    var timer: Timer?
    var maxProgress3 = 30
    @Published var progress3 = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: Game3Answer) {
        for index in model.quizGameModel.optionsList.indices {
            model.quizGameModel.optionsList[index].isMatched = false
            model.quizGameModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizGameModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizGameModel.answer {
                model.quizGameModel.optionsList[index].isMatched = true
                model.quizGameModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (Game3LogicViewModel.currentIndex < 3) {
                        Game3LogicViewModel.currentIndex = Game3LogicViewModel.currentIndex + 1
                        self.model = Game3LogicViewModel.createGameModel(i: Game3LogicViewModel.currentIndex)
                    } else {
                        self.model.quizGameCompleted = true
                        self.model.quizGameVictoryStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizGameModel.optionsList[index].isMatched = false
                model.quizGameModel.optionsList[index].isSelected = true
            }
            
        }
    }
    
    func restartGame() {
        Game3LogicViewModel.currentIndex = 0
        model = Game3LogicViewModel.createGameModel(i: Game3LogicViewModel.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress3 == self.maxProgress3 {
                self.model.quizGameCompleted = true
                self.model.quizGameVictoryStatus = false
                self.reset()
            } else {
                self.progress3 += 1
            }
        })
    }
    
    func reset () {
        timer?.invalidate()
        self.progress3 = 0
    }
    
    
}

extension Game1LogicViewModel
{
    static var gameData1: [Game1Model] {
        [
            // QUIZ 1
            
            Game1Model(id: 1, question: "1) What is the maximum surface temperature of Mercury during the day?",
                      answer: "B",
                      optionsList: [Game1Answer(id: 11, optionId: "A", option: "5,500 degrees Celsius", color: Color.pink),
                                    Game1Answer(id: 12,optionId: "B", option: "427 degrees Celsius", color: Color.orange),
                                    Game1Answer(id: 13,optionId: "C", option: "-173 degrees Celsius", color: Color.brown),
                                    Game1Answer(id: 14,optionId: "D", option: "470 degrees Celsius", color: Color.purple)]),
            Game1Model(id: 2, question: "2) What is the main constituent of Venus' atmosphere?",
                      answer: "C",
                      optionsList: [Game1Answer(id: 21, optionId: "A", option: "Hydrogen", color: Color.pink),
                                    Game1Answer(id: 22,optionId: "B", option: "Oxygen", color: Color.orange),
                                    Game1Answer(id: 23,optionId: "C", option: "Carbon dioxide", color: Color.brown),
                                    Game1Answer(id: 24,optionId: "D", option: "Nitrogen", color: Color.purple)]),
            Game1Model(id: 3, question: "3) Which planet is closest to the Sun?",
                      answer: "C",
                      optionsList: [Game1Answer(id: 31, optionId: "A", option: "Venus", color: Color.pink),
                                    Game1Answer(id: 32,optionId: "B", option: "Earth", color: Color.orange),
                                    Game1Answer(id: 33,optionId: "C", option: "Mercury", color: Color.brown),
                                    Game1Answer(id: 34,optionId: "D", option: "Mars", color: Color.purple)]),
            Game1Model(id: 4, question: "4) What is the approximate diameter of Mercury?",
                      answer: "B",
                      optionsList: [Game1Answer(id: 41, optionId: "A", option: "1.4 million kilometers", color: Color.pink),
                                    Game1Answer(id: 42,optionId: "B", option: "4.880 kilometres", color: Color.orange),
                                    Game1Answer(id: 43,optionId: "C", option: "Approximately equal to the moon", color: Color.brown),
                                    Game1Answer(id: 44,optionId: "D", option: "3.6 million kilometers", color: Color.purple)]),
        ]
    }
}
    extension Game2LogicViewModel
{
        static var gameData2: [Game2Model] {
            [
                Game2Model(id: 5, question: "1) What is the distinctive color of the surface of Mars?",
                          answer: "C",
                          optionsList: [Game2Answer(id: 51, optionId: "A", option: "Blue", color: Color.pink),
                                        Game2Answer(id: 52,optionId: "B", option: "Green", color: Color.orange),
                                        Game2Answer(id: 53,optionId: "C", option: "Red", color: Color.brown),
                                        Game2Answer(id: 54,optionId: "D", option: "Yellow", color: Color.purple)]),
                Game2Model(id: 6, question: "2) Which planet has a larger mass than all the other planets combined?",
                          answer: "D",
                          optionsList: [Game2Answer(id: 61, optionId: "A", option: "Venus", color: Color.pink),
                                        Game2Answer(id: 62,optionId: "B", option: "Earth", color: Color.orange),
                                        Game2Answer(id: 63,optionId: "C", option: "Mars", color: Color.brown),
                                        Game2Answer(id: 64,optionId: "D", option: "Jupiter", color: Color.purple)]),
                Game2Model(id: 7, question: "3) What is the main constituent of Earth's atmosphere?",
                          answer: "B",
                          optionsList: [Game2Answer(id: 71, optionId: "A", option: "Methane", color: Color.pink),
                                        Game2Answer(id: 72,optionId: "B", option: "Oxygen", color: Color.orange),
                                        Game2Answer(id: 73,optionId: "C", option: "Carbon dioxide", color: Color.brown),
                                        Game2Answer(id: 74,optionId: "D", option: "Nitrogen", color: Color.purple)]),
                Game2Model(id: 8, question: "4) Which natural satellite of Earth has played a significant role in human history?",
                          answer: "C",
                          optionsList: [Game2Answer(id: 81, optionId: "A", option: "Io", color: Color.pink),
                                        Game2Answer(id: 82,optionId: "B", option: "Europa", color: Color.orange),
                                        Game2Answer(id: 83,optionId: "C", option: "Moon", color: Color.brown),
                                        Game2Answer(id: 84,optionId: "D", option: "Callisto", color: Color.purple)])
            ]
        }
    }
extension Game3LogicViewModel
{
    static var gameData3: [Game3Model] {
        [
            Game3Model(id: 9, question: "1) Which planet has the brightest and most distinctive rings?",
                   answer: "B",
                   optionsList: [Game3Answer(id: 91, optionId: "A", option: "Mars", color: Color.pink),
                                 Game3Answer(id: 92,optionId: "B", option: "Saturn", color: Color.orange),
                                 Game3Answer(id: 93,optionId: "C", option: "Uranus", color: Color.brown),
                                 Game3Answer(id: 94,optionId: "D", option: "Neptune", color: Color.purple)]),
         Game3Model(id: 10, question: "2) Which planet has a tilted position and a lying down rotational motion compared to the other planets in the solar system?",
                   answer: "B",
                   optionsList: [Game3Answer(id: 101, optionId: "A", option: "Saturn", color: Color.pink),
                                 Game3Answer(id: 102,optionId: "B", option: "Uranus", color: Color.orange),
                                 Game3Answer(id: 103,optionId: "C", option: "Neptune", color: Color.brown),
                                 Game3Answer(id: 104,optionId: "D", option: "Jupiter", color: Color.purple)]),
         Game3Model(id: 11, question: "3) Which natural satellite of Saturn is particularly interesting because of its Earth-like atmospheric and geological characteristics?",
                   answer: "D",
                   optionsList: [Game3Answer(id: 111, optionId: "A", option: "Titania", color: Color.pink),
                                 Game3Answer(id: 112,optionId: "B", option: "Miranda", color: Color.orange),
                                 Game3Answer(id: 113,optionId: "C", option: "Deimos", color: Color.brown),
                                 Game3Answer(id: 114,optionId: "D", option: "Titan", color: Color.purple)]),
         Game3Model(id: 12, question: "4)  Which planet is known for its extremely fast winds and the presence of a Jupiter-like Great Dark Spot?",
                   answer: "C",
                   optionsList: [Game3Answer(id: 121, optionId: "A", option: "Uranus", color: Color.pink),
                                 Game3Answer(id: 122,optionId: "B", option: "Mars", color: Color.orange),
                                 Game3Answer(id: 123,optionId: "C", option: "Neptune", color: Color.brown),
                                 Game3Answer(id: 124,optionId: "D", option: "Venus", color: Color.purple)]),
         
         
     ]
    }
}

