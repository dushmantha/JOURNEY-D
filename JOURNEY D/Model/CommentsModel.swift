
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * .
 */

import SwiftUI


struct CommentResponse: Codable {
    var results: [CommentResult]
}

struct CommentResult: Codable, Identifiable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
