
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * A view presented to the posts list.
 */

import SwiftUI

struct PostView: View {
    
    @State public var searchText : String = ""
    @State private var results = [Post]()
    @State  var ItemResults : Post?
    let service = Service()
    var body: some View {

        LinearGradient(gradient: Gradient(colors: [Color("AccentColor").opacity(0.9),Color("Green").opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing).padding(.top, -60).overlay( VStack(alignment:.center){
                Spacer()
                SearchBar(searchText: $searchText)
                ScrollView { LazyVStack {
                    ForEach(results.filter({$0.title.localizedCaseInsensitiveContains(self.searchText)  || self.searchText == ""})) {
                        result in
                        PostRow(post: result)
                   
                    }
                }.navigationBarTitle(Constants.Navigation.HOME_TITLE)
                }
                .onAppear(perform: loadData)
            }).edgesIgnoringSafeArea(.bottom)
        
    }
    func loadData() {
        service.getPosts(endPath: Constants.Network.POSTS_END_PATH, completion: { (decodedResponse)-> Void in
            self.results = decodedResponse
        })
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
