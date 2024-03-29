//
//  GameModel.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import Foundation

class GameController: ObservableObject {
    var cards: [Card] = [Card]() {
        didSet {
            if cards.count == 1 {
                gameOver = true
            }
        }
    }
    
    @Published var showingCards: [Card] = [Card]()
    
    @Published var multiplayer: Bool = false {
        didSet {
            resetGame()
        }
    }
    
    @Published var difficulty: Int = 1
    
    @Published var score: Int = 0
    @Published var scoreTwo: Int = 0
    
    @Published var gameOver: Bool = false {
        didSet {
            if gameOver == false {
                resetGame()
            }
        }
    }
    
    func resetGame() {
        cards = []
        score = 0
        scoreTwo = 0
        drawDeck()
    }
    
    func pick(value: String, player: Int) {
        let card1 = showingCards[0]
        let card2 = showingCards[1]
        
        // check if touch is matched value
        if card1.images.contains(value) && card2.images.contains(value) {
            if multiplayer {
                if player == 1 {
                    score += 1
                } else {
                    scoreTwo += 1
                }
            } else {
                score += 1
            }
            
            showingCards = []
            
            if cards.count == 1 {
                gameOver = true
            } else {
                getTwoCards()
            }

        } else {
            // what happens if player/s touch wrong image
            if multiplayer {
                if player == 1 {
                    score -= 1
                } else {
                    scoreTwo -= 1
                }
            } else {
                score -= 1
            }
        }
    }
    
    func getTwoCards() {
        let card1 = cards.randomElement()
        if let index = cards.firstIndex(of: card1!) {
            cards.remove(at: index)
        }
        
        let card2 = cards.randomElement()
        if let index = cards.firstIndex(of: card2!) {
            cards.remove(at: index)
        }
        
        showingCards.append(card1!)
        showingCards.append(card2!)
    }
    
    func drawDeck() {
        // We can choose any different deck of images here
        cards = numberDeck().cards
        
        showingCards = []
        
        if cards.count == 57 {
            getTwoCards()
        }
    }
    
    init() {
        drawDeck()
    }
}
