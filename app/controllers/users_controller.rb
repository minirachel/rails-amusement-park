class UsersController < ApplicationController
    
    def new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height)
    end
end