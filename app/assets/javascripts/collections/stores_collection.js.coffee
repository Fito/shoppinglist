class ShoppingList.StoresCollection extends Backbone.Collection
  url: '/stores'
  model: ShoppingList.Store
  
  # parse: (response)=>
  #   _.each(response, (object)=>
  #     @.models.push(object)
  #   )
