describe 'ShoppingList.StoresView', ->
	it 'renders a button', ->
		stores_view = new ShoppingList.StoresView
		stores_view.render()
		expect(stores_view.$('button').text()).toBe('Add Store')