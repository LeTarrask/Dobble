//
//  GameModel.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import Foundation

class GameController: ObservableObject {
    var cards: [Card] = [Card]()
    
    @Published var multiplayer: Bool = false
    
    @Published var difficulty: Int = 1
    
    @Published var score: Int = 0
    
    @Published var timeLeft: Float = 0.0
    
    @Published var showingCards: [Card] = [Card]()
    
    @Published var gameOver: Bool = false {
        didSet {
            if gameOver == true {
                cards = []
            } else {
                score = 0
                drawDeck()
            }
        }
    }
    
    func pick(value: String) {
        let card1 = showingCards[0]
        let card2 = showingCards[1]
        if card1.images.contains(value) && card2.images.contains(value) {
            score += 1
            
            // remove these cards from deck
            if let index = cards.firstIndex(of: card1) {
                cards.remove(at: index)
            }
            if let index = cards.firstIndex(of: card2) {
                cards.remove(at: index)
            }
            
            // remove these cards from showingCards
            showingCards = []
            
            print(cards.count)
            if cards.count <= 50 {
                gameOver.toggle()
                score = 0
                return
            }
            
            // draw two new cards
            getTwoCards()
        }
    }
    
    func getTwoCards() {
        let card1 = cards.randomElement()
        var card2 = cards.randomElement()
        
        while card1 == card2 {
            card2 = cards.randomElement()
        }
        
        showingCards.append(card1!)
        showingCards.append(card2!)
    }
    
    func drawDeck() {
        // We can choose any different deck of images here
        cards = emojiDeck().cards
        
        showingCards = []
        
        if cards.count == 57 {
            getTwoCards()
        }
    }
    
    init() {
        drawDeck()
    }
}
