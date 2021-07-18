
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

            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.09019607843, blue: 0.09019607843, alpha: 1)).opacity(0.9), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)).opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing).padding(.top, -60).overlay( VStack(alignment:.center){
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
