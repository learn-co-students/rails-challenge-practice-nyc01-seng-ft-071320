class BuildingsController < ApplicationController
    def index
        @buildings = Building.all
    end

    def show
        @building = Building.find(params[:id])
    end

    def new
        @building = Building.new
    end

    def edit
        @building = Building.find(params[:id])
    end

    def create
        @building = Building.create(strong_params)
        redirect_to buildings_path(@building)
    end

    def update
        @building = Building.find(params[:id])
        @building.update(strong_params)
        redirect_to buildings_path
    end

    def destroy
        @building = Building.find(params[:id])
        @building.destroy
        redirect_to buildings_path
    end

    private

    def strong_params
        params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
    end
    

end