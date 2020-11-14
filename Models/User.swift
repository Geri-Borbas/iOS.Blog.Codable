//
//  User.swift
//  Codable
//
//  Created by Geri Borbás on 13/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


struct User: Codable, Equatable {

	@DefaultToZero var id: Int
    @DefaultToFalse var isAdmin: Bool
	let firstName: String
	let lastName: String
	let profilePictureUrl: URL
}
