describe 'ShoppingList.StoresView', ->
	it 'renders a button', ->
    stores_view = new ShoppingList.StoresView
    stores_view.render()
    expect(stores_view.$('button').text()).toBe('Add Store')
  
	describe "When add store button is clicked", ->
    beforeEach ->
      @store_form_view_prototype = ShoppingList.StoreFormView.prototype
      @stores_collection_prototype = ShoppingList.StoresCollection.prototype
      spyOn(@stores_collection_prototype, 'initialize').andCallThrough()
      spyOn(@store_form_view_prototype, 'initialize').andCallThrough()
      spyOn(@store_form_view_prototype, 'render').andCallThrough()
      @stores_view = new ShoppingList.StoresView
      @stores_view.render()
      @stores_view.$('button').trigger('click')
    
    it 'creates a store form view', ->
      expect(@store_form_view_prototype.initialize).toHaveBeenCalled()
    
    it 'renders a store form view', ->
      expect(@store_form_view_prototype.render).toHaveBeenCalled()
      expect(@stores_view.$('.store-form').length).toBe(1)
    
    it 'creates a stores collection', ->
      expect(@stores_collection_prototype.initialize).toHaveBeenCalled()
    
  
