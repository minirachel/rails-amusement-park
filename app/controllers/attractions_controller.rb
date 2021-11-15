class AttractionsController < ApplicationController
    before_action :require_admin, only: [:new, :create]

    def new
        @attraction = Attraction.new
        @user = User.find_by(id: current_user.id)
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def index
        @attractions = Attraction.all
        @user = User.find_by(id: current_user.id)
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: current_user.id)
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: current_user.id)
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
    end

    def require_admin
        @user = User.find_by(id: current_user.id)
        @user.admin?
    end

end