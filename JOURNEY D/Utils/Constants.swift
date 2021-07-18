
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * Constants.
 */

import Foundation
import SwiftUI

// MARK: - Constants

struct Constants {
    
    // MARK: - Network
    struct Network {
        #if DEBUG
        static let BASE_URL = "https://jsonplaceholder.typicode.com/"
        #else
        static let BASE_URL = "https://jsonplaceholder.typicode.com/"
        #endif
        
        static let HTTPS_METHOD = "GET"
        
        static let POSTS_END_PATH = "posts"
        static let COMMENTS_END_PATH = "comments?postId="
    }
    
    // MARK: - SearchBar
    struct SearchBar {
        static let PLACE_HOLDER = "Search"
    }
    
    // MARK: - General
    struct General {
        static let CANCEL = "Cancel"
    }
    
    // MARK: - Navigation
    struct Navigation {
        static let HOME_TITLE = "Home"
    }
    
    // MARK: - Screen
    struct Screen {
        static let SCREEN_WIDTH = UIScreen.main.bounds.width
        static let SCREEN_HIEGHT = UIScreen.main.bounds.height
        static let IS_SMALL_SCREEN = UIScreen.main.bounds.height < 750
    }
    struct Images {
        static let PROFILE = ["2","3"]
        static let LIST = ["1","4","5","6","7","8","9"]
    }
    
    struct Comment {
        static let COMMENTS = "Comments"
    }
}
