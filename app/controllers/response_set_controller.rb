class ResponseSetController < ApplicationController
    before_action :authenticate_teacher!
    layout 'app'
    
  def index
      
      
  end

  def new
      @exitslip = ResponseSet.new
  end

  def show
  end

  def edit
  end
end
