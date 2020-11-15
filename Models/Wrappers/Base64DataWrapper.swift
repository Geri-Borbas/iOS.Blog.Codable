//
//  Base64DataWrapper.swift
//  CodableUnitTests
//
//  Created by Geri Borbás on 15/11/2020.
//  Copyright © 2020. eppz. All rights reserved.
//

import Foundation


struct Base64DataWrapper: Equatable {
	
	let value: Data
}


// MARK: Decodable

extension Base64DataWrapper: Decodable {
	
	init(from decoder: Decoder) throws {
		let stringValue = try String(from: decoder)
		guard let dataValue = Data(base64Encoded: stringValue) else {
			throw DecodingError.valueNotFound(
				Self.self,
				DecodingError.Context(
					codingPath: decoder.codingPath,
					debugDescription: "Could not decode `\(stringValue)` to Data."
				)
			)
		}
		self.value = dataValue
	}
}


// MARK: Encodable

extension Base64DataWrapper: Encodable {
	
	func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(value.base64EncodedString())
	}
}
