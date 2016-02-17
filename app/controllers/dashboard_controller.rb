class DashboardController < ApplicationController
    before_action :authenticate_teacher!
    layout "application"
    
    def index
        @teacher = current_teacher
        @periods = current_teacher.periods
        @exitslips = ResponseSet.where(period_id: @periods)
        @exitslips_count = @exitslips.count
        @complete_response_count = 0;
        @total_response_count = 0;
        @exitslips.each do |e|
            @complete_response_count += e.complete_responses.count
            @total_response_count += e.responses.count
        end
        perc = (@complete_response_count.to_f / @total_response_count.to_f)*100
        @completion_percentage = perc.round
        
        @new_responses = Response.where('response_set_id in (?) and response_time > ?', @exitslips.select('id'), current_teacher.last_sign_in_at)
        
        @firstrun = @exitslips_count == 0
        
    end
    
end
