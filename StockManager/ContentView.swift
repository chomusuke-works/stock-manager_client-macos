import SwiftUI

struct ContentView: View {
	var body: some View {
		NavigationSplitView {
			List {
				NavigationLink(destination: ExpiryDateView()) {
					Image(systemName: "exclamationmark.triangle")
					Spacer()
					Text("Expiry")
				}
				NavigationLink(destination: EmptyView()) {
					Image(systemName: "cart")
					Spacer()
					Text("Orders")
				}
			}
		} detail: {
			ExpiryDateView()
		}
	}
}

#Preview {
    ContentView()
}
