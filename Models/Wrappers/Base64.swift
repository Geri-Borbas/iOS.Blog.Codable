//
//  Base64.swift
//  CodableUnitTests
//
//  Created by Geri Borbás on 15/11/2020.
//  Copyright © 2020. eppz. All rights reserved.
//

import Foundation


@propertyWrapper struct Base64: Equatable {
	
	let wrappedValue: Data
	
	init(wrappedValue: Data) {
		self.wrappedValue = wrappedValue
	}
}


// MARK: Decodable

extension Base64: Decodable {
	
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
		let stringValue = try container.decode(String.self)
		guard let dataValue = Data(base64Encoded: stringValue) else {
			throw DecodingError.valueNotFound(
				Self.self,
				DecodingError.Context(
					codingPath: decoder.codingPath,
					debugDescription: "Could not decode `\(stringValue)` to Data."
				)
			)
		}
        wrappedValue = dataValue
    }
}


// MARK: Encodable

extension Base64: Encodable {
	
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue.base64EncodedString())
    }
}

