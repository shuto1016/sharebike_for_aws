$(function(){

  function buildHtml(comment){
    var html = `<div class="comment-contents" id="${comment.id}">
                  <div class="main-contents no-padding">
                    <div class="main-contents__name">
                      <a href=/users/${comment.user_id}>${comment.user_nickname}</a>
                      ：
                    </div>
                    <div class="main-contents__text col l10 s9 no-padding">
                      ${comment.text}
                    </div>
                  </div>
                  <div class="sub-contents">
                    ${comment.updated_at}
                    &nbsp;&nbsp;
                    <a class="delete_comment" data-method="delete" href=/blogs/${comment.id}/comments>削除する</a>
                  </div>
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