//
//  Cell.swift
//  ToDoSwiftUI
//


import SwiftUI
import Combine

struct TodoCell : View {
    var todoCellViewModel: TodoCellViewModel
    var markDoneAction: ((_ id: Int) -> Void)
    var pinAction: ((_ id: Int) -> Void)
    
    var body: some View {
        HStack {
            // NOT USING BUTTONS BUT IMAGE + TAP ACTION
            // BUG W/ Buttons in List
            
            Image(systemName: (self.todoCellViewModel.isComleted() ? "checkmark.square" : "square")).onTapGesture {
                self.markDoneAction(self.todoCellViewModel.getId())
            }
            
            Text(self.todoCellViewModel.getTitle())
            Spacer()
            
            Image(systemName: (self.todoCellViewModel.isPinned() ? "pin.fill" : "pin")).onTapGesture {
                self.pinAction(self.todoCellViewModel.getId())
            }
        }
        .padding()
    }
}

#if DEBUG
let todo = Todo(userID: 0, id: 0, title: "Note", completed: true, pinned: true)

struct TodoCell_Previews : PreviewProvider {
    static var previews: some View {
        TodoCell(todoCellViewModel: TodoCellViewModel(todo: todo), markDoneAction: { id in
            print("done \(id)")
        }, pinAction: { id in
            print("pin \(id)")
        })
    }
}
#endif
