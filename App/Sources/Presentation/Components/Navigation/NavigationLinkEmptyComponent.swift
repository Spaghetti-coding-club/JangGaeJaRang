//
//  NavigationLinkEmptyComponent.swift
//  JangGaeJaRang
//
//  Created by 짜미 on 2022/08/14.
//  Copyright © 2022 org.spaghetti. All rights reserved.
//

import SwiftUI

struct NavigationLinkEmpty<Content>: View where Content: View {
    
    @Binding var isActive: Bool
    let destination: () -> Content
    
    init(isActive: Binding<Bool>,
         @ViewBuilder _ destination: @escaping () -> Content) {
        self._isActive = isActive
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink(isActive: $isActive) {
            destination()
        } label: {
            EmptyView()
        }
    }
}
