import SwiftUI

struct SignupStep2View: View {
    @ObservedObject var viewModel = SignupStep2VM()
    
    var body: some View {
        VStack(alignment: .leading) {
            StepLabelComponent(1)
            
            Text("자세한 정보도 알려주세요 !")
                .font(.system(size: 22, weight: .semibold))
                .padding(.top, 8)
            
            Text("성별")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray5)
                .padding(.top, 54)
            
            let genderColumns: [GridItem] = Array(
                repeating: GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 15),
                count: 2
            )
            
            LazyVGrid(columns: genderColumns, spacing: 15) {
                ForEach(Gender.allCases, id: \.self) { item in
                    SelectableButtonComponent(
                        title: item.title,
                        isSelected: viewModel.gender == item
                    ) {
                        viewModel.gender = item
                    }
                }
            }
            
            Text("신체 사이즈")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.gray5)
                .padding(.top, 40)
            
            VStack(spacing: 16) {
                ForEach(DogSize.allCases, id: \.self) { item in
                    SelectableButtonComponent(
                        title: item.title,
                        isSelected: viewModel.dogSize == item
                    ) {
                        viewModel.dogSize = item
                    }
                }
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                MainButton(text: "이전", style: .canceled) {
                    print("이전 버튼 탭")
                }
                
                MainButton(text: "다음", style: .enabled) {
                    print("이전 버튼 탭")
                }
                .frame(width: UIScreen.screenWidth * 0.55)
            }
        }
        .padding(30)
    }
}

struct SignupStep2View_Previews: PreviewProvider {
    static var previews: some View {
        SignupStep2View()
    }
}