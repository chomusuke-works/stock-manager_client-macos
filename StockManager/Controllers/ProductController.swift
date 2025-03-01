import Foundation

func fetchProducts() async throws -> Array<Product> {
	guard let url = URL(string: "http://localhost/api/products/all") else {
		throw SMError.invalidURL
	}

	let (data, response) = try await URLSession.shared.data(from: url)

	guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
		throw SMError.invalidResponse
	}

	do {
		let decoder = JSONDecoder()
		return try decoder.decode(Array<Product>.self, from: data)
	} catch {
		throw SMError.invalidData
	}
}

func fetchExpiredProducts(soon: Bool = false) async throws -> Array<ProductExpiry> {
	let category = soon ? "soonExpired" : "expired";
	guard let url = URL(string: "http://localhost/api/products/\(category)") else {
		throw SMError.invalidURL
	}
	
	let (data, response) = try await URLSession.shared.data(from: url)
	
	guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
		throw SMError.invalidResponse
	}
	
	do {
		let decoder = JSONDecoder()
		return try decoder.decode(Array<ProductExpiry>.self, from: data)
	} catch {
		throw SMError.invalidData
	}
}
