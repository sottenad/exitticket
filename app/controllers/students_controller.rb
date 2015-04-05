class StudentsController < ApplicationController
    
    before_action :authenticate_teacher!, :only => [:edit, :update]
    layout :which_layout
    
    
    def new
      @period = Period.where("lower(shortcode) = ?", params[:id].downcase).first
      @student = Student.new
    end
    
    def create
        @student = Student.new(student_params) 
        @student.locked = false
        respond_to do |format|
          if @student.save
            format.js 
            format.json { render json: @student }
            format.html { redirect_to joined_path }
          else
            @period = Period.find_by(shortcode: params[:id])
            format.json { render json: @student.errors.full_messages, status: :unprocessable_entity }
            format.html {render :new}
          end
        end
    end
    
    def edit
        @student = Student.find(params[:id])
    end
    
    def update
        @student = Student.find(params[:id])
        if @student.update_attributes(student_params)
            redirect_to period_path(@student.period_id)    
        else
            render 'edit'    
        end        
    end
    
    def destroy
        @student = Student.find(params[:id])
        @student.delete
        redirect_to :back
    end
    
    def joined
       @link = ActionController::Base.helpers.asset_url('vcard.vcf') 
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
        
    def download_vcard
      respond_to do |format|
        format.vcf do
            puts ActionController::Base.helpers.asset_url('vcard.vcf') 
          tmp_file = open('http://localhost:3000/'+ActionController::Base.helpers.asset_url('vcard.vcf'))
          send_data tmp_file.read, :filename => 'exitslip.vcf', :type => :vcf # Send the actual file with proper mime-type
        end
      end 
    end
    

    
    private 
    def student_params
        params.require(:student).permit(:phone_number, :email, :period_id, :teacher_id, :name)
    end
    
    def which_layout
        if params[:action] == 'edit'
            return 'app'
        else
            return 'marketing'
        end
        
    end
    
end
