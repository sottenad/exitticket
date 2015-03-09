class ResponseSet < ActiveRecord::Base
    has_many :responses
    belongs_to :question
    belongs_to :period
    
    validates :period_id, :send_time, :question_id, presence: true
    validates :sms_sent, :inclusion => {:in => [true, false]}
    
    def complete_responses
        period = Period.find(self.period_id)
        responses = Response.where(student_id: period.students).where.not(response_text: '')
        return responses
    end
end
