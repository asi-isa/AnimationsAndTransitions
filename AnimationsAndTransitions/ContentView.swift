import SwiftUI

struct ContentView: View {
    @State private var value = 0
    let message = "This is a very long piece of text that appears letter by letter."
    
    var body: some View {
        VStack {
            TypewriterText(string: message, count: value)
            
            Button("Type!") {
                withAnimation(.linear(duration: 2)) {
                    value = message.count
                }
            }
            
            Button("Reset") {
                value = 0
            }
        }
        .frame(width: 400, height: 400)
    }
}

#Preview {
    ContentView()
}
