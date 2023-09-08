//
//  FakeData.swift
//  ReadingRainbow
//
//  Created by Ami Smith on 9/5/23.
//

import Foundation
import UIKit

extension Book {
    struct Fake {
        static let books = [book1, book2, book3]
        
        static let book1Image = UIImage(named: "book1Image")?.pngData() ?? Data()
        static let book2Image = UIImage(named: "book2Image")?.pngData() ?? Data()
        static let book3Image = UIImage(named: "book3Image")?.pngData() ?? Data()
        
        static let book1Content = [
            Page(image: Data(), pageNumber: 1, content: ["Page 1 Text"]),
            Page(image: Data(), pageNumber: 2, content: ["Page 2 Text"])
        ]
        
        static let book2Content = [
            Page(image: Data(), pageNumber: 1, content: ["Page 1 Text"]),
            Page(image: Data(), pageNumber: 2, content: ["Page 2 Text"])
        ]
        
        static let book3Content = [
            Page(image: Data(), pageNumber: 1, content: ["Page 1 Text"]),
            Page(image: Data(), pageNumber: 2, content: ["Page 2 Text"])
        ]
        
        static let book1 = Book(image: book1Image, title: "Harry Potter and the Sorcerer's Stone", pages: book1Content, uniqueWords: ["magic", "wizard", "spell"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
        
        
        static let book2 = Book(image: book2Image, title: "Would You Rather...?", pages: book2Content, uniqueWords: ["question", "choice", "fun"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
        
        
        static let book3 = Book(image: book3Image, title: "The Hobbit", pages: book3Content, uniqueWords: ["hobbit", "adventure", "dragon"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
    }
}

let book1 = Book.Fake.book1
let book2 = Book.Fake.book2
let book3 = Book.Fake.book3
