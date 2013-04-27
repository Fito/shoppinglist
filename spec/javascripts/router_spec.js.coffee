describe "ShoppingList.Router", ->
	beforeEach ->
		@router = new ShoppingList.Router
		spyOn(ShoppingList.ItemsCollection.prototype, 'initialize')
	
	describe "routes", ->
		it "routes root to index", ->
			expect(@router.routes["/"]).toEqual("/index")
		
	describe "#index()", ->
		it "creates a new collection of items", ->
			@router.index()
			expect(ShoppingList.ItemsCollection.initialize).toHaveBeenCalled
		
		# it "renders the groups view", ->
		# 	@router.index()
		# 	expect(ShoppingList.GroupView.initialize).toHaveBeenCalled

	

		
		