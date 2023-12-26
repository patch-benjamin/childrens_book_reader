//
//  ScrollingView.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 9/21/23.
//

import SwiftUI

struct ScrollingView: View {
    let data: [String]
    
    
    let column = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: column, spacing: 20) {
                ForEach(data, id: \.self) { imageName in
                    VStack {
                        Text(imageName)
                       
                        NavigationLink(state: BookDetailReducer.State(bookName: "Ocean\(imageName)")) {
                            Image("Ocean\(imageName)").resizable().frame(width: 150, height: 150)
                        }
                    }
                }
            }
        }
    }
}

struct ScrollingView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingView(data: [])
    }
}
