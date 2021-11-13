class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def index
        @session = session
    end

    # may need to EDIT session delete to clear more params??
    def destroy
        if !session[:name].nil?
            session.delete :name
        end
    end
end