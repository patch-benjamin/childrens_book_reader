//
//  Recording.swift
//  ReadingRainbow
//
//  Created by Ami Smith on 8/19/23.
//

import Foundation

struct Recording: Hashable, Codable, Identifiable {
    var id = UUID()
    var url: URL
    var title: String
    var duration: TimeInterval
    var dateCreated: Date
    
}
