class Student < ActiveRecord::Base
    belongs_to :period
    has_one :teacher
    
    phony_normalize :phone_number, :default_country_code => 'US'
    
    validates :name, :phone_number, presence: true
    validates :phone_number, :phony_plausible => true
    
    def display_name
        names = []
        if !self.first_name.nil? && !self.first_name.empty?
            names.push(self.first_name)
        end
        if !self.last_name.nil? && !self.last_name.empty?
            names.push(self.last_name)
        end
        
        if(names.count>0)
            return names.join(' ')
        else
            return nil
        end
    end
    
    def toggle_lock
        self.toggle(:locked)
        self.save
        return self.locked
    end
end
