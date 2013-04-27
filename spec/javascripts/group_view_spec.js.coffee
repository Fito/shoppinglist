describe 'ShoppingList.GroupView', ->
	it "has the right template", ->
		group_view = new ShoppingList.GroupView
		expect(group_view.template).not.toBeUndefined()
		expect(group_view.template).toBe('group.mustache')
	
	it "has the right model", ->
		group = new ShoppingList.Group
		group_view = new ShoppingList.GroupView model: group
		expect(group_view.model instanceof ShoppingList.Group).toBe(true)
	
	it "renders the right data", ->
		group = new ShoppingList.Group
		group_view = new ShoppingList.GroupView model: group
		group_view.render()
		expect(group_view.el).toContain()
	
