# frozen_string_literal: true

module Api
  class CarsController < ApplicationController
    def index
      @cars = Car.all
      render json: { cars: @cars }
    end

    def create
      @car = Car.new(car_params)
      respond_to do |format|
        if @car.save
          format.json { render :show, status: :created, location: @car }
        else
          format.json { render json: @car.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy 
      @car = Car.find(params[:id])
      if @car.destroy
        respond_to do |format|
          format.json { render json: 'Car deleted successfully.'.to_json, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: 'Car could not be deleted!'.to_json, status: :not_ok }
        end
      end
    end
    private

    def car_params
      params.require(:user).permit(:brand, :model, :model_year, :description, :rent_fee, :photo_url, :reserved,
                                   :likes_counter, :reservation_counter)
    end
  end
end
