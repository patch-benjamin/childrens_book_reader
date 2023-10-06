//
//  File.swift
//  ReadingRainbow
//
//  Created by Benjamin Patch on 8/15/23.
//

import Foundation

struct Book {
    var image: Data
    var title: String
    var pages: [Page]
    var uniqueWords: [String] {
        var words = Set<String>()
        for page in pages {
            words.formUnion(page.uniqueWords)
        }
        return Array(words).sorted()
    }
    
    var paragraphs: [String] {
        return pages.flatMap { $0.paragraphs }
    }
}
