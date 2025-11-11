/*
 *  Lab 3
 *  Group 9
 *  Noa Tomas Mandorf
 *  Tyler Hager
 *  November 10, 2025
 */

import Foundation

struct MemoryGameModel {
    private(set) var cards: Array<Card>
    private(set) var numberOfPairs: Int
    
    struct Card: Identifiable {
        var imageFile: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: String
    }
    
    mutating func chooseCard(card: Card) {
        for index in cards.indices {
            if cards[index].id == card.id {
                cards[index].isFaceUp.toggle()
            }
        }
    }
    
    init(numberOfPairs: Int, contentFactory: (Int) -> Flower) {
        cards = []
        self.numberOfPairs = numberOfPairs
        
        for index in 0..<numberOfPairs {
            let content = contentFactory(index)
            cards.append(Card(imageFile: content.file, id: String(content.id)))
            cards.append(Card(imageFile: content.file, id: "\(content.id)-duplicate"))
        }
        cards.shuffle()
    }
}
