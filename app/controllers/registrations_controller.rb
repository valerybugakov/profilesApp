class RegistrationsController < Devise::RegistrationsController

  def index
    @users = User.all.page params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def remove_avatar
    @user = User.find(params[:id])
    @user.avatar = nil
    @user.save
    redirect_to edit_user_registration_path, flash: { success: 'User profile avatar has been removed.' }
  end

  private

    def sign_up_params
      params.require(:user).permit(:name, :about, :avatar, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :about, :avatar, :email, :password, :password_confirmation, :current_password)
    end

end
