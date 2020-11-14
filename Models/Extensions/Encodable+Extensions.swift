//
//  Encodable+Extensions.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


extension Encodable {
	
	/// Encode `Codable` to JSON data.
	var data: Data? {
		let data: Data?
		do {
			data = try JSONEncoder().encode(self)
		} catch {
			print("\(Self.self) encoding failed. \(error)")
			data = nil
		}
		return data
	}
	
	/// Encode `Codable` to JSON data, then serialize it to dictionary.
	var json: [String: Any]? {
		guard let data = data else {
			return nil
		}
		
		let json: [String: Any]?
		do {
			json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
		} catch {
			print("\(Self.self) serialization failed. \(error)")
			json = nil
		}
		return json
	}
}
