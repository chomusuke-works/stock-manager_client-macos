import SwiftUI

struct ExpiryDateView: View {
	var body: some View {
		HStack {
			ExpiryListView(soon: false)
				.padding()
			
			ExpiryListView(soon: true)
				.padding()
		}
	}
}

struct ExpiryListView: View {
	@State private var products: Array<ProductExpiry>?
	let soon: Bool
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(self.getTitle())
				.font(.title2)
				.foregroundStyle(self.getColor())
			
			Grid(horizontalSpacing: 5, verticalSpacing: 5) {
				ForEach(products ?? []) { entry in
					GridRow {
						Text(entry.date)
						Text(entry.name)
						Text("x \(entry.quantity)")
					}
					
					Divider()
				}
			}
			.task {
				 do {
					 products = try await fetchExpiredProducts(soon: soon)
				 } catch is SMError {
					 print("Application-specific error")
				 } catch {
					 print("Unknown error")
				 }
			}
			
			Spacer()
		}
		.fixedSize(horizontal: true, vertical: false)
		.frame(minWidth: 250, maxWidth: .infinity)
	}
	
	private func getColor() -> Color {
		return self.soon ? .orange : .red
	}
	
	private func getTitle() -> String {
		return self.soon ? "Soon expired" : "Expired"
	}
}

#Preview {
    ExpiryDateView()
}
