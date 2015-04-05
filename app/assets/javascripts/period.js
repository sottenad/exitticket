$(function(){
    $('.studentLock i.lock').on('click', toggleLock);
});

var toggleLock = function(e){
    var studentId = $(e.currentTarget).parents('tr').attr('data-student-id');
    $.ajax({
        url: '/students/'+studentId+'/lock',
        type: 'PUT',
        dataType: 'json',
        success: function(data){
            updateLockUI(e, data.locked);            
        },
        error: function(xhr, status, err){
            console.log('Error',err);   
        }
    });
    
}




var updateLockUI = function(e,locked){
    if(locked){
        $(e.currentTarget).addClass('fa-lock').removeClass('fa-unlock');
    }else{
        $(e.currentTarget).addClass('fa-unlock').removeClass('fa-lock');   
    }
}