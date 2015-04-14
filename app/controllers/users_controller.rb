class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      format.html { redirect_to cards_url, notice: "User was successfully created." }
    else
      format.html { render :new }
    end
  end

  def update
    if @user.update(user_params)
      format.html { redirect_to @user, notice: "User was successfully updated." }
    else
      format.html { render :edit }
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: "User was successfully destroyed." }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
