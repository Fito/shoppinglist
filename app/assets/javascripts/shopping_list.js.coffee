window.ShoppingList =
	Models : {}
	Collections : {}
	Views : {}
	init: ->
		stores_view = new ShoppingList.StoresView
		stores_view.render()
		$('#app').html(stores_view.el)
	
$(document).ready -> 
	ShoppingList.init()
