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
        static let books = ["The Cat in The Hat", "The Lorax", "Horton Hears A Who!"]
        
        static let book1Image = UIImage(named: "The Cat in The Hat Cover")?.pngData() ?? Data()
        static let book2Image = UIImage(named: "The Lorax Cover")?.pngData() ?? Data()
        static let book3Image = UIImage(named: "Horton Hears A Who! Cover")?.pngData() ?? Data()
        
        static let book1Content = [
            Page(image: Data(), pageNumber: 1, paragraphs: [
                """
                We looked! Then we saw him step in on the mat! We looked! And we saw him! The Cat in the Hat! And he said to us, "Why do you sit there like that? I know it is wet and the sun and the sun is not sunny. But we can have lots of good fun that is funny!"
                """]),
            Page(image: Data(), pageNumber: 2, paragraphs: [
                """
                "Have no fear!" said the cat. "I will not let you fall. I will hold you up high as I stand on a ball."
                """]),
            Page(image: Data(), pageNumber: 3, paragraphs: [
                """
                Well... There we were. We were working like that and then who should come up but the Cat in the Hat! "Oh-oh!" Sally said. "Don't you talk to that cat. That Cat in the Hat, he plays lots of bad tricks. Don't you let him come near. You know what he did the last time he was here!"
                """])
        ]
        
        static let book2Content = [
            Page(image: Data(), pageNumber: 1, paragraphs: [
                """
                I live in a place where the grass is all green, the air's sweet and fresh, and the water is clean.
                """]),
            Page(image: Data(), pageNumber: 2, paragraphs: [
            """
            And I first saw the trees! The Truffula Trees! The bright-colored tufts of the Truffula Trees! Mile after mile in the fresh morning breeze.
            """]),
            Page(image: Data(), pageNumber: 3, paragraphs: [
            """
            "Mister!" he said with a sawdusty sneeze, "I am the Lorax. I speak for the trees"
            """])
        ]
        
        static let book3Content = [
            Page(image: Data(), pageNumber: 1, paragraphs: [
            """
            On the fifteenth of May, in the Jungle of Nool, in the heat of the day, in the cool of the pool, he was splashing... enjoying the jungle's great joys... When Horton the elephand heard a small noise.
            """]),
            Page(image: Data(), pageNumber: 2, paragraphs: [
            """
            And he lifted the dust speck and carried it over and placed it down, safe, on a very soft clover.
            """]),
            Page(image: Data(), pageNumber: 3, paragraphs: [
            """
            But, just as he spoke the the Mayor of the speck, three big jungle monkeys climbed up Horton's neck!
            """])
        ]
        
        static let book1 = Book(image: book2Image, title: "The Cat in the Hat", pages: book2Content)
        
        static let book2 = Book(image: book1Image, title: "The Lorax", pages: book1Content)
        
        static let book3 = Book(image: book3Image, title: "Horton Hears a Who", pages: book3Content)
    }
}

let book1 = Book.Fake.book1
let book2 = Book.Fake.book2
let book3 = Book.Fake.book3
