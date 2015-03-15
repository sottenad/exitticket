var exitslip = exitslip || {};
var dashboard = function(){
    
    var responseCount = 0;
    var latestId = $('.callout').eq(0).attr('data-exitslip-id');
    
    //Long Polling
    var viewModel = function(){
        var self = this;
        self.completeResponses = ko.observableArray([]);
        self.incompleteResponses = ko.observableArray([]);
        self.averageScore = ko.observable();
        self.formattedName = ko.computed(function() {
            return self.completeResponses().length == 1 ? '1 Response' : self.completeResponses().length + " Responses";
        }, self);
        self.hasCompleteResponses = ko.computed(function(){
            return self.completeResponses().length > 0 ? 1 : 0;
        }, self);
    };
    var first = true;
    var updateResponses = function(){
        $.ajax({
            url: '/exitslip/'+latestId+'.json',
            success: function(d){
                //Update with new data if we have a change in the completed value
                if(first || exitslip.percentCompleteChart.segments[0].value != d.complete.length){
                    first = false;
                    vm.completeResponses(d.complete);
                    vm.incompleteResponses(d.incomplete);
                    $('.starrr').starrr();
                    
                    
                    //Update Chart
                    exitslip.percentCompleteChart.segments[0].value = d.complete.length;
                    exitslip.percentCompleteChart.segments[1].value = d.incomplete.length;
                    exitslip.percentCompleteChart.update();
                }
            }
        });
    }
    
    var updateAverageScore = function(){
        $.getJSON('/exitslip/'+latestId+'/average', function(d){
            vm.averageScore(d.average_score);
        });
    }
    
    var interval = setInterval(updateResponses, 5000);
    
    //Need to make and return the ViewModel for computables to work
    var vm = new viewModel();
    ko.applyBindings(vm);
    
    updateAverageScore();
    updateResponses();
    
    return {
        updateAverageScore: updateAverageScore   
    }
};


function initStarrr(){
    console.log('init');
    $('body').on('click', '.starrr', function(){ $(this).addClass('selected') })
    .on('starrr:change', function(e, value){
        console.log('changed');
        var respId = $(e.target).attr('data-id');
        $.ajax({
          url: '/response/rating/'+ respId + '/' +value,
          success: function(){
            //Do nothing  
              exitslip.vm.updateAverageScore();
          },
          error: function(){
            //TODO: log error.
          }
        })
    });    
}


$(function(){
  //need to fire on doc ready for graphing stuff that needs the Dom.
  if( $('.dashboard.index, .response_sets.show').length > 0){
      
    exitslip.vm = new dashboard();
    
    initStarrr();  
      
    var ctx = document.getElementById("responsePercent").getContext("2d");
    ctx.canvas.width = 200;
    ctx.canvas.height = 200;
    var colorVal = $('a').css('color');
    var data = [
        {value:0, color: '#008CBA'},
        {value:5, color: '#eeeeee'}
    ]
    
    exitslip.percentCompleteChart = new Chart(ctx).Doughnut(data,{
        'percentageInnerCutout':80,
        animationSteps: 15,
        animationEasing: "easeOutQuart",
        showTooltips: false,
        responsive:true,
        showSegmentStroke: false,
        onAnimationComplete: function() {
            var canvasWidthvar = $('#responsePercent').width();
            var canvasHeight = $('#responsePercent').height();
            var constant = 150;
            var fontsize = (canvasHeight/constant).toFixed(2);
            ctx.font=fontsize +"em 'Open Sans'";
            ctx.textBaseline="middle"; 
            var total = 0;
            var string = "0 Students";
            var complete = exitslip.percentCompleteChart.segments[0].value;
            if (complete > 0){
                var string = complete 
                if(complete == 1){ 
                    string += ' Response';
                }else{
                    string += ' Responses';     
                }
            }
            var totalStudents = exitslip.percentCompleteChart.segments[1].value + exitslip.percentCompleteChart.segments[0].value;
            var totalStr;
            if (totalStudents == 1){
                totalStr = 'Out of 1 Student';
            }else{
                totalStr = 'Out of '+ totalStudents + ' Students';
            }
            var textWidth = ctx.measureText(string).width;
            var txtPosx = Math.round((canvasWidthvar - textWidth)/2);
            ctx.fillStyle = '#333333';
            ctx.fillText(string, txtPosx, canvasHeight/2 - ((fontsize*16)/2));
            ctx.font = fontsize*0.6+'em Open Sans';
            textWidth = ctx.measureText(totalStr).width;
            txtPosx = Math.round((canvasWidthvar - textWidth)/2);
            ctx.fillText(totalStr, txtPosx, canvasHeight/2 + ((fontsize*16) * 0.7));
            console.log('on');
        }
    });  
  }
});



