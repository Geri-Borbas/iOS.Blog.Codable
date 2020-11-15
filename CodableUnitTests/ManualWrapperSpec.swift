//
//  ManualWrapperSpec.swift
//  CodableUnitTests
//
//  Created by Geri Borbás on 15/11/2020.
//  Copyright © 2020. eppz. All rights reserved.
//

import Quick
import Nimble


class ManualWrapperSpec: QuickSpec {
	
	override func spec() {
		
		describe("\(ManualWrapper.self)") {
			
			guard let searchUrl = Bundle(for: Self.self).url(forResource: "search", withExtension: "png"),
				  let searchData = try? Data(contentsOf: searchUrl),
				  let saveUrl = Bundle(for: Self.self).url(forResource: "save", withExtension: "png"),
				  let saveData = try? Data(contentsOf: saveUrl) else {
					return fail("Cannot load images.")
			}
			
			let searchDataBase64String = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAAC50lEQVR4nO2az0sbQRTHP7Yg+ItekkPTmwULuSokPbWeekz/Fo+lqXpp/xYDitceDe2hIFXqSZAco4cqbUTak+lhptiumd0Z387sJs4HHoRN8r7vvZ2ZnR8LkUgkEolE7itTHn0/BVrAClDT9lh/dwr0te0Du0DPYyzBqAKbwBEwdLQj/d9q8KhzYA5oAwPcE0/aQPuaDZqBgBaqKUsTT1pf+y4tU8A74Jr8k/9r16jWUDpmgA7+Ek/altYsDbbJHwDrwEtgCZjXtqSvrevf2BahFLTJDnYbqDv4rOv/ZPl9m0sGAlqk9/ke0BT4b2ofaWNCYQPjHOmj/R5QyUGnAnRTdPoU9IhMa/pdYDpHrWnSixC8K1QxT3J65HPnk1Qwd4cBgWeMm4ZAhsj6fBbNFN0Nj7q3MM3ttwNo7xi0vwXQBtSqznQXXB51d6Weor8YQJ81g/hBCHHNoSGGNanjBxa/WTFc35WKO2DSWpY6tilAzXB9TyrugEnLFJs1kgL0peIOmLTEBbDhktH9bz6EuGbBEMOl1LFNCygzD6UObApwargepPllaJ1LHdsUoND+l6F1IXUsKcALqbgDJq1jqWObAuwbrr+Wijtg0voUQrzMU2HxRMiWMi6GTvB7svUfRS2Hn6fovvGoe4uybYj85uacMRhl2hL7kKOWNVmbol3CbIqeoabGhVD0tvgQ+AE0BBpibA5GdnA/GDGN9qUswtaIoEbZIWrzchV4hmq6C/rzqv7OtNtT6iLMYF8En1Z4S2jj93h8LIrg6wWJM1RyY1GEWdRxVR6vyPwC3qPGigZjVARQM8YN1KGFa+InqOltcobntQg+FxOLqGXsMjevydVQ21jnqM2MY9SS9jPwFZXEKBrAR+CRhe5P4BXwRRB7KRm77uADlyJcEHbbLhguRegUFKN3bItwVVSAIbApwkQXALKLMLFd4F8aqAEvmfx3JnQQHMUT1N2+0tbhHiUfiUQikUjkbvwBfqGnGcX9FNsAAAAASUVORK5CYII="
			
			let saveDataBase64String = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAsTAAALEwEAmpwYAAAB0ElEQVR4nO2aQW7CMBQFB25BSc/BhROFY7R3QQQWVL0BXdRRacBOANvPwB/Ju8h+b4DQ/gCGYRj5eQdaYOtWC1TSRBmpgANwHKwDLyKh5bx8v1phrmxs8QvY5g4zy30gv0VDZM00z3lYiZgAdQA1JkAdQI0JUAdQYwLUAdSYAHUANSZAHUCNCVAHUBNLwAKogY1bDbCMtDdur+Zk/9qdWQQLYM/5dOcLWF243jcN6teQldtreN2eQiTU+Mt8cy7hGgErt4fv2jp6mxvYEC40lDBVwFj5oztbzpiAoYQpAqaUL0ZAw3jQUwlj100tX8xHYMnlm5RPQoxrju7Mtwz9JnHNqxZjXbq5ysklocjyPaklFF2+J5WEhyjfE1tC8vIpntfHkhCjfAWsgc6tNSf9Uj6vv1dCrPLBfqmf198qIdbbfh04o4U8z+uvlRDzM98FzumYECYWUyXEvuGN9sslAMYlpLjbFyUA/AMO3wDlXooTAH8jrv5rtyHdPzbBfjPGSyp+RxSTYD+bCqsDqDEB6gBqTIA6gJqXFzDl74Cn5uXfASZAHUDNHNipQwjZzYFPdQohH+AfGj77+jf0rfgdEIbmZ8+yOtc15k94DMN4UH4AXdp/hPWb7vUAAAAASUVORK5CYII="
				
			it("should be decoded from JSON") {
				
				expect(ManualWrapper(from: """
				{
					"search" : "\(searchDataBase64String)",
					"save" : "\(saveDataBase64String)"
				}
				""")).to(equal(ManualWrapper(
					search: Base64DataWrapper(value: searchData),
					save: Base64DataWrapper(value: saveData)
				)))
			}
			
			it("should be encoded to JSON") {
				
				expect(ManualWrapper(
					search: Base64DataWrapper(value: searchData),
					save: Base64DataWrapper(value: saveData)
				).json.isEqual(to: """
				{
					"search" : "\(searchDataBase64String)",
					"save" : "\(saveDataBase64String)"
				}
				""".json)).to(beTrue())
			}
			
			it("should be able access data using `value` accessor") {
				
				expect(
					ManualWrapper(
						search: Base64DataWrapper(value: searchData),
						save: Base64DataWrapper(value: saveData)
					).search.value
				).to(
					equal(searchData)
				)
				
				expect(
					ManualWrapper(
						search: Base64DataWrapper(value: searchData),
						save: Base64DataWrapper(value: saveData)
					).save.value
				).to(
					equal(saveData)
				)
			}
		}
	}
}
