//
//  BookDetail.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 8/24/23.
//

import SwiftUI
import ComposableArchitecture

struct BookDetailReducer: Reducer {
    struct State: Equatable {
        let bookName: String
    }
    
    enum Action: Equatable {
        
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
         
    }
}



struct BookDetail: View {
    let store: StoreOf<BookDetailReducer>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) {
            ViewStore in
            VStack {
                Text(ViewStore.bookName)
                ZStack {
                    Image("Ocean1")
                    HStack(spacing: 325) {
                        Button {
                            
                        } label: {
                            Text("<").font(.largeTitle)
                        }.hoverEffect(.highlight)
                        
                        Button {
                            
                        } label: {
                            Text(">").font(.largeTitle)
                        }.hoverEffect(.highlight)
                        
                        
                    }
                }
            }
        }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(store: .init(initialState: .init(bookName: ""), reducer: {
            BookDetailReducer()
        }))
    }
}
