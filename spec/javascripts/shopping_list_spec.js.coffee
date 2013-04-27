describe "ShoppingList", ->
	describe "ShoppingList#init()", ->
		beforeEach ->
			spyOn(Backbone.history, 'start')
			ShoppingList.init()

		it "starts the Backbone history", ->
			expect(Backbone.history.start).toHaveBeenCalled
		
		it "creates a router on initialization", ->
			expect(ShoppingList.router).not.toBeUndefined()
			expect(ShoppingList.router instanceof ShoppingList.Router).toBe(true)
				
	
