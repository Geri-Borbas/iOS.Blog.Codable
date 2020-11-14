#  Codable Property Wrappers

Some lightweight extensions, and property wrappers to make life easier with `Codable`. The repository work is in progress, yet you can already do things like below.

```Swift
struct User: Codable, Equatable {

	@DefaultToZero var id: Int
	@DefaultToFalse var isAdmin: Bool
	let firstName: String
	let lastName: String
	let profilePictureUrl: URL
}
```
```Swift
struct Settings: Codable, Equatable {

	@DefaultToZero var page: Int
	@SkipEncodingBool var isAdmin: Bool
}
```

Also with the `.json` and `from:` extensions you can make pretty expressive tests.

```Swift
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
```

```Swift
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
```


## License

> Licensed under the [**MIT License**](https://en.wikipedia.org/wiki/MIT_License).





