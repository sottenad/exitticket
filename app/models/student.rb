class Student < ActiveRecord::Base
    
    include SmsUtils
    
    belongs_to :period
    belongs_to :teacher
    has_many :responses
    
    
    phony_normalize :phone_number, :default_country_code => 'US'
    validates :phone_number, uniqueness: true, :phony_plausible => true, :allow_blank => true, :allow_nil => true
    validates :name, :presence => true
    
    before_validation :stripphonenumber
    
    def average_score
        return self.responses.average(:rating)
    end
    
    def toggle_lock
        self.toggle(:locked)
        self.save
        return self.locked
    end
    
    def send_student_message(message)
        num = self.phone_number
        if !self.locked 
            if Student.send_sms(num, message)
                return true
            end
        end
    end
    
    def formatted_number
        Phony.format( self.phone_number, :format => :international) 
    end
    
    def stripphonenumber
        if !self.phone_number.nil?
            self.phone_number.gsub(/\D/,'')
        end
    end
end
