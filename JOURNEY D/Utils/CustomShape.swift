
/*
 * Created by Dushmantha Tharaka on 07/21.
 * Copyright (C) 2021 Buckshee. All rights reserved.
 * Please contact [tdmihiran@gmail.com] for more information.
 
 ### Abstract:
 * This help to a redesign view shapes.
 */


import SwiftUI

// MARK: - CustomShape

struct CustomShape: Shape {
    func path(in rect:CGRect)-> Path{
        return Path{ path in
            let pt1 = CGPoint(x:0, y:0)
            let pt2 = CGPoint(x: 0, y: rect.height)
            let pt3 = CGPoint(x: rect.width, y: rect.height)
            let pt4 = CGPoint(x: rect.width, y:150)
            
            path.move(to: pt4)
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 45)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 45)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 45)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 45)
        }
    }
}
