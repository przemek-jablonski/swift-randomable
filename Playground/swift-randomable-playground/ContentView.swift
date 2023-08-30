import SwiftUI

internal struct ContentView: View {
    internal var body: some View {
        VStack {
            List {
                Image(systemName: "shippingbox")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)

                Text("swift-randomable-playground")

                ForEach(TestModelA.randoms()) { element in
                    Text(String(describing: element))
                }

                ForEach(TestModelB.randoms(), id: \.self) { element in
                    Text(String(describing: element))
                }

                ForEach(TestModelC.randoms()) { element in
                    Text(String(describing: element))
                }
            }
        }
        .padding()
    }
}

internal struct ContentView_Previews: PreviewProvider {
    internal static var previews: some View {
        ContentView()
    }
}
