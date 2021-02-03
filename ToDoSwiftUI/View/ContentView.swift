//
//  ContentView.swift
//  ToDoSwiftUI
//


import SwiftUI
import Combine

struct ContentView : View {
    @ObservedObject var viewModel: TodoListViewModel = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            TodoList(todos: self.viewModel.todos, markDoneAction: {(id) in
                self.viewModel.markDone(id: id)
            }, pinAction: {(id) in
                self.viewModel.pin(id: id)
            })
            .navigationBarTitle(Text("Todo"))
            .navigationBarItems(leading:
                    Button(action: {
                        self.viewModel.shuffle()
                    }, label: {
                        Text("Shuffle")
                    }),
                trailing:
                    Button(action: {
                        self.viewModel.load()
                    }, label: {
                        Image(systemName: "arrow.2.circlepath")
                    })
            )
        }
        .onAppear {
            self.viewModel.load()
        }
    }
}

#if DEBUG
let viewModel = TodoListViewModel()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(viewModel)
    }
}
#endif
