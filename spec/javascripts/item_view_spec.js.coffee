describe 'ShoppingList.ItemFormView', ->
  beforeEach ->
    @item = new ShoppingList.Item name: 'my item'
    @item_view = new ShoppingList.ItemView model: @item
    @item_view.render()
  
  it 'expands and contracts when clicked on', ->
    @item_view.$el.height(40)
    @item_view.$el.trigger('click')
    expect(@item_view.$el.height()).toBe(85)
    @item_view.$el.trigger('click')
    expect(@item_view.$el.height()).toBe(40)
  
  it 'renders a done button', ->
    expect(@item_view.$('button.done').text()).toBe('Done')
  
  it 'renders a more-info button', ->
    expect(@item_view.$('button.more-info').text()).toBe('More info')
  
  it 'renders a delete button', ->
    expect(@item_view.$('button.delete').text()).toBe('Delete')
  
  describe "When done button is clicked", ->
    it 'should change the item background color', ->
      spyOn(@item_view.$el, 'css').andCallThrough()
      @item_view.$('.done').trigger('click')
      expect(@item_view.$el.css).toHaveBeenCalledWith('background-color', 'rgb(255, 140, 32)')
      
    it 'should replace the done button by an undo button', ->
      @item_view.$('.done').trigger('click')
      expect(@item_view.$('button.undo').text()).toBe('Undo')
    
    describe "When undo button is clicked", ->
      it 'should change the item background color', ->
        spyOn(@item_view.$el, 'css').andCallThrough()
        @item_view.$('.done').trigger('click')
        @item_view.$('.undo').trigger('click')
        expect(@item_view.$el.css).toHaveBeenCalledWith('background-color', '#F6FA9C')

      it 'should replace the done button by an undo button', ->
        @item_view.$('.done').trigger('click')
        @item_view.$('.undo').trigger('click')
        expect(@item_view.$('button.done').text()).toBe('Done')
      