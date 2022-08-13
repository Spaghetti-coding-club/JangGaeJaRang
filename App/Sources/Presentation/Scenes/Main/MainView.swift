import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                NavigationLink {
                    CreateFeedView()
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
                            ForEach(viewModel.feedList, id: \.uid) { feed in
                                MainFeedRow(size: proxy.size, feed: feed)
                                    .padding(.bottom, 40)
                            }
                        }
                        .navigationTitle("최신피드")
                    }
                    .background(Color.background)
                }
                .zIndex(0)
            }
            .onAppear {
                viewModel.send(.onAppear)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder
    func MainFeedRow(size: CGSize, feed: Feed) -> some View {
        VStack {
            HStack(spacing: 14) {
                AsyncImage(url: URL(string: feed.author.profileImageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width: 36, height: 36)
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .clipShape(Circle())
                    } else if phase.error != nil {
                        VStack {
                            Image(systemName: "exclamationmark.square")
                            Text("이미지를 불러올 수 없습니다")
                        }
                        .foregroundColor(.gray4)
                    } else {
                        ProgressView()
                    }
                }
                .clipped()
                Text(feed.author.dogName)
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
            }
            .padding(.horizontal, 18)
            
            ImageListView(images: feed.imageUrls)
                .frame(width: size.width, height: size.width)
                .padding(.top, 12)
            
            HStack {
                Button {
                    print("Like")
                } label: {
                    Label {
                        Text("\(feed.likeCount)")
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
            
            Text(feed.content)
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
