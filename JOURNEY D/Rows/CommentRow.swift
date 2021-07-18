
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * A view presented to the user when they have comments in the home screen.
 */


import SwiftUI
import SwiftUIX

struct CommentsRow: View {
    var comment : CommentResult = CommentResult(postId: 1, id: 1, name: "AAAA", email: "AAAA", body: "AAA")
    var body: some View {
        VisualEffectBlurView(blurStyle: .light, content: {
            VStack(alignment: .leading, spacing : 8) {
                HStack {
                    Text(comment.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Image("2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .padding(.top, -50)
                }.padding(.top, 50)
                Text(comment.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black.opacity(0.5))
                HStack{
                    Spacer()
                    Text(comment.email)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.5))
                }
            }
            .padding()
            
        })
        .frame( height: 400)
        .mask(RoundedRectangle(cornerRadius: 30, style: .circular))
    }
}


struct CommentsRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentsRow()
    }
}
