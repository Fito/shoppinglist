class ShoppingList.StoreFormView extends Backbone.View
  className: 'store-form'
  template_name: 'store_form'
  events:
    'click #commit': 'create_store'
    'click .cancel': 'close_form'
  
  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render({}))
  
  create_store: ->
    store_name = @.$('#name').val()
    store = @collection.create({ name: store_name })
    store_view = new ShoppingList.StoreView model: store
    @$el.parent().append(store_view.render())
    @.remove()
  
  close_form: ->
    @.remove()
  
