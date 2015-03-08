class ResponseController < ApplicationController
    def inbound
        resp = Response.new
        student = Student.find_by_phone_number(
        
        resp.response_text = params['text']
        
        resp.student_id = 
    end
    
end
