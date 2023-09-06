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
        
        static let book1ImageName = "Harry Potter Cover"
        static let book1Image = UIImage(named: book1ImageName)
        
        static let book2ImageName = "Would You Rather Cover"
        static let book2Image = UIImage(named: book2ImageName)
        
        static let book3ImageName = "The Hobbit Cover"
        static let book3Image = UIImage(named: book3ImageName)
        
        
        static let book1 = Book(image: book1Image?.pngData() ?? Data(), title: "Harry Potter and the Sorcerer's Stone", pages: [Page(pageNumber: 1), Page(pageNumber: 2)], uniqueWords: ["magic", "wizard", "spell"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
        
        
        static let book2 = Book(image: book2Image?.pngData() ?? Data(), title: "Would You Rather...?", pages: [Page(pageNumber: 1), Page(pageNumber: 2)], uniqueWords: ["question", "choice", "fun"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
        
        
        static let book3 = Book(image: book3Image?.pngData() ?? Data(), title: "The Hobbit", pages: [Page(pageNumber: 1), Page(pageNumber: 2)], uniqueWords: ["hobbit", "adventure", "dragon"], paragraphs: ["Paragraph 1 Text", "Paragraph 2 Text"])
    }
}

let book1 = Book.Fake.book1
let book2 = Book.Fake.book2
let book3 = Book.Fake.book3
