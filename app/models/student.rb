class Student < ActiveRecord::Base
    
    include TwilioUtils
    
    belongs_to :period
    has_one :teacher
    
    validates :name, presence: true
    validates_formatting_of :phone_number, :using => :us_phone
    
    def toggle_lock
        self.toggle(:locked)
        self.save
        return self.locked
    end
    
    def send_student_message(message)
        num = self.phone_number
        if Student.send_sms(num, message)
            return true
        end
    end
end
