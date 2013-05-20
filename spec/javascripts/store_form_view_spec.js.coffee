describe 'ShoppingList.StoreFormView', ->
  it 'renders a save button', ->
    store_form_view = new ShoppingList.StoreFormView
    store_form_view.render()
    expect(store_form_view.$('input').last().val()).toBe('Save')
  
  describe "When save button is clicked", ->
    beforeEach ->
      @store_collection_prototype = ShoppingList.StoresCollection.prototype
      @store_view_prototype = ShoppingList.StoreView.prototype
      spyOn(@store_view_prototype, 'initialize')
      spyOn(@store_view_prototype, 'render')
      spyOn(@store_collection_prototype, 'create')
      @stores_collection = new ShoppingList.StoresCollection
      @store_form_view = new ShoppingList.StoreFormView collection: @stores_collection
      @store_form_view.render()
      @store_form_view.$('#commit').trigger('click')
    
    it 'should create a store view', ->
      expect(@store_view_prototype.initialize).toHaveBeenCalled()
    
    it 'should render the new view', ->
      expect(@store_view_prototype.render).toHaveBeenCalled()
    
    it 'should create a new store for the collection', ->
      expect(@store_form_view.collection.create).toHaveBeenCalled
