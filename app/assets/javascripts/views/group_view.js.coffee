class ShoppingList.GroupView extends Backbone.View
	template_name: 'group'
	className: 'group'
		
	template: ->
		HoganTemplates[@template_name]
	
	render: ->
		@$el.html(@template().render(@model.toJSON()))
	
