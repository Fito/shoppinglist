class ShoppingList.StoreView extends Backbone.View
  template_name: 'store'
  className: 'store'
  
  events:
    'click .delete-store' : 'delete_store'
    'click .add-item' : 'add_item'
  
  initialize: ->
    @collection ||= new ShoppingList.ItemsCollection
    @collection.fetch({success: @render_items_views})
  
  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @.listenTo(@collection, 'change', @render_items_views);
    @$el.html(@template().render(@model.attributes))
  
  render_items_views: =>
    @.$('.items-container').html(' ')
    _.each(@collection.where(store_id: @model.id), (item)=>
      item_view = new ShoppingList.ItemView model: item
      @.$('.items-container').append(item_view.render())
    )
  
  delete_store: ->
    @.remove()
    @model.destroy()
    
  add_item: ->
    item_form = new ShoppingList.ItemFormView model: @model, collection: @collection
    @.$('.item-form-container').html(item_form.render())
    
      