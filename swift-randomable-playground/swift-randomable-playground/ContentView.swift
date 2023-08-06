import SwiftUI

internal struct ContentView: View {
    internal var body: some View {
        VStack {
            Image(systemName: "shippingbox")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("swift-randomable-playground")
        }
        .padding()
    }
}

internal struct ContentView_Previews: PreviewProvider {
    internal static var previews: some View {
        ContentView()
    }
}
