//
//  PropertyWrapper.swift
//  CodableUnitTests
//
//  Created by Geri Borbás on 15/11/2020.
//  Copyright © 2020. eppz. All rights reserved.
//

import Foundation


struct PropertyWrapper: Codable, Equatable {
	
	@Base64 var search: Data
	@Base64 var save: Data
}
