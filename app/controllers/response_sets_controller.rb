class ResponseSetsController < ApplicationController
    before_action :authenticate_teacher!
    layout 'app'
    
  def index
      
  end

  def new
      @response_set = ResponseSet.new
      @questions = Question.all
      @periods = Period.all
      
  end
    
  def create
        @response_set = ResponseSet.new()
        @response_set.period_id = response_sets_params[:period_id]
        @response_set.question_id = response_sets_params[:question_id]
        
        d = Date.strptime(response_sets_params[:send_time_date], "%a %b %d %Y")
        t = DateTime.strptime(response_sets_params[:send_time_time], "%I:%M %p")
        dt = DateTime.new(d.year, d.month, d.day, t.hour, t.min, 0, t.zone)
        puts dt
        
        #@response_set.send_time = Time.zone.now
        @response_set.sms_sent = false
        #if @response_set.save 
            #Send it immediately 
            if @response_set.send_time <= Time.zone.now
                #@response_set.send_sms
            end
            redirect_to response_set_path(@response_set)
        #else
            
            #redirect_to new_response_set_path(@response_set) 
        #end
 
  end

  def show
      @response_set = ResponseSet.find(params[:id])
      @valid_responses = @response_set.responses.order('response_time DESC').where('response_time is not null')
      @invalid_responses = @response_set.responses.where('response_time is null');
  end

  def edit
  end
    
    def average
        @response_set = ResponseSet.find(params[:id]);        
        @avg = @response_set.average_response_score();
        render json: @avg.to_json
    end
    
    private
    def response_sets_params
        params.require(:response_set).permit(:question_id, :period_id, :send_time_date, :send_time_time)    
    end
end


