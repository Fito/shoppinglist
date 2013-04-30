describe 'ShoppingList.StoreView', ->
  beforeEach ->
    @store_view = new ShoppingList.StoreView
    @store_view.render()
    
  it "renders the store's name", ->
    expect(@store_view.$('h3').length).toBe(1)
  
  it 'renders a button', ->
    expect(@store_view.$('button').text()).toBe('+')
  
  describe 'When the button is clicked', ->
    it 'creates a new item view'
  

    