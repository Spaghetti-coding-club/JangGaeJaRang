//
//  SignupStep3View.swift
//  JangGaeJaRang
//
//  Created by 짜미 on 2022/08/14.
//  Copyright © 2022 org.spaghetti. All rights reserved.
//

import SwiftUI

struct SignupStep3View: View {
    
    @StateObject private var viewModel = SignupStep3VM()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isMainViewPresented = false
    
    var body: some View {
        BackgroundTapGesture {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    StepLabelComponent(3)
                    
                    VStack(spacing: 40) {
                        Text("자세한 정보도 알려주세요!")
                            .font(.system(size: 22, weight: .semibold))
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("소개글")
                                .font(.system(size: 16, weight: .semibold))
                            
                            NewTextEditor(text: $viewModel.description, placeholder: "정중히 인사드립니다. 말티즈 멍멍이입니다.")
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: UIScreen.screenHeight * 0.1, alignment: .topLeading)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray5, lineWidth: 0.5))
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("인스타그램 프로필")
                                .font(.system(size: 16, weight: .semibold))
                            
                            TextField("URL을 넣어주세요!", text: $viewModel.instagramUrl)
                                .padding(12)
                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray5, lineWidth: 0.5))
                        }
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("개BTI")
                                .font(.system(size: 16, weight: .semibold))
                            
                            let gbtiColumns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 15), count: 2)
                            
                            LazyVGrid(columns: gbtiColumns, spacing: 15) {
                                ForEach(gbti.allCases, id: \.self) { item in
                                    GbtiComponent(title: item.title, tags: item.tags, isSelected: viewModel.gbti == item) {
                                        viewModel.gbti = item
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 10) {
                            MainButton(text: "이전", style: .canceled) {
                                presentationMode.wrappedValue.dismiss()
                            }
                            
                            MainButton(text: "다음", style: .enabled) {
                                isMainViewPresented = true
                            }
                            .frame(width: UIScreen.screenWidth * 0.55)
                        }
                    }
                }
                .navigationBarHidden(true)
                .accentColor(.disabledGreen)
                .padding(30)
                .background(NavigationLinkEmpty(isActive: $isMainViewPresented, {
                    MainView()
                }))
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct SignupStep3View_Previews: PreviewProvider {
    static var previews: some View {
        SignupStep3View()
    }
}
