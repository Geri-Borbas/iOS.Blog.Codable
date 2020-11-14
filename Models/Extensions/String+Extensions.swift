//
//  String+Extensios.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


extension String {
	
	/// Get `String` data, then serialize it to dictionary.
	var json: [String: Any]? {
		let json: [String: Any]?
		do {
			let data = Data(self.utf8)
			json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
		} catch {
			print("\(Self.self) serialization failed. \(error)")
			json = nil
		}
		return json
	}
}
