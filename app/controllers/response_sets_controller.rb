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
        @response_set.send_time = Time.zone.now
        @response_set.sms_sent = false
        if @response_set.save 
            if @response_set.send_time <= Time.zone.now
                @response_set.send_sms
            end
            redirect_to response_set_path(@response_set)
        else
            redirect_to new_response_set_path(@response_set) 
        end
    
    
    
    
  end

  def show
      @response_set = ResponseSet.find(params[:id])
      @sms_sent_to = Response.where(response_set_id: params[:id])
  end

  def edit
  end
    
    private
    def response_sets_params
        params.require(:response_set).permit(:question_id, :period_id)    
    end
end


