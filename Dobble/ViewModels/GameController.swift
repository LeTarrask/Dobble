//
//  GameModel.swift
//  Dobble
//
//  Created by Alex Luna on 08/02/2021.
//

import Foundation

class GameController: ObservableObject {
    var cards: [Card] = [Card]()
    @Published var showingCards: [Card] = [Card]()
    
    @Published var multiplayer: Bool = false
    
    @Published var difficulty: Int = 1
    
    @Published var score: Int = 0
    @Published var scoreTwo: Int = 0
    
    @Published var gameOver: Bool = false {
        didSet {
            if gameOver == true {
                cards = []
            } else {
                score = 0
                scoreTwo = 0
                drawDeck()
            }
        }
    }
    
    func removeFromDeck(picks: [Card]) {
        // remove these cards from deck
        if let index = cards.firstIndex(of: picks[0]) {
            cards.remove(at: index)
        }
        if let index = cards.firstIndex(of: picks[1]) {
            cards.remove(at: index)
        }
        
        // remove these cards from showingCards
        showingCards = []
    }
    
    func pick(value: String, chosen: Card) {
        let card1 = showingCards[0]
        let card2 = showingCards[1]
        
        // check if touch is matched value
        if card1.images.contains(value) && card2.images.contains(value) {
            if multiplayer {
                if chosen == card1 {
                    score += 1
                } else {
                    scoreTwo += 1
                }
            } else {
                score += 1
            }
            if cards.count > 3 {
                removeFromDeck(picks: [card1, card2])
                getTwoCards()
            } else {
                gameOver = true
            }
        } else {
            // what happens if player/s touch wrong image
            if multiplayer {
                if chosen == card1 {
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
