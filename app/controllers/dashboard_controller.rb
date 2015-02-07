class DashboardController < ApplicationController
    before_action :authenticate_teacher!
    
    def index
        @teacher = current_teacher
        
    end
    
end
