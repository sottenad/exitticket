class StudentsController < ApplicationController
    
    layout "marketing"
    
    
  def new
      @period = Period.find_by(shortcode: params[:id])
      @student = Student.new
  end
    
  def create
      @student = Student.new(student_params) 
      @student.locked = false
      if @student.save
        redirect_to joined_path
      else
        @period = Period.find_by(shortcode: params[:id])
        render :new
      end
  end
    
    def destroy
        @student = Student.find(params[:id])
        @student.delete
        redirect_to :back
    end

    def sendMessage
        @student = Student.find(params[:id])
        message = 'I am coming from the controller'
        if @student.send_student_message(message)
            render plain: 'hello'
        end
    end

    def toggle_lock
        student = Student.find(params[:id])
        if student.toggle_lock
            render :json => student.to_json
        else
            render :json => student.to_json
        end
    end
    
    
    
    private 
    def student_params
        params.require(:student).permit(:phone_number, :email, :period_id, :teacher_id, :name)
    end
    
end
