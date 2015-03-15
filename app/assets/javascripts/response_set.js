var rs_ready = function(){
    $('.datetimepicker').fdatepicker();
};


//Hack for turbolinks
$(document).ready(rs_ready);
$(document).on('page:load', rs_ready);