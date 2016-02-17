class QuestionsController < ApplicationController
    before_action :authenticate_teacher!
    layout 'application'
    
    def index
      @questions = Question.where(teacher_id: current_teacher.id)
    end

    def new
      @question = Question.new
    end
    
    def destroy
        question = Question.find(params[:id])
        question.destroy
        redirect_to questions_path 
    end
    
    def create
        question = Question.new(question_params)
        question.teacher_id = current_teacher.id
        question.rating_total = 0;
        question.rating_count = 0;
        
        if(question.save)
            redirect_to questions_path
        end
    end
    
    private 
    def question_params
        params.require(:question).permit(:prompt)
    end
end
