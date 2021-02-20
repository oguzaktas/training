test("A hello world test", 1, function () {
    equal(greeting, "Hello world", "Expect greeting of hello world")
});

test('Area of pizza slice', 1, function () {
    equal(areaOfPizzaSlice(18, 8), 31.808619, 'Expected 31.808619')
});