describe 'ShoppingList.Item', ->
	it 'has the right url', ->
		item = new ShoppingList.Item
		expect(item.url()).toBe('/items')
	
