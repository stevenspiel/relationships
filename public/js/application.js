$(document).ready(function() {
  $('input:checkbox.couple_photo').click(function(e){
    var currentId = e.target.name;
    if($(this).is(':checked')){
      $('td.'+currentId).removeClass('hidden');
    } else {
      $('td.'+currentId).addClass('hidden');
      $('td.'+currentId+' input').val("");
    }
  });

  var insertInfo = function(){
    var singleInfo = [];
    var coupleInfo = [];
    var allSingles = $("input.single_photo:checked")
    allSingles.each(function(i){
      var id = allSingles[i].value
      singleInfo.push({
        id:id,
        url: "https://graph.facebook.com/"+id+"/picture?type=large"
      });
    });
    var allCouples = $("input.couple_photo:checked");
    allCouples.each(function(i){
      console.log(i);
      console.log(allCouples[i]);
      var id = allCouples[i].name;
      console.log(id);
      var selfUrl = $("input:text."+id)[0].value;
      var partnerUrl = $("input:text."+id)[1].value;
      coupleInfo.push({
        id:id,
        selfUrl:selfUrl,
        partnerUrl:partnerUrl,
        couplePicUrl: "https://graph.facebook.com/"+id+"/picture?type=large"
      })
    });
    console.log(singleInfo);
    console.log(coupleInfo);
    $.ajax({
      type: 'post',
      url: '/insert_info',
      data: ({singles:singleInfo,
              couples:coupleInfo}),
      success: function(){
        console.log("success");
      },
      error: function(){
        console.log("error");
      }
    });
  }

  $('#done').click(function(){
    insertInfo();
  });

  $('#next_100').click(function(){
    insertInfo();
    var lastId = $('input:last').attr('class');
    var range = parseInt(lastId) + 100;
    document.location.href = "/get_pictures/"+lastId+"/"+range;
  });
});
