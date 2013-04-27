// $(function init(){
//   var moreInfoBtn = '<button class="more-info btn btn-info" name="button" type="submit">More info</button>'
//   var doneBtn = '<button class="done btn btn-success" name="button" type="submit">Done</button>'
//   var deleteBtn = '<button class="delete btn btn-danger" name="button" type="submit">Delete</button>'
//   var cancelBtn = '<button class="cancel btn btn-danger" name="button" >Cancel</button>'
//   
//   function itemsSetup(items){
//     items.each( function(index){
//       $('h5', $(this)).click( function(){
//         var self = $(this);
//         var container = self.parent();
//         if (self.text()) {
//           if (container.height() < 78){
//             container.animate({height: '78'}, 'fast');
//           } else {
//             container.animate({height: '40'}, 'fast');
//           }        
//         }
//       });
//             
//       function bindBtnDone(item){
//         $('button.done', $(item)).click( function(){
//           var self = $(this);
//           var text = $('h5', $(self.parent())).text();
//           $('h5', $(self.parent())).html('<s>' + text + '</s>');
//           self.parent().css('background-color', '#FF8C20');
//           self.parent().css('border-color', '#FF8C20');
//           self.html('Undo');
//           self.removeClass('done').addClass('undo');
//           bindBtnUndo(self.parent());
//         });
//       }  
//       
//       function bindBtnUndo(item){
//         $('button.undo', $(item)).click( function(){
//           var self = $(this);
//           var text = $('h5', $(self.parent())).text();
//           $('h5', $(self.parent())).text(text);
//           self.parent().css('background-color', '#F6FA9C');
//           self.parent().css('border-color', '#F6FA9C');
//           self.html('Done');
//           self.removeClass('undo').addClass('done');
//           bindBtnDone(self.parent());
//         });
//       }
//       
//       function bindBtnMoreInfo(item){
//         $('button.more-info', $(item)).click( function(event){
//           var self = $(this);
//           var parent = self.parent();
//           var url = 'items/' + self.parent().attr('id') + '.json';
//           $.get(url, function(data){
//             parent.animate({height: '145'}, 'fast');
//             if ($('p', parent).text() != data["description"]) {
//               self.parent().append('<p>' + data["description"] + '</p>')
//             }
//           });
//           self.html('Less info');
//           self.removeClass('more-info').addClass('less-info');
//           $(this).unbind(event);
//           bindBtnLessInfo(self.parent());
//         });
//       }
//       
//       function bindBtnLessInfo(item){
//         $('button.less-info', $(item)).click( function(event){
//           var self = $(this);
//           var parent = self.parent();
//           parent.animate({height: '78'}, 'fast');
//           $('p', parent).remove();
//           self.html('More info');
//           self.removeClass('less-info').addClass('more-info');
//           $(this).unbind(event);
//           bindBtnMoreInfo(self.parent());
//         });
//       }  
//       
//       
//       bindBtnDone($(this));
//       bindBtnUndo($(this));      
//       bindBtnMoreInfo($(this));
//       bindBtnLessInfo($(this));
// 
//       $('button.delete', $(this)).click( function(){
//         var self = $(this);
//         var url = 'items/' + self.parent().attr('id') + '.json';
//         var top = self.parent().offset().top;
//         var left = self.parent().offset().left;
//         $('div.warning-message').show();
//         $('div.warning-message').css('top', top);
//         $('div.warning-message').css('left', left + 50);
//         $('button.warning-yes').click( function(){
//           $('div.warning-message').hide();
//           self.parent().remove();
//           $.ajax({ url: url, type: 'DELETE'});
//         });
//         $('button.warning-cancel').click( function(){
//           $('div.warning-message').hide();
//         })
//       });
//     });
//   }
// 
//   function storesSetup(){
//     $('div.group button.add-item').click( function(){
//       var self = $(this);
//       var container = self.parent().parent();
//       var newItem = $('<div class="item"></div>');
//       var url = "items/new";
//       $.get(url, function(data) {
//         container.append(newItem);
//         newItem.animate({height: '220'}, 'fast');
//         var form = $($(data)[2]);
//         form.find('div.actions').append(cancelBtn);
//         newItem.html(form);
//         $('div.item form #item_name').focus();
//         $('html, body').animate({scrollTop: $('div.item form #item_name').offset().top - 25}, 'fast');
//         $('div.item form div.actions button.cancel').click( function(e){
//           e.preventDefault();
//           newItem.remove();
//         });
//       
//         $('div.item form div.actions input.btn').click( function(e){
//           e.preventDefault();
//           $.post("/items.json", {
//             item: {
//               name: $('div.item form #item_name').val(),
//               description: $('div.item form #item_description').val()
//             },
//             store_name: ($('h3', newItem.parent()).text().slice(0, -1))
//           }, function(data){
//             newItem.html('<h5>' + data['name'] + '</h5>').append(moreInfoBtn + doneBtn + deleteBtn);
//             newItem.attr('id', data['id']);
//             newItem.animate({height: '40'}, 'fast');
//             itemsSetup(newItem);
//           });
//         });
//       });    
//     });
//   }
//   
//   function groupSetup(){
//     $('div.group button.add-store').click( function(){
//       var self = $(this);
//       var container = self.parent().parent();
//       var storesContainer = $('div.stores', container);
//       var newItem = $('<div class="store"></div>');
//       var url = "stores/new";
//       $.get(url, function(data) {
//         storesContainer.append(newItem);
//         newItem.animate({height: '220'}, 'fast');
//         var form = $($(data)[2]);
//         form.find('div.actions').append(cancelBtn);
//         newItem.html(form);
//         $('div.store form #store_name').focus();
//         $('div.store form div.actions button.cancel').click( function(e){
//           e.preventDefault();
//           newItem.remove();
//         });
//       
//         $('div.store form div.actions input.btn').click( function(e){
//           e.preventDefault();
//           $.post("/items.json", {
//             item: {
//               name: $('div.item form #item_name').val(),
//               description: $('div.item form #item_description').val()
//             },
//             store_name: ($('h3', newItem.parent()).text().slice(0, -1))
//           }, function(data){
//             newItem.html('<h5>' + data['name'] + '</h5>').append(moreInfoBtn + doneBtn + deleteBtn);
//             newItem.attr('id', data['id']);
//             newItem.animate({height: '40'}, 'fast');
//             itemsSetup(newItem);
//           });
//         });
//       });    
//     });
//   }
//   itemsSetup($('div.item'));
//   storesSetup();
//   groupSetup();
// });
