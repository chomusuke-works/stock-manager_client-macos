import Foundation

struct Product: Codable {
	var code: Int64
	var name: String
	var price: Double
	var supplierId: Int
}
