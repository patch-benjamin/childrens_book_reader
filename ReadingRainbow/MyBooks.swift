//
//  ContentView.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 7/20/23.
//

import SwiftUI
import ComposableArchitecture

struct MyBooksReducer: Reducer {
    
    struct State: Equatable {
        @PresentationState var myBookDetail: BookDetailReducer.State?
        var path = StackState<BookDetailReducer.State>()
    }
    
    enum Action: Equatable {
        case bookDetail(PresentationAction<BookDetailReducer.Action>)
        case path(StackAction<BookDetailReducer.State, BookDetailReducer.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .bookDetail:
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            BookDetailReducer()
        }
        
    }
}



struct MyBooks: View {
    let store: StoreOf<MyBooksReducer>

    let columns = [GridItem(.adaptive(minimum: 150))]
 
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(store, observe: { $0 }) { ViewStore in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(1..<11) { imageName in
                            VStack {
                                Text("name")
                                
                                NavigationLink(state: BookDetailReducer.State(bookName: "Ocean\(imageName)")) {
                                    Image("Ocean\(imageName)").resizable().frame(width: 150, height: 150)
                                }
                                    
                            }
                        }
                        
                    }
                }
                .navigationTitle("My Book")
                .toolbar {
                    ToolbarItem {
                        Button {
                            print("Parent mode activated")
                        } label: {
                            Text("Parent Mode")
                        }
                        
                    }
                }
            }
        } destination: { store in
            BookDetail(store: store)
        }
        }
}

struct MyBooks_Previews: PreviewProvider {
    static var previews: some View {
        MyBooks(store: .init(initialState: .init(), reducer: {
            MyBooksReducer()
        }))
    }
}

extension MyBooksReducer {
    struct Destination {
        enum State: Equatable {
            
        }
        
        enum Action: Equatable {
            
        }
        

        
    }
    
}
