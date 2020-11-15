//
//  ManualWrapper.swift
//  CodableUnitTests
//
//  Created by Geri Borbás on 15/11/2020.
//  Copyright © 2020. eppz. All rights reserved.
//

import Foundation


struct ManualWrapper: Codable, Equatable {
	
	let search: Base64DataWrapper
	let save: Base64DataWrapper
}
	