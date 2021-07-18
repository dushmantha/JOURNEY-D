
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
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)]
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = #colorLiteral(red: 1, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]
        
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
