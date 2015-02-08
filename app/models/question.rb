class Question < ActiveRecord::Base
    validates :teacher_id, :prompt, presence: true
    validates :rating_total, :rating_count, numericality: true
    validates :prompt, length: {maximum: 300}
    
end
