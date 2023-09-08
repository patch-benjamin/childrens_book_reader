//
//  Page.swift
//  ReadingRainbow
//
//  Created by Benjamin Patch on 8/15/23.
//

import Foundation

struct Page {
    var image: Data?
    var pageNumber: Int? // maybe not needed?
    var uniqueWords: [String]? // computed from paragraphs?
    var paragraphs: [String]?
    var content: [String]?
}
