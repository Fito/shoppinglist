$(function init(){
  $('div.item').click( function(){
    var self = $(this);
    if (self.height() < 78){
      self.height(78);
    } else {
      self.height(40);
    }
    
    $('div.item button.more-info').click( function(){
      var self = $(this);
      var url = 'items/' + self.parent().attr('id') + '.json';
      $.get(url, function(data){
        alert(data["description"]);
      });
    });
    
    $('div.item button.delete').click( function(){
      var self = $(this);
      var url = 'items/' + self.parent().attr('id') + '.json';
      var top = self.parent().offset().top;
      $('div.warning-message').show();
      $('div.warning-message').css('top', top);
      $('button.warning-yes').click( function(){
        $('div.warning-message').hide();
        self.parent().remove();
        $.ajax({ url: url, type: 'DELETE'});
      });
      $('button.warning-cancel').click( function(){
        $('div.warning-message').hide();
      })
    });

    $('div.item button.done').click( function(){
      var self = $(this);
      var text = $('h5', $(self.parent())).text();
      $('h5', $(self.parent())).html('<s>' + text + '</s>');
      self.parent().css('background-color', '#FF8C20');
      self.parent().css('border-color', '#FF8C20');
      self.html('Undo');
      self.removeClass('done').addClass('undo');
    });  
    
    
    $('div.item button.undo').click( function(){
      var self = $(this);
      var text = $('h5', $(self.parent())).text();
      $('h5', $(self.parent())).text(text);
      self.parent().css('background-color', '#F6FA9C');
      self.parent().css('border-color', '#F6FA9C');
      self.html('Done');
      self.removeClass('undo').addClass('done');
    });
  });  
});
