class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin, :only =>[:index, :create]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to root_path, notice: "User created successfully"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def admin
    redirect_to(root_path) unless current_user.admin?
  end
end
