describe 'ShoppingList.ItemsCollection', ->
	beforeEach ->
		item = new ShoppingList.Item
		@items_collection = new ShoppingList.ItemsCollection [ item ]
		
	it 'has the right url', ->
		expect(@items_collection.url).toBe('/items')
	
	it 'has the right model', ->
		expect(@items_collection.at(0)).not.toBeUndefined()
		expect(@items_collection.at(0) instanceof ShoppingList.Item).toBe(true)
	 