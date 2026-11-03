import SwiftUI

struct ContentView: View {
    @State private var value = 0.0
    
    var body: some View {
        VStack {
            CountingText(value: value)
            Button("Push Me") {
                withAnimation(.linear) {
                    value = Double.random(in: 1...1000)
                }
            }
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    ContentView()
}
