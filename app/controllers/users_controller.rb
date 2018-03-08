class UsersController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user)

    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    if  @user = current_user
    if @user.id !=params[:id].to_i
      redirect_to edit_user_path(@user)
    end
  else
    flash[:errors] = ["You must be logged in to go there."]
    redirect_to login_path
  end
  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
