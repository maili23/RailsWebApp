class UserRegistrationsController < Devise::RegistrationsController
  
  def create
    
    super
    byebug
    if @user.persisted?
      UserMailer.welcome_mail(@user).deliver_now
    end
  end

  def edit
  end
  
  private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end