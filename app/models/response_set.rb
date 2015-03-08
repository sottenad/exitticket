class ResponseSet < ActiveRecord::Base
    has_many :responses
    belongs_to :question
    belongs_to :period
    
    validates :period_id, :send_time, :question_id, presence: true
    
end
