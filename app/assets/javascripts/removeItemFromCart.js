$(document).on("ready", function(){
  $(".remove").on("click", function(){
    var temp = $(this).attr("id")
    var num = parseInt(temp)
    console.log(num);

    $.ajax({
      url: "/remove_from_cart/" + num,
      method: "POST",
      dataType: "JSON",

    }).done(function(e){
      console.log(e);
      location.reload();
    }).fail(function(e){
      console.log(e);
    })
  })
})
