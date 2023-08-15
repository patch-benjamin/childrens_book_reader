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
    var uniqueWords: [String] // might be computed from `pages.uniqueWords`
    var paragraphs: [String] // might be computed from `pages.paragraphs`
}
