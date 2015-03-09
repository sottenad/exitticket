class Student < ActiveRecord::Base
    
    include SmsUtils
    
    belongs_to :period
    has_one :teacher
    phony_normalize :phone_number, :default_country_code => 'US'
    validates :phone_number, uniqueness: true
    validates :name, presence: true
    
    
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
