class ResponseController < ApplicationController
    def inbound
        responses = Response.where(phone_number: params[:msisdn]).where("response_text is null").order(created_at: :desc)
        if responses.count > 0
            @resp = responses.first
            @resp.response_text = params[:text]
            @resp.response_time = Time.now
            if @resp.save
                render :nothing => true, :status => 200, :content_type => 'text/html'
            end
        else
            render :nothing => true, :status => 400, :content_type => 'text/html'
        end
        
    end
    
    def set_rating
        #todo:check teacher
        @resp = Response.find(params[:id])
        @student = @resp.student
        @teacher = @student.teacher
        if @teacher.id == current_teacher.id
            @resp.rating = params[:rating]
            if @resp.save
                render :json => @resp.to_json
            end
        else
            render :nothing => true, :status => 400, :content_type => 'application/json'
        end
    end
    
end
