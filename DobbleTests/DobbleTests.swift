//
//  DobbleTests.swift
//  DobbleTests
//
//  Created by Alex Luna on 08/02/2021.
//

import XCTest
@testable import Dobble

class DobbleTests: XCTestCase {
    func testCardGenerator() throws {
        // Generates decks of cards, the game needs 57 cards
        let cardGen = CardGenerator()
        
        // checks if deck has correct size
        XCTAssert(cardGen.deck.count == 57, "deck has 57 cards")
    }
    
    func testRandomCardHasMatch() throws {
        // Generates decks of cards
        let cardGen = CardGenerator()
        
        // checks if any random pair of cards have one single similar element in any other random card
        let card1 = cardGen.deck.randomElement()!.images
        let card2 = cardGen.deck.randomElement()!.images
        let similarElements = card1.similarElements(as: card2)
        XCTAssert(similarElements.count == 1)
    }
    
    func testGameInicialization() throws {
        let gm = GameController()
        
        // Initial game shows 2 cards, and deck has 55 cards
        XCTAssert(gm.showingCards.count == 2)
        XCTAssert(gm.cards.count == 55)
        
        // Game starts
        XCTAssert(gm.gameOver == false)
    }
    
    func testGameOver() throws {
        let gm = GameController()
        
        // Removes 28 pairs of cards
        for _ in 1..<28 {
            gm.getTwoCards()
        }

        // There's a single card left
        XCTAssert(gm.cards.count == 1)
        
        // Game ends
        XCTAssert(gm.gameOver == true)
    }
}
