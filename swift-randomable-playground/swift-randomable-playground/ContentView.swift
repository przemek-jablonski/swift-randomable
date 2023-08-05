import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "shippingbox")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("swift-randomable-playground")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
