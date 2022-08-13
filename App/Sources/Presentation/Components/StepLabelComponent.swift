//
//  StepLabelComponent.swift
//  JangGaeJaRang
//
//  Created by 이건우 on 2022/08/14.
//  Copyright © 2022 org.spaghetti. All rights reserved.
//

import SwiftUI

struct StepLabelComponent: View {
    var number: Int
    
    var body: some View {
        Text("step. \(number)")
            .font(Font.system(size: 14, weight: .semibold))
            .foregroundColor(.defaultGreen)
            .padding(4, 10, 10, 4)
            .background(Color.gray7)
            .cornerRadius(41)
    }
    
    init(_ number: Int) {
        self.number = number
    }
}

struct StepLabelComponent_Previews: PreviewProvider {
    static var previews: some View {
        StepLabelComponent(1)
    }
}
