$(function(){

  function buildHtml(comment){
    var html = `<div class="comment-contents">
                    <a href=/users/${comment.user_id}>${comment.user_nickname}</a>
                    ：
                  ${comment.text}
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHtml(data);
      $('.comments').append(html)
      $('.comment-form').val('')
      
    })
    .fail(function(){
      alert('error');
    })
  })
});