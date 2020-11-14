//
//  DefaultToZero.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


@propertyWrapper struct DefaultToZero: Equatable {
	
	static let defaultValue = 0
    let wrappedValue: Int
}


// MARK: Decodable

extension DefaultToZero: Decodable {
	
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = try container.decode(Int.self)
    }
}


extension KeyedDecodingContainer {
	
    func decode(_ type: DefaultToZero.Type, forKey key: Key) throws -> DefaultToZero {
		try decodeIfPresent(type, forKey: key) ?? DefaultToZero(wrappedValue: DefaultToZero.defaultValue)
    }
}


// MARK: Encodable

extension DefaultToZero: Encodable {
	
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}
