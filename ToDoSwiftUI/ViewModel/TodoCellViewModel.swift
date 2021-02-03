//
//  TodoCellViewModel.swift
//  ToDoSwiftUI
//


import Foundation

public class TodoCellViewModel {
    
    private var todo: Todo
    
    public init(todo: Todo) {
        self.todo = todo
    }
    
    public func isPinned() -> Bool {
        return self.todo.pinned ?? false
    }
    
    public func isComleted() -> Bool {
        return self.todo.completed
    }
    
    public func getTitle() -> String {
        return self.todo.title
    }
    
    public func getId() -> Int {
        return self.todo.id
    }
}
