//
//  MultiPlayerViewController.swift
//  Dobble
//
//  Created by Alex Luna on 11/02/2021.
//

import Foundation

class MultiPlayerGameController: ObservableObject {
    var cards: [Card]
    
    @Published var score: Int = 0
    
    @Published var showingCards: [Card]
    
    @Published var gameOver: Bool = false
    
    func pick(value: String) {
        print("Testing value \(value)")
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
            
            // add two new cards
            getTwoCards()
        }
    }
    
    func getTwoCards() {
        if cards.count <= 1 {
            gameOver = true
        }
        let card1 = cards.randomElement()
        var card2 = cards.randomElement()
        
        while card1 == card2 {
            card2 = cards.randomElement()
        }
        
        showingCards.append(card1!)
        showingCards.append(card2!)
    }
    
    init() {
        // We can choose any different deck of images here
        let deck = emojiDeck()
        cards = deck.cards
        
        showingCards = [Card]()
        if cards.count == 57 {
            getTwoCards()
        }
    }
}
