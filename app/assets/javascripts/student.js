$(function(){
    $('#student_phone_number').formatter({
      'pattern': '({{999}}) {{999}}-{{9999}}',
      'persistent': false
    });
    
    var shaker;
    var invalidCount = 0;
    
    $('input[type="submit"]').on('click', function(e){
        var strippedNum = $('#student_phone_number').val().replace(/\D/g, '');
        if($('#student_name').val().length == 0 || strippedNum.length < 10){
            $(e.currentTarget).blur();
            e.preventDefault();
            $('.main').addClass('shake');
            shaker = setTimeout(function(){
                $('.main').removeClass('shake');
            },400);
            invalidCount++;
            if(invalidCount>1){
                $('#err_msg').fadeIn(200);
            }
            return false;
        }
    })
});

