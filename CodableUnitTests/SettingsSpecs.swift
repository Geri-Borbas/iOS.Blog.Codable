//
//  SettingsSpecs.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Quick
import Nimble


class SettingsSpecs: QuickSpec {
	
	override func spec() {
			
		describe("\(Settings.self)") {
			
			it("should be decoded from JSON") {

				expect(Settings(from: """
				{
					"page" : 5,
					"isAdmin" : true
				}
				""")).to(equal(Settings(
					page: 5,
					isAdmin: true
				)))
			}
			
			it("should not be decoded from JSON skipping `isAdmin`") {

				expect(Settings(from: """
				{
					"page" : 5
				}
				""")).to(beNil())
			}
			
			it("should be encoded to JSON skipping `isAdmin`") {

				expect(Settings(
					page: 5,
					isAdmin: true
				).json.isEqual(to: """
				{
					"page" : 5
				}
				""".json)).to(beTrue())
			}
		}
	}
}
