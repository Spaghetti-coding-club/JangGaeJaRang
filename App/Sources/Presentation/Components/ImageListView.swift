import SwiftUI

struct ImageListView: View {
    var images: [String]
    
    var body: some View {
        TabView {
            if images.count <= 0 {
                VStack {
                    Image(systemName: "xmark.square")
                    Text("이미지가 없습니다")
                }
                .foregroundColor(.gray7)
                .tag(0)
            } else {
                ForEach(images.indices, id: \.self) { idx in
                    AsyncImage(url: URL(string: images[idx])) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
                    .tag(idx)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(images: [])
    }
}
