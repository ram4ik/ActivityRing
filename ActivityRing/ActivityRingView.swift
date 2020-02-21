//
//  ActivityRingView.swift
//  ActivityRing
//
//  Created by ramil on 21.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ActivityRingView: View {
    @Binding var progress: CGFloat
    
    var colors: [Color] = [Color.darkRed, Color.lightRed]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.outlineRed, lineWidth: 20)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
            ).rotationEffect(.degrees(-90))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.darkRed)
                .offset(y: -150)
        }.frame(idealWidth: 300, idealHeight: 300, alignment: .center)
    }
}

struct ActivityRingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRingView(progress: .constant(CGFloat(0.0)))
    }
}
