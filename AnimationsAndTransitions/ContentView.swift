import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var scale = 1.0
    
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation {
                    scale += 1
                }
            }
            .frame(width: 400, height: 400)
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
