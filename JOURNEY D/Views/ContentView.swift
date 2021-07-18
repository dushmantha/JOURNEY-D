
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * The app's starting with a color configuration.
 */

import SwiftUI

// MARK: - ContentView

struct ContentView: View {
    /*
     Configuration : UITabBar/UINavigationBar/coloredAppearance
     */
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: Color("Green")]
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(Color("AccentColor"))
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Color("Font"))]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        NavigationView {
            PostView()
        }.ignoresSafeArea() // Ignores Safe-Area
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
