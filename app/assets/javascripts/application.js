


//= require jquery3
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require alert.js

$(function(){
  $(".delete").click(function(){
    var result = confirm('本当に削除しますか？');
    if(result){
    } else{
      return false;
    }
  });
});