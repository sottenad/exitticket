class ColorsController < ApplicationController
    layout 'app'
    
     def index
       @colors =  Color.all
    end
    
    def new
       @color = Color.new 
    end
    
    def show
        @color = Color.find(params[:id])
    end
    
    def edit 
        @color = Color.find(params[:id])    
    end
    
    def update
        @color = Color.find(params[:id])
        if @color.update_attributes(color_params)
            redirect_to colors_path    
        else
            render 'edit'    
        end
    end
    
    def create
        color = Color.new(color_params)
        color.save
        redirect_to colors_path
    end
    
    def destroy
        color = Color.find(params[:id])
        color.destroy
        redirect_to colors_path 
    end
    
    
    private
    def color_params
        params.require(:color).permit(:name, :hex)    
    end
    
end