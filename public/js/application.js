$(document).ready(function() {
  $('input:checkbox.couple_photo').click(function(e){
    var currentId = e.target.name;
    if($(this).is(':checked')){
      $('td.'+currentId).removeClass('hidden');
    } else {
      $('td.'+currentId).addClass('hidden');
      $('td.'+currentId+' input').val("");
    }
    console.log(currentId);
  });

  var insertInfo = function(){
    var single_info = [];
    var couple_info = [];
    var allSingles = $("input.single_photo:checked")
    for(x=0; x<allSingles.length; x++){
      var single = allSingles[x];
      single = single;
      //NEEED TO FINISH THIS. RUNNING OUT OF TIIIIIiimmmmmeee...
    }
    $.ajax({
      type: 'post',
      url: '/insert_info',
      data: ({singles:couple_info,
              couples:single_info}),
      success: function(){
        console.log("success");
      },
      error: function(){
        console.log("error");
      }
    })
  }

  $('#done').click(function(){
    insert_info();
  });

  $('#next_100').click(function(){
    insert_info();
    var lastId = $('input:last').attr('class');
    var range = parseInt(lastId) + 100;
    document.location.href = "/get_pictures/"+lastId+"/"+range;
  });
});
