//
//  DefaultToFalse.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


@propertyWrapper struct DefaultToFalse: Equatable {
	
	static let defaultValue = false
	let wrappedValue: Bool
	
	init(wrappedValue: Bool, skipEncoding: Bool = false) {
		self.wrappedValue = wrappedValue
	}
}


// MARK: Decodable

extension DefaultToFalse: Decodable {
	
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Bool.self)
    }
}


extension KeyedDecodingContainer {
	
    func decode(_ type: DefaultToFalse.Type, forKey key: Key) throws -> DefaultToFalse {
		try decodeIfPresent(type, forKey: key) ?? DefaultToFalse(wrappedValue: DefaultToFalse.defaultValue)
    }
}


// MARK: Encodable

extension DefaultToFalse: Encodable {
	
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
