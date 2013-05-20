class ShoppingList.StoresView extends Backbone.View
  className: 'stores'
  template_name: 'stores'
  
  events:
    'click #add-store': 'show_new_form'
  
  initialize: ->
    @collection.fetch({success: @render_stores_views})

  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render({}))
  
  show_new_form: (event)->
    form_view = new ShoppingList.StoreFormView collection: @collection
    @$('#add-store-form').html(form_view.render())
  
  render_stores_views: =>
    _.each(@collection.models, (store)=>
      store_view = new ShoppingList.StoreView model: store
      @$el.append(store_view.render())
    ) 
  
