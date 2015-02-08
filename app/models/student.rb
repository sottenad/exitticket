class Student < ActiveRecord::Base
    belongs_to :period
    has_one :teacher
    
    validates :name, presence: true
    validates_formatting_of :phone_number, :using => :us_phone
    
    def toggle_lock
        self.toggle(:locked)
        self.save
        return self.locked
    end
    

end
