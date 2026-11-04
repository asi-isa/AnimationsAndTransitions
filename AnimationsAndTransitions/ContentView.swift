import SwiftUI

struct ContentView: View {
    @State var isFavorite = false
    
    var body: some View {
        VStack(spacing: 60) {
            ForEach([Font.body, Font.largeTitle, Font.system(size: 72)], id: \.self) { font in
                Button {
                    isFavorite.toggle()
                } label: {
                    if isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .transition(.confetti(color: .red, size: 3))
                            .font(font)
                    } else {
                        Image(systemName: "heart")
                            .foregroundStyle(.gray)
                            .font(font)
                    }
                }
            }
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    ContentView()
}
