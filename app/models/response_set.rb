class ResponseSet < ActiveRecord::Base
    include SmsUtils
    
    has_many :responses
    belongs_to :question
    belongs_to :period
    
    validates :period_id, :send_time, :question_id, presence: true
    validates :sms_sent, :inclusion => {:in => [true, false]}
    
    def complete_responses
        period = Period.find(self.period_id)
        responses = Response.where(student_id: period.students, response_set_id: self.id).where('response_text is not null')
        return responses
    end
    
    def send_sms
        send_response_set(self)    
    end
    
    def average_response_score
        avg = Response.where(response_set_id: self.id).where('response_text is not null').average(:rating)
        return :id => self.id, :average_score => avg
    end
    
end
