class ShoppingList.ItemView extends Backbone.View
  template_name: 'item'
  className: 'item'
  
  events:
    "click": "toggle_height"
    "click .btn.done": "mark_done"
    "click .undo": "mark_undone"
  
  template: ->
    HoganTemplates[@template_name]
  
  render: ->
    @$el.html(@template().render(@model.attributes))
    if @model.get('done')
      @$el.addClass('done')
      @scratch()
      @set_undo_button()
    @$el
  
  toggle_height: (e)->
    child_of_item = @$el.has($(e.target))
    target_is_item = $(e.target).hasClass('item')
    
    if (target_is_item or child_of_item)
      height = if @$el.height() == 45 then 85 else 45
      @$el.animate({height: height}, 'fast')
    
  mark_done: (e)->
    @scratch()
    @$el.addClass('done')
    @set_undo_button()
    @model.save({done: true})
  
  mark_undone: (e)->
    @unscratch()
    @$el.removeClass('done')
    @set_done_button()
    @model.save({done: false})
  
  scratch: ->
    @.$('h5').html("<s>#{@model.get('name')}</s>")
  
  unscratch: ->
    @.$('h5').html("#{@model.get('name')}")
  
  set_done_button: ->
    undo_button = @.$('.btn.undo')
    undo_button.text('Done')
    undo_button.removeClass('undo').addClass('done')
    
  set_undo_button: ->
    done_button = @.$('.btn.done')
    done_button.text('Undo')
    done_button.removeClass('done').addClass('undo')
  

  