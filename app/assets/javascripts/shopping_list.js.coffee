window.ShoppingList =
	Models : {}
	Collections : {}
	Views : {}
	init: ->
		collection = new ShoppingList.StoresCollection  
		stores_view = new ShoppingList.StoresView collection: collection
		stores_view.render()
		$('#app').html(stores_view.el)
	
$(document).ready ->
  if $('body').hasClass('home')
	  ShoppingList.init()
