class DashboardController < ApplicationController
    before_action :authenticate_teacher!
    layout "app"
    
    def index
        @teacher = current_teacher
        periods = current_teacher.periods
        @exitslips = ResponseSet.where(period_id: periods)
    end
    
end
