$(document).ready(function(){
  
  var tags = [];

  // Loading Tags
  $.ajax({
    url: "http://localhost:8080/tags.json",
    type: "get",
    success: function(response){
      tags = response;
      tags.forEach(function(tag){
        $('#tags').append('<option value=' + tag["id"] + '>' + tag["name"] + '</option>');
      });
    }
  });

  // Retrieving Questions
  $('#any').click(function(){
    
    tagNames = [];

    $.each($('.label.transition'), function(index, element){
      tagNames.push(element.innerText);
    });

    $.ajax({
      url: "http://localhost:8080/tags/question_filter.json?tag_name=" 
           + tagNames.join(",") + "&type=any",
      type: "GET",
      success: function(response){

        $('#questionTable').DataTable({
          destroy: true,
          data: response,
          columns: [
            {'data' : 'title'},
            {'data' : 'body'},
          ]
        });
        $("#table").show();

      }
    });

  });

});