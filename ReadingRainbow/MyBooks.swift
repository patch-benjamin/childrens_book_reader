//
//  ContentView.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 7/20/23.
//

import SwiftUI
import ComposableArchitecture
import LocalAuthentication



struct MyBooksReducer: Reducer {
    
    
    struct State: Equatable {

        // TODO: create a navigation stack object: StackState<Path.State>
        // This holds the current navigation destination/path as well as the state for that navigation path (and states for all states on the navigatin stack).
        // TODO: var mainViewState: MyBooksReducer.State
        @PresentationState var parentView: ParentViewReducer.State?
        var path = StackState<BookDetailReducer.State>()
    }
    
    enum Action: Equatable {
        // TODO: case path(StackAction<Path.State, Path.Action>)
        // TODO: case mainViewState(MyBooksReducer.Action)

        case bookDetail(PresentationAction<BookDetailReducer.Action>)
        case path(StackAction<BookDetailReducer.State, BookDetailReducer.Action>)
        case parentModeTapped  (PresentationAction<ParentViewReducer.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .bookDetail:
                return .none
            case .path:
                return .none
            case .parentModeTapped:
                print("parent mode")
                return .none
            }
        }
        
        .ifLet(\.$parentView, action: /Action.parentModeTapped) {
            ParentViewReducer()
        }
        
        .forEach(\.path, action: /Action.path) {
            BookDetailReducer()
        }


        
    }
}



struct MyBooks: View {
    var context = LAContext()
    
    let store: StoreOf<MyBooksReducer>

    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(store, observe: { $0 }) { ViewStore in
                ScrollingView(data: (1..<11).map({ "\($0)"}) )
                .navigationTitle("My Book")
                .toolbar {
                    ToolbarItem {
                        Button {
                            
                        } label: {
                            Text("Parent mode")
                        }
//                        
//                        NavigationLink("Parent Mode", destination: ParentView(store: store))
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
            case bookDetail(BookDetailReducer.State)
        }
        
        enum Action: Equatable {
            case bookDetail(BookDetailReducer.Action)
        }
//        var body: some ReducerOf<Self> {
//            Scope(state: /State.bookDetail, action: /Action.bookDetail) {
//                BookDetailReducer()
//            }
        }
    }

