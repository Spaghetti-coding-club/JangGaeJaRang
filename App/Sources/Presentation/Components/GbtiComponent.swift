//
//  GbtiComponent.swift
//  JangGaeJaRang
//
//  Created by 짜미 on 2022/08/14.
//  Copyright © 2022 org.spaghetti. All rights reserved.
//

import SwiftUI

struct GbtiComponent: View {
    
    var title: String
    var tags: String
    var isSelected: Bool
    var action: () -> Void
    
    
    init(title: String, tags: String, isSelected: Bool, action: @escaping () -> Void) {
        self.title = title
        self.tags = tags
        self.action = action
        self.isSelected = isSelected
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 10) {
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.top, 15)
                
                VStack(spacing: 5) {
                    Text(tags)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1.5)
                        .padding(.bottom, 15)
                }
                .foregroundColor(.gray4)
                .fontSize(14)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(isSelected ? Color.defaultGreen : Color.gray5, lineWidth: isSelected ? 2 : 1))
        }
    }
}
