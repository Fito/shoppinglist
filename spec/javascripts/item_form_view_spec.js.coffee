describe 'ShoppingList.ItemFormView', ->
  it 'renders a save button', ->
    store = new ShoppingList.Store
    item_form_view = new ShoppingList.ItemFormView model: store
    item_form_view.render()
    expect(item_form_view.$('input').last().val()).toBe('Save')
  
  describe "When save button is clicked", ->
    beforeEach ->
      store = new ShoppingList.Store
      @items_collection_prototype = ShoppingList.ItemsCollection.prototype
      @item_view_prototype = ShoppingList.ItemView.prototype
      spyOn(@item_view_prototype, 'initialize')
      spyOn(@item_view_prototype, 'render').andCallThrough()
      spyOn(@items_collection_prototype, 'create')
      @items_collection = new ShoppingList.ItemsCollection
      @item_form_view = new ShoppingList.ItemFormView model: store, collection: @items_collection
      @item_form_view.render()
      @item_form_view.$('#commit').trigger('click')
    
    it 'should create a item view', ->
      expect(@item_view_prototype.initialize).toHaveBeenCalled()
    
    it 'should create a new item for the collection', ->
      expect(@item_form_view.collection.create).toHaveBeenCalled()
