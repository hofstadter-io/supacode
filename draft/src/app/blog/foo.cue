#schema: {
	foo: int
}

// separately
Foo: #schema
Foo: {
	foo: 42
}

// at once
// mark[6:14]
Foo: #schema & {
	foo: 42
}
