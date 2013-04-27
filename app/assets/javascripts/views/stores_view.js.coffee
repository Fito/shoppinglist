class ShoppingList.StoresView extends Backbone.View
	className: 'stores'
	template_name: 'stores'
	
	template: ->
		HoganTemplates[@template_name]
	
	render: ->
		@$el.html(@template().render({}))
	
