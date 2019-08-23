$(function(){

  $('body').on('click', '.delete_comment', function(){
    var url = $(this).attr('href')
    $.ajax({
      url: url,
      type: "DELETE",
      dataType: 'json',
    })
    .done(function(data){
      var comment_id = '#' + data.id
      $(comment_id).remove();

    })
    .fail(function(){
      alert('error');
    })
    return false;
  })
});