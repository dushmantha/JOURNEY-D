
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * A view presented to the post details and user comments.
 */

import SwiftUI

struct DetailsView: View {
    
    @State private var results = [Comment]()
    @State public var searchText : String = ""
    @Environment (\.presentationMode) var present
    @State var isSmallDevice = Constants.Screen.IS_SMALL_SCREEN
    @State var post : Post
    let service = Service()
    
    var body: some View {
        VStack {
            Spacer(minLength: isSmallDevice ? 20 : 60)
            
            HStack {
                Button(action: {present.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.6))
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding([.horizontal, .top])
            VStack(alignment: .leading, spacing: 10, content: {
                Text(post.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.black).padding(.horizontal)
            })
            VStack {
                VStack(alignment: .center,  content: {
                    HStack{
                        Spacer()
                        Image(Constants.Images.LIST.randomElement() ?? "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width / 3)
                            .offset(y:isSmallDevice ? 20 : -20).padding(.top)
                    }
                    Text(post.body)
                })
                HStack{
                    Text(Constants.Comment.COMMENTS).font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.black.opacity(0.6))
                    Spacer()
                }.padding(.top)
                
                SearchBar(searchText: $searchText)
                ScrollView(showsIndicators: false) { LazyVStack {
                    ForEach(results.filter({$0.name.localizedCaseInsensitiveContains(self.searchText)  || self.searchText == ""})){
                        result in
                        CommentRow(comment: result)
                    }
                }.onAppear(perform: loadData)
                
                }.padding()
            }
            .padding(.horizontal)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.09019607843, blue: 0.09019607843, alpha: 1)).opacity(0.8), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing).clipShape(CustomShape()))
            .padding(.horizontal)
            
        }.background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.09019607843, blue: 0.09019607843, alpha: 1)).opacity(0.9), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)).opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)).edgesIgnoringSafeArea(.vertical)
    }
    
    func loadData() {
        service.getCommnets(endPath: Constants.Network.COMMENTS_END_PATH, postId: String(post.id)) { (decodedResponse) in
            self.results = decodedResponse
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(post: Post(userId: 1, id: 1, title: "", body: ""))
    }
}
