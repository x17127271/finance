class UsersController < ApplicationController
    before_action :authorized, only: [:show]
    
    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        @user.save
        redirect_to @user
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to action: 'new'
      end
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
  