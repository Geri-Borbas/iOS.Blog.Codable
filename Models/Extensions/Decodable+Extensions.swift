//
//  Decodable+Extensions.swift
//  Codable
//
//  Created by Geri Borbás on 13/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


extension Decodable {

	/// Failable initializer decoding `Codable` from JSON string.
	init?(from jsonString: String) {
		self.init(from: Data(jsonString.utf8))
	}
	
	/// Failable initializer decoding `Codable` from JSON data.
	init?(from jsonData: Data) {
		var decoded: Self?
		do {
			decoded = try JSONDecoder().decode(Self.self, from: jsonData)
		} catch {
			print("\(Self.self) decoding from data failed. \(error)")
		}
		
		if let decoded = decoded {
			self = decoded
		} else {
			return nil
		}
	}
}
