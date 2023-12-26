//
//  ParentView.swift
//  ReadingRainbow
//
//  Created by Tyler Sun on 10/31/23.
//

import SwiftUI
import ComposableArchitecture

struct ParentViewReducer: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    func reduce(into state: inout State, action: Action) -> Effect<Action> {
         
    }
    
}


struct ParentView: View {
    let store: StoreOf<ParentViewReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ParentView(store: .init(initialState: .init(), reducer: {
        ParentViewReducer()
    }))
}
