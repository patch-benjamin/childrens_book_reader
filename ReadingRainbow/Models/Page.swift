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
    var uniqueWords: [String] // computed from paragraphs? grab all unique words from its pages and return those. a set would be better, remove punctuation and anything that's not alphabet or number, trim away characters that aren't alphanumeric at the beginning or end
    var paragraphs: [String]
}
