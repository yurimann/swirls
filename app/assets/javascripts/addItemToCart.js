$(document).on("ready", function(){
  $(".add").on("click", function(e){
    e.stopPropagation();
    e.preventDefault();
    var temp = $(this).siblings();
    var cost = temp.attr("value");
    var item = $(this).siblings("input").val();
    var quantity = temp.select().val();
    console.log(quantity);
    console.log(item);

    $.ajax({
      url: "/add",
      method: "POST",
      dataType: "JSON",
      data: {"product_id": item, "quantity": quantity}
    }).done(function(e){
      console.log(e);
      location.reload()
    }).fail(function(e){
      console.log(e);
    })
  });

  $(".clear").on("click", function(){
    $.ajax({
      url: "/clear",
      method: "POST",
      dataType: "JSON"
    }).done(function(e){
      console.log(e);
      location.reload();
    })
  })
})
