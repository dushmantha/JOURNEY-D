
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * A view resuable component and presented searching bar.
 */


import SwiftUI

// MARK: - SearchBar

struct SearchBar: View {
    
    @Binding public var searchText : String
    @State private var searching = false
    @State private var showCancelButton: Bool = false
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(Constants.SearchBar.PLACE_HOLDER, text: $searchText, onEditingChanged: { isEditing in
                    self.showCancelButton = true
                }, onCommit: {
                }).foregroundColor(.primary)
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            if showCancelButton  {
                Button(Constants.General.CANCEL) {
                    UIApplication.shared.endEditing(true)
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.black))
            }
        }
        .padding(.horizontal)
        .navigationBarHidden(showCancelButton)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}

/*
 Abstract:
 A modifier that can work keybord drag-gesture.
 */

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
