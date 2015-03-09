class ResponseController < ApplicationController
    def inbound
        responses = Response.where(phone_number: params[:msisdn]).where("response_text is null").order(created_at: :desc)
        @resp = responses.first
        @resp.response_text = params[:text]
        if @resp.save
            render :nothing => true, :status => 200, :content_type => 'text/html'
        else
            render :nothing => true, :status => 400, :content_type => 'text/html'
        end
        
    end
    
end
