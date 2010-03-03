$(function(){
  // index.haml
  $('#bind_dn').addClass('suggestion_text');
  $('#bind_dn').bind('focus', function(){
    $('#bind_dn').attr({value: ''});
    $('#bind_dn').removeClass('suggestion_text');
  });

  $('#host').hide();
  $('#connection_type').bind('change', function(){
    $('#hostname').attr({value: ''});
    $('#host').toggle();
  });
  
  // Tree
  $('.get_entries').bind('click', function(){
    console.log(this.name);
    $.get('/get_sub_entries.json',{dn : this.name}, function(data){
      console.log(data);  
    });
  });


});
