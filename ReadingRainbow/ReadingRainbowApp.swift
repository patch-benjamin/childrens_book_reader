//
//  ReadingRainbowApp.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 7/20/23.
//

import SwiftUI

@main
struct ReadingRainbowApp: App {
    var body: some Scene {
        WindowGroup {
            MyBooks(store: .init(initialState: .init(), reducer: {
                MyBooksReducer()
            }))
        }
    }
}
