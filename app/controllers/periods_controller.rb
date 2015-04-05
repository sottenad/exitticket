class PeriodsController < ApplicationController
    before_action :authenticate_teacher!
    layout "app"
    
    def index
       @teacher = current_teacher
       @periods =  @teacher.periods.order('periods.number ASC')
    end
    
    def new
       @period = Period.new 
    end
    
    def show
        @student = Student.new
        @period = Period.find(params[:id])
        @students = @period.students
    end
    
    def edit 
        @period = Period.find(params[:id])    
    end
    
    def update
        @period = Period.find(params[:id])
        if @period.update_attributes(period_params)
            redirect_to periods_path    
        else
            render 'edit'    
        end
    end
    
    def create
        period = Period.new(period_params)
        period.teacher = current_teacher
        period.shortcode = Period.create_shortcode
        period.save
        redirect_to periods_path
    end
    
    
    def get_students
        @students = Students.where(:period_id => params[:period_id])
        respond_to do |format|
            format.js
        end
    end

    
    private
    def period_params
        params.require(:period).permit(:title, :number)    
    end

end
