window.ShoppingList =
	Models : {}
	Collections : {}
	Views : {}
	init: ->
   	@router = new ShoppingList.Router;
   	Backbone.history.start();


$(document).ready -> 
	ShoppingList.init()
