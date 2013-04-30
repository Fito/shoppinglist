class ShoppingList.StoreView extends Backbone.View
  template_name: 'store'
  className: 'store'
  
  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render(@model))
  

