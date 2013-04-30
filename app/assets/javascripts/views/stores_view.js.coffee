class ShoppingList.StoresView extends Backbone.View
	className: 'stores'
	template_name: 'stores'
	events:
	  'click #add-store': 'show_new_form'
	
	template: ->
		HoganTemplates[@template_name]
	
	render: ->
		@$el.html(@template().render({}))
	
	show_new_form: (event)->
	  collection = new ShoppingList.StoresCollection
	  form_view = new ShoppingList.StoreFormView collection: collection
	  @$el.append(form_view.render())
	
