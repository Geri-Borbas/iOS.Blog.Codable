//
//  CircleSpecs.swift
//  Codable
//
//  Created by Geri Borbás on 14/11/2020.
//  Copyright © 2020. Geri Borbás. All rights reserved.
//

import Quick
import Nimble


class CircleSpecs: QuickSpec {
	
	override func spec() {
			
		describe("\(Circle.self)") {
			
			it("should be decoded from JSON") {

				expect(Circle(from: """
				{
					"center" : [10, 10],
					"radius" : 20
				}
				""")).to(equal(Circle(
					center: CGPoint(x: 10, y: 10),
					radius: 20
				)))
			}
		}
	}
}
