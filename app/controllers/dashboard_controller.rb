class DashboardController < ApplicationController
    before_action :authenticate_teacher!
    layout "app"
    
    def index
        @teacher = current_teacher        
    end
    
end
