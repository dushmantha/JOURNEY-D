
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * .
 */

import SwiftUI

struct PostResponse: Codable {
    var results: [PostResult]
}

struct PostResult: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

