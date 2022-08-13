import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .resizable()
                        .foregroundColor(.gray1)
                        .frame(width: 24, height: 24)
                        .padding(18)
                        .background(Color.defaultGreen)
                        .clipShape(Circle())
                        .offset(x: -10, y: -16)
                }
                .zIndex(1)

                GeometryReader { proxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(0...10, id: \.self) { _ in
                                MainFeedRow(size: proxy.size)
                                    .padding(.bottom, 40)
                            }
                        }
                        .navigationTitle("최신피드")
                    }
                    .background(Color.background)
                }
                .zIndex(0)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder
    func MainFeedRow(size: CGSize) -> some View {
        VStack {
            HStack(spacing: 14) {
                Image(systemName: "person.fill")
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                Text("멍멍이")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 18)
            
            ImageListView(images: ["https://avatars.githubusercontent.com/u/74440939?v=4", "https://avatars.githubusercontent.com/u/95753750?s=64&v=4"])
                .frame(width: size.width, height: size.width)
                .padding(.top, 12)
            
            HStack {
                Button {
                    print("Like")
                } label: {
                    Label {
                        Text("21")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.gray4)
                    } icon: {
                        Image("pets")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.gray4)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 18)
            
            Text("우리집 갱얼쥐 좀 보세요 우리집 앵얼쥐좀 보세요 우리집 좀 보고가세요")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray6)
                .padding(.top, 12)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
