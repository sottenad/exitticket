class StudentsController < ApplicationController
  def new
      @period = Period.find_by(shortcode: params[:id])
      @student = Student.new
  end
    
  def create
      @student = Student.new(student_params) 
      @student.save
      redirect_to joined_path
  end
    
    private 
    def student_params
        params.require(:student).permit(:phone_number, :email, :period_id)
    end
    
end
