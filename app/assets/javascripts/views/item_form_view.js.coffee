class ShoppingList.ItemFormView extends Backbone.View
  className: 'item-form'
  template_name: 'item_form'
  
  events:
    'click #commit': 'create_item'
    'click .cancel': 'close_form'

  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render())

  create_item: ->
    item_name = @.$('#item-name').val()
    item = @collection.create({'name': item_name, 'store_id': @model.id })
    item_view = new ShoppingList.ItemView model: item
    @.remove()
  
  close_form: ->
    @.remove()
  
