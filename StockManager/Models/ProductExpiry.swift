import Foundation

struct ProductExpiry: Decodable, Identifiable {
	let id = UUID()

	let name: String
	let date: String
	let quantity: Int32

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case date = "date"
		case quantity = "quantity"
	}
}
