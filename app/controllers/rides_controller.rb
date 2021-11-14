class RidesController < ApplicationController


    def new
    end

    def create
        @user = current_user
        @user.rides.take_ride
    end
end