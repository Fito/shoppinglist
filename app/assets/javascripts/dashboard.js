$(function init(){
  $('div.item h5').click( function(){
    var self = $(this);
    if (self.parent().height() < 78){
      self.parent().height(78);
    } else {
      self.parent().height(40);
    }
  });
  
  $('div.item button.more-info').click( function(){
    var self = $(this);
    var url = 'items/' + self.attr('id') + '.json'
    $.get(url, function(data){
      alert(data["description"]);
    });
  });
});
