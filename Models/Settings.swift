//
//  Settings.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Foundation


struct Settings: Codable, Equatable {

	@DefaultToZero var page: Int
    @SkipEncodingBool var isAdmin: Bool
}
