class DashboardController < ApplicationController
    before_action :authenticate_teacher!
    layout :app_layout
    
    def index
        @teacher = current_teacher        
    end
    
end
