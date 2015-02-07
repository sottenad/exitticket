class Student < ActiveRecord::Base
    belongs_to :period
    has_one :teacher
    
end
