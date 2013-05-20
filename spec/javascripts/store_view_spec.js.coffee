describe 'ShoppingList.StoreView', ->
  beforeEach ->
    @store_view_prototype = ShoppingList.StoreView.prototype
    @model = new ShoppingList.Store
    @store_view = new ShoppingList.StoreView model: @model
    @store_view.render()
    
  it "renders the store's name", ->
    expect(@store_view.$('h3').length).toBe(1)
  
  it 'renders an add button', ->
    expect(@store_view.$('button.add-item').text()).toBe('+ item')

  it 'renders a delete button', ->
    expect(@store_view.$('button.delete-store').text()).toBe('x')
  
  describe 'When the Add Item button is clicked', ->
    beforeEach ->
      @item_prototype = ShoppingList.Item.prototype
      @item_form_view_prototype = ShoppingList.ItemFormView.prototype
      spyOn(@item_prototype, 'initialize')
      spyOn(@item_form_view_prototype, 'initialize')
      spyOn(@item_form_view_prototype, 'render').andCallThrough()
      @store_view.$('button.add-item').trigger('click')
      
    it 'creates a new item form view', ->
      expect(@item_form_view_prototype.initialize).toHaveBeenCalled()
    
    it 'renders a new item form view', ->
      expect(@store_view.$('.item-form-container .item-form').length).toBe(1)      
    
  
  describe 'When the Delete button is clicked', ->
    beforeEach ->
      store_prototype = ShoppingList.Store.prototype
      spyOn(@store_view_prototype, 'remove')
      spyOn(store_prototype, 'destroy')
      @store_view.$('button.delete-store').trigger('click')
    
    it 'removes itself', ->
      expect(@store_view.remove).toHaveBeenCalled()
    
    it 'deletes the store', ->
      expect(@store_view.model.destroy).toHaveBeenCalled()

    