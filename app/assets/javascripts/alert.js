$(function(){
  $(".delete").click(function(){
    var result = confirm('本当に削除しますか？');
    if(result){
      
    } else{
      return false;
    }
  });
});
