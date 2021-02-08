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
        // Generates decks of cards
        let cardGen = CardGenerator()
        
        // checks if deck has correct size
        XCTAssert(cardGen.deck.count == 57, "deck possui 57 cartas")
    }
    
    func testCardMatches() throws {
        // Generates decks of cards
        let cardGen = CardGenerator()
        
        // checks if any 2 random cards have one single similar element
        let card1 = cardGen.deck.randomElement()!.images
        let card2 = cardGen.deck.randomElement()!.images
        let similarElements = card1.similarElements(as: card2)
        XCTAssert(similarElements.count == 1)
    }
}
