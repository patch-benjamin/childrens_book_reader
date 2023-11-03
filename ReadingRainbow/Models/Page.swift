//
//  Page.swift
//  ReadingRainbow
//
//  Created by Benjamin Patch on 8/15/23.
//

import Foundation

struct Page {
    var image: Data
    var pageNumber: Int // maybe not needed?
    var paragraphs: [String]
    
    private var _uniqueWords: Set<String> {
        var words = Set<String>()
        
        for paragraph in paragraphs {
            let wordTokens = paragraph.split { !("a"..."z").contains($0) && !("A"..."Z").contains($0) && !("0"..."9").contains($0)}
            
            for token in wordTokens {
                let cleanedWord = token.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                if !cleanedWord.isEmpty {
                    words.insert(cleanedWord)
                }
            }
        }
        return words
    } 
 
    var uniqueWords: [String] {
        return _uniqueWords.sorted()
    }
}
