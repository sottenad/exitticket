class RegistrationsController < Devise::RegistrationsController

    #want to add the users time zone from the client-side
    def create
        super
        if resource.save    
            resource.time_zone = cookies[:jstz_time_zone]
            resource.save
        end
    end
    
    def update
        super
        if resource.save    
            resource.time_zone = cookies[:jstz_time_zone]
            resource.save
        end
    end
    
  private

  def sign_up_params
    params.require(:teacher).permit(:password, :password_confirmation, :email) 
  end

  def account_update_params
    #params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    params.require(:teacher).permit(:current_password, :username, :email, :first_name, :last_name, :avatar, :time_zone) 
  end
end