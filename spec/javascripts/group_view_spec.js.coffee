describe 'ShoppingList.GroupView', ->
	beforeEach ->
		group = new ShoppingList.Group { name: 'Group1' }
		@group_view = new ShoppingList.GroupView model: group
	
	it "renders the right data", ->
		@group_view.render()
		expect(@group_view.$el.text()).toContain('Group1')
	
	it "renders the right template", ->
		@group_view.render()
		expect(@group_view.$('h1').length).toBe(1)
		expect(@group_view.$('button').length).toBe(1)
