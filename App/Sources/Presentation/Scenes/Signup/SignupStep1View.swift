//
//  SignupStep1.swift
//  JangGaeJaRang
//
//  Created by 짜미 on 2022/08/13.
//  Copyright © 2022 com.spaghetti. All rights reserved.
//

import SwiftUI
import Inject

struct SignupStep1View: View {
    
    @ObservedObject private var iO = Inject.observer
    
    @StateObject private var viewModel = SignupStep1VM()
    
    @State private var isNextStepPresented = false
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                StepLabelComponent(1)
                VStack(spacing: 40) {
                    ZStack {
                        Image("profileImage")
                        
                        ZStack {
                            Circle()
                                .frame(width: 38, height: 38)
                                .foregroundColor(Color.gray3)
                            
                            Image(systemName: "pencil")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.gray4)
                        }
                        .padding(85, 85, 0, 0)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("이름")
                            .font(.system(size: 16, weight: .semibold))
                        
                        TextField("", text: $viewModel.dogName)
                        
                        Rectangle()
                            .foregroundColor(.gray4)
                            .frame(height: 1)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("견종")
                            .font(.system(size: 16, weight: .semibold))
                        
                        TextField("", text: $viewModel.dogBreed)
                        
                        Rectangle()
                            .foregroundColor(.gray4)
                            .frame(height: 1)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("생년월일")
                            .font(.system(size: 16, weight: .semibold))
                        
                        DatePicker("", selection: $viewModel.birthday, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .environment(\.locale, Locale.init(identifier: "ko"))
                            .labelsHidden()
                        
                        Rectangle()
                            .foregroundColor(.gray4)
                            .frame(height: 1)
                    }
                    
                    Spacer()
                    
                    MainButton(text: "다음", style: .enabled) {
                        isNextStepPresented = true
                    }
                }
            }
            .accentColor(.disabledGreen)
            .padding(30)
            .background(NavigationLinkEmpty(isActive: $isNextStepPresented, {
                Text("nextStep")
            }))
        }
    }
}

struct signupStep1_Previews: PreviewProvider {
    static var previews: some View {
        SignupStep1View()
    }
}
