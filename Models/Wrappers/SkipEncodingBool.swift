//
//  SkipEncodingBool.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


@propertyWrapper struct SkipEncodingBool: Equatable {
	
	let wrappedValue: Bool
	
	init(wrappedValue: Bool) {
		self.wrappedValue = wrappedValue
	}
}


// MARK: Decodable

extension SkipEncodingBool: Decodable {
	
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
		wrappedValue = try container.decode(Bool.self)
    }
}


// MARK: Encodable

extension SkipEncodingBool: Encodable { }


extension KeyedEncodingContainer {
	
	mutating func encode(_ value: SkipEncodingBool, forKey key: KeyedEncodingContainer<K>.Key) throws {
		// Skip encoding.
	}
}
