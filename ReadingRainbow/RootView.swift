//
//  RootView.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 11/21/23.
//

import SwiftUI
import ComposableArchitecture

struct RootViewReducer: Reducer {
    struct State {
  
        // TODO: var mainViewState: MyBooksReducer.State
        var mainViewState: MyBooksReducer.State
    }
    
    enum Action {
        // TODO: case path(StackAction<Path.State, Path.Action>)
        // TODO: case mainViewState(MyBooksReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
    
    struct Path: Reducer {
        enum State {
            case bookDetail(BookDetailReducer.State)
            case parentView(ParentViewReducer.State)
        }
        
        enum Action {

            
            case bookDetail(BookDetailReducer.Action)
            case parentView(ParentViewReducer.Action)
        }
        
        var body: some ReducerOf<Self> {

            Scope(state: \State.parentView, action: \Action.parentView) {
                ParentViewReducer()
            }
            }
            
        }
    }


// TODO: RootReducer

// body {
// 2 cases:
// - .path(let destination) // Something happened on a view we have navigated to
// - .mainViewAction(let myBookReducerAction) // something happened on the MyBooksView/Reducer
// To Navigate to somewhere: listen for the appropriate Action, Create the right State, and then add that state to the state.path.push(.someDestination(someStateWeJustCreated))

// TODO: Path: Reducer
// - enum State -> What destinations can you navigate to
// - Actions -> An action for each State option (each state will take you to a Reducer, each case here wraps the Action of that reducer)
// - body -> Just hooks the State, Action, and Reducer for each navigation option using Scope(State case, Action case, Reducer())


//struct RootView: View {
//    var body: some View {
//        fatalError()
//        // TODO: NavigationStack Store
//        
//        NavigationStackStore(
//          // Store focused on StackState and StackAction
//        ) {
//              MyBooksView(...) // the root view of the project
//        } destination: { state in
//          switch state {
//            // A view for each case of the Path.State enum
//              case .bookDetail:
//        CaseLet(
//          /RootFeature.Path.State.bookDetail,
//          action: RootFeature.Path.Action.bookDetail,
//          then: BookDetailView.init(store:)
//        )
//          }
//        }

//    }
//}

// TODO:     .forEach(\.path, action: \.path) {
//        Path()
//      }
// TODO: Scope to the mainViewState/Action/Reducer

struct RootView: View {
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}





#Preview {
    RootView()
}
