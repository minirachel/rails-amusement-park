class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/users/new'
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        @attractions = Attraction.all
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
    end

    def require_login
        # return head(:forbidden) unless session.include? :user_id
        unless session.include? :user_id
            redirect_to root_path
        end
    end
end