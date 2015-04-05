var rs_ready = function(){
    
    //Sets Time Zone in a cookie for use on the server.
    if(!getCookie('jstz_time_zone')){
        var timeZone = jstz.determine();
        document.cookie = 'jstz_time_zone='+timeZone.name()+';';
    }
    
    
    var shaker;
    
    var picker = new Pikaday({ 
        field: $('.datepicker')[0], 
        format: 'MMM DD YYYY',
        minDate: new Date()
    });
    
    //Format time when they blur that input
    $('.timepicker').on('blur', function(){
        
        var inputTime = $(this).val();
        var m = moment();
        var t = moment(m.format('YYYY-MMM-DD') +' '+ inputTime);
        if(!t.isValid()){
            $(this).addClass('shake');
            shaker = setTimeout(function(){
                $('.timepicker').removeClass('shake');
            },400);   
        }
        $(this).val(t.format('h:mm a'));   
    });
    
    $('#send_now').on('change', function(){
        if($(this).is(':checked')){
            $('.timepicker, .datepicker').prop('disabled', true);
            var d = new Date();
            $('.datepicker').val(moment(d).format('ddd MMM DD YYYY'));
            $('.timepicker').val(moment(d).format('h:mm a'));
            $('.submit-new-slip').attr('value', 'Send Exit Slip');
        }else{
            $('.timepicker, .datepicker').prop('disabled', false);
            $('.submit-new-slip').attr('value', 'Schedule Exit Slip');
        }
    });
};

