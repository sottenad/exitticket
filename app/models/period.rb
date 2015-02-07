class Period < ActiveRecord::Base
    has_many :students
    belongs_to :teacher

    def self.create_shortcode
        return (0...6).map { (65 + rand(26)).chr }.join    
    end
end
