class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    
    

    
    mount_uploader :avatar, AvatarUploader
    
    has_many :periods
    has_many :students
    
    
    #returns a suitable display name (first_name or email)
    def display_name
        if self.first_name.nil? || self.first_name.empty?
            return self.email
        else
            return self.first_name
        end
    end
    
end
