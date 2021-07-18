
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * A view presented to the user when they have posts in the home screen.
 */


import SwiftUI
import SwiftUIX

// MARK: - PostRow

struct PostRow: View {
    
    @State var details = false
    var post : Post = Post(userId: 1, id: 1, title: "iOS(SwiftUI)", body: "Mobile Development")
    
    var body: some View {
        VisualEffectBlurView(blurStyle: .light, content: {
            VStack(alignment: .leading, spacing : 8) {
                Image(Constants.Images.LIST.randomElement() ?? "1")
                    .resizable()
                    .aspectRatio(contentMode: .fit).fill(alignment: .center)
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Text(post.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.5))
            }
            .padding()
        })
        .frame( height: 400)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .padding()
        .onTapGesture {
            details.toggle()
        }.fullScreenCover(isPresented: $details, content: {
            DetailsView( post: post)
        })
    }
}

struct PostRow_Previews: PreviewProvider {
    static var previews: some View {
        PostRow()
    }
}
