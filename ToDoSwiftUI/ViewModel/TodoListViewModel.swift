//
//  TodoViewModel.swift
//  ToDoSwiftUI
//


import Foundation
import SwiftUI
import Combine

public class TodoListViewModel: ObservableObject {
    /*
     The @Published property wrapper works by adding a Publisher to the property.
     That way every time the todos property will be set, anything that will be observing our view model will be notified.
     Therefore if we're talking about a SwiftUI View, it will refresh automatically (with some smooth SwiftUI magic).
    */
    
    @Published var todos: Todos = [Todo]()
    
    func shuffle() {
        // TODO
    }
    
    func sort() {
        // TODO
    }
    
    func markDone(id: Int) {
        // TODO
    }
    
    func pin(id: Int) {
        let item = self.todos.first(where: { $0.id == id })
        if let _ = item?.pinned {
            item?.pinned?.toggle()
        } else {
            item?.pinned = true
        }
        self.sort()
    }
    
    func load() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let todos = try JSONDecoder().decode(Todos.self, from: data)
                DispatchQueue.main.async {
                    self.todos = Array(todos[0...6])
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
    }
}

