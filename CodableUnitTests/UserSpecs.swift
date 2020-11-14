//
//  UserSpecs.swift
//  Codable
//
//  Created by Geri Borbás on 07/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Quick
import Nimble


class UserSpecs: QuickSpec {
	
	override func spec() {
			
		describe("\(User.self)") {
			
			context("with single values") {
			
				it("should be decoded from JSON") {

					expect(User(from: """
					{
						"isAdmin" : true,
						"firstName" : "Sam",
						"lastName" : "Soffes",
						"profilePictureUrl" : "https://randomuser.me/api/portraits/men/11.jpg"
					}
					""")).to(equal(User(
						id: 0,
						isAdmin: true,
						firstName: "Sam",
						lastName: "Soffes",
						profilePictureUrl: URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!
					)))
				}
				
				it("should be decoded from JSON without `id` and `isAdmin`") {

					expect(User(from: """
					{
						"firstName" : "Sam",
						"lastName" : "Soffes",
						"profilePictureUrl" : "https://randomuser.me/api/portraits/men/11.jpg"
					}
					""")).to(equal(User(
						id: 0,
						isAdmin: false,
						firstName: "Sam",
						lastName: "Soffes",
						profilePictureUrl: URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!
					)))
				}
			}
			
			context("with sequenced values") {
				
				it("yet cannot be encoded to JSON skipping `id`") {
					
					expect(User(
						id: 0,
						isAdmin: true,
						firstName: "Sam",
						lastName: "Soffes",
						profilePictureUrl: URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!
					).json.isEqual(to: """
					{
						"isAdmin" : true,
						"firstName" : "Sam",
						"lastName" : "Soffes",
						"profilePictureUrl" : "https://randomuser.me/api/portraits/men/11.jpg"
					}
					""".json)).to(beFalse())
				}
				
				it("yet cannot be encoded to JSON skipping `id`") {
					
					expect(User(
						id: 2,
						isAdmin: false,
						firstName: "Sam",
						lastName: "Soffes",
						profilePictureUrl: URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!
					).json.isEqual(to: """
					{
						"isAdmin" : false,
						"firstName" : "Sam",
						"lastName" : "Soffes",
						"profilePictureUrl" : "https://randomuser.me/api/portraits/men/11.jpg"
					}
					""".json)).to(beFalse())
				}
				
			}
		}
	}
}
