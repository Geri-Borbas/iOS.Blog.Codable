//
//  Dictionary+Extensions.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


protocol StringProtocol {}
extension String: StringProtocol {}
extension Dictionary where Key: StringProtocol, Value: Any {
	
	/// Dictionary equality check using `NSDictionary.isEqual(to:)`.
	func isEqual(to dictionary: [String: Any]?) -> Bool {
		guard let dictionary = dictionary else {
			return false
		}
        return NSDictionary(dictionary: self).isEqual(to: dictionary)
    }
}


extension Optional where Wrapped == Dictionary<String, Any> {
	
	/// Dictionary equality check using `NSDictionary.isEqual(to:)`.
	func isEqual(to dictionary: [String: Any]?) -> Bool {
		guard let dictionary = dictionary,
			  let `self` = self else {
			return false
		}
		return self.isEqual(to: dictionary)
	}
}
