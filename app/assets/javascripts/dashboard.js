$(function init(){
  var moreInfoBtn = '<button class="more-info btn btn-info" name="button" type="submit">More info</button>'
  var doneBtn = '<button class="done btn btn-success" name="button" type="submit">Done</button>'
  var deleteBtn = '<button class="delete btn btn-danger" name="button" type="submit">Delete</button>'
  
  function itemsSetup(items){
    items.each( function(index){
      $(this).click( function(){
        var self = $(this);
        if (self.find('h5').text()) {
          if (self.height() < 78){
            self.height(78);
          } else {
            self.height(40);
          }        
        }
        
        $('button.done', $(this)).click( function(){
          var self = $(this);
          var text = $('h5', $(self.parent())).text();
          $('h5', $(self.parent())).html('<s>' + text + '</s>');
          self.parent().css('background-color', '#FF8C20');
          self.parent().css('border-color', '#FF8C20');
          self.html('Undo');
          self.removeClass('done').addClass('undo');
        });  

        $('button.undo', $(this)).click( function(){
          var self = $(this);
          var text = $('h5', $(self.parent())).text();
          $('h5', $(self.parent())).text(text);
          self.parent().css('background-color', '#F6FA9C');
          self.parent().css('border-color', '#F6FA9C');
          self.html('Done');
          self.removeClass('undo').addClass('done');
        });
      });

      $('button.more-info', $(this)).click( function(){
        var self = $(this);
        var parent = self.parent();
        var url = 'items/' + self.parent().attr('id') + '.json';
        $.get(url, function(data){
          self.parent().height(145);
          if ($('p', parent).text() != data["description"]) {
            self.parent().append('<p>' + data["description"] + '</p>')
          }
        });
      });

      $('button.delete', $(this)).click( function(){
        var self = $(this);
        var url = 'items/' + self.parent().attr('id') + '.json';
        var top = self.parent().offset().top;
        var left = self.parent().offset().left;
        $('div.warning-message').show();
        $('div.warning-message').css('top', top);
        $('div.warning-message').css('left', left + 50);
        $('button.warning-yes').click( function(){
          $('div.warning-message').hide();
          self.parent().remove();
          $.ajax({ url: url, type: 'DELETE'});
        });
        $('button.warning-cancel').click( function(){
          $('div.warning-message').hide();
        })
      });
    });
  }

  $('div.group button.add-item').click( function(){
    var self = $(this);
    var container = self.parent().parent();
    var newItem = $('<div class="item"></div>');
    container.append(newItem);
    newItem.height(220);
    container.focus();
    var url = "items/new";
    $.get(url, function(data) {
      var form = $(data)[2];
      newItem.html(form);
      $('div.item form #item_name').focus();
      $('div.item form div.actions input.btn').click( function(e){
        e.preventDefault();
        $.post("/items.json", {
          item: {
            name: $('div.item form #item_name').val(),
            description: $('div.item form #item_description').val()
          },
          store_name: ($('h3', newItem.parent()).text().slice(0, -1))
        }, function(data){
          newItem.html('<h5>' + data['name'] + '</h5>').append(moreInfoBtn + doneBtn + deleteBtn);
          newItem.attr('id', data['id']);
          newItem.height(40);
          itemsSetup(newItem);
        });
      });
    });    
  });
  
  itemsSetup($('div.item'));
});
