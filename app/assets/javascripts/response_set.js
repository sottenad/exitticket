var rs_ready = function(){
    $('.datetimepicker').fdatepicker();
    $('.starrr').on('click', function(){ $(this).addClass('selected') });
    $(".starrr").starrr().on('starrr:change', function(e, value){
        var respId = $(e.currentTarget).attr('data-id');
        $.ajax({
          url: '/response/rating/'+ respId + '/' +value,
          success: function(){
            //Do nothing    
          },
          error: function(){
            //TODO: log error.
          }
        })
    });
};


//Hack for turbolinks
$(document).ready(rs_ready);
$(document).on('page:load', rs_ready);