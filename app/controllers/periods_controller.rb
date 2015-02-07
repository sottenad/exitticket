class PeriodsController < ApplicationController

    def index
       @teacher = current_teacher
       @periods =  @teacher.periods
    end
    
    def new
       @period = Period.new 
    end
    
    def create
        period = Period.new(period_params)
        period.teacher = current_teacher
        period.shortcode = Period.create_shortcode
        period.save
        redirect_to periods_path
    end
    
    private
    def period_params
        params.require(:period).permit(:title, :number)    
    end

end
