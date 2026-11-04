import SwiftUI

struct ContentView: View {
    @State var scale = 1.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withMotionAnimation {
                    scale += 1
                }
            }
            .scaleEffect(scale)
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    ContentView()
}
