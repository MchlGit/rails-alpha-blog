class UsersController < ApplicationController
  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog, #{@user.username}! You've successfully created an account."
      redirect_to articles_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
