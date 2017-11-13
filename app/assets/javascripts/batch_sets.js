$(document).ready(function(){
  
  var tags = [];

  $.ajax({
    url: "http://72db3440.ngrok.io/tags.json",
    type: "get",
    success: function(response){
      tags = response;
      tags.forEach(function(tag){
        $
      });
      console.log(response);
    }
  });
});

// $('#any').click(function(){
//   $.ajax({
//     url: "http://compilez.herokuapp.com/home/input",
//     type: "get",
//     data: {
//       content: sent,
//       extension: lang
//     },
//     success: function(response){
//       result.setOption("value", response["response"]);
//     }
//   });
// });