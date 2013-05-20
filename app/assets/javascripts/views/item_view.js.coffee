class ShoppingList.ItemView extends Backbone.View
  template_name: 'item'
  className: 'item'
  
  events:
    "click": "toggle_height"
    "click .done": "mark_done"
  
  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render(@model.attributes))
  
  toggle_height: (e)->
    child_of_item = $(e.target).parent().attr('class') == 'item'
    target_is_item = $(e.target).attr('class') == 'item'
    is_not_button = !$(e.target).is("button")
    
    if (target_is_item or (child_of_item and is_not_button))
      height = if @$el.height() == 40 then 85 else 40
      @$el.height(height)
  
  mark_done: (e)->
    @$el.css('background-color', 'rgb(255, 140, 32)')
    $(e.target).text('Undo');
    $(e.target).removeClass('done').addClass('undo');
  