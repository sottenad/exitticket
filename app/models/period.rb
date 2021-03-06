class Period < ActiveRecord::Base
    has_many :students
    has_many :response_sets
    belongs_to :color
    belongs_to :teacher
    
    validates :title, presence: true
    validates :number, presence: true, numericality: {only_integers:true, less_than: 8}

    def self.create_shortcode
        return (0...6).map { (65 + rand(26)).chr }.join    
    end
    
    def show_title
        val = "Period #{self.number}: #{self.title}"
       return val
    end
    
    def show_title_and_count
        studentsString = ActionController::Base.helpers.pluralize(self.students.count, 'Student')
        val = "Period #{self.number}: #{self.title} - #{studentsString}"
       return val
    end
    
    
end
