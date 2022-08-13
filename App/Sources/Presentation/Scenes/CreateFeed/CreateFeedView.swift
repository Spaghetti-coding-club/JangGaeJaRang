import SwiftUI

struct CreateFeedView: View {
    @StateObject var viewModel = CreateFeedViewModel()
    @State var isActiveImagePicker = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            GeometryReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Divider()
                        
                        HStack {
                            Button {
                                isActiveImagePicker.toggle()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.gray2)
                                        .frame(width: 80, height: 80)
                                    Image(systemName: "plus")
                                        .foregroundColor(.gray4)
                                }
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.images.indices, id: \.self) { idx in
                                        Image(uiImage: UIImage(data: viewModel.images[idx]) ?? .init())
                                            .resizable()
                                            .frame(width: 80, height: 80)
                                            .aspectRatio(contentMode: .fit)
                                            .onTapGesture {
                                                viewModel.images.remove(at: idx)
                                            }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .frame(height: 90)
                        
                        Divider()
                        
                        TextEditor(text: $viewModel.content)
                            .frame(maxWidth: .infinity, maxHeight: 260)
                        
                        Divider()
                        
                        Spacer()
                        
                        MainButton(
                            text: "올리기",
                            style: !viewModel.content.isEmpty && !viewModel.images.isEmpty ? .enabled : .disabled
                        ) {
                            viewModel.send(.completeButtonDidTap)
                        }
                        .padding(.horizontal, 30)
                        .padding(.bottom, 50)
                    }
                    .frame(height: proxy.size.height)
                }
                .navigationTitle("게시글 작성")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .sheet(isPresented: $isActiveImagePicker) {
            ImagePicker(image: $viewModel.selectedImage)
        }
        .onReceive(viewModel.$dismissIsRequired) { _ in
            if viewModel.dismissIsRequired {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct CreateFeedView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFeedView()
    }
}
