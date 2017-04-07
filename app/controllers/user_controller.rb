class UserController < ApplicationController
  def index
    @users = User.all
  end

  def create
    newUser = User.create(user_params)
    # redirect_to :action => :show, :id => User.create(user_params)
    redirect_to "/login"
    
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
    @spots = Spot.all
  end

  def destroy
  end

  def show
    @user = User.find(params[:id])
    @spots = Spot.all
  end

  def user_params
   params.require(:user).permit(:name, :email, :password, :spot_ids => [])
  end
end