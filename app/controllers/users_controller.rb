class UsersController < ApplicationController

  before_filter :authenticate_admin
  before_action :load_user, only: [:edit, :update, :ban, :destroy]

  def edit
  end

  def update
    @user.update_attributes user_params
    render :edit
  end

  def ban
    @user.update_attributes banned: !@user.banned
    redirect_to :back
  end

  def destroy
    @user.destroy
    redirect_to :back
  end

  private

    def authenticate_admin
      if !current_user.try(:admin)
        flash[:notice] = "You should be an admin to access this URL"
        redirect_to root_path
      end
    end

    def load_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :about, :avatar, :email, :password, :password_confirmation)
    end

end
