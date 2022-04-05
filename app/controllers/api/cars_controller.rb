# frozen_string_literal: true

module Api
  class CarsController < ApplicationController
    def index
      @cars = Car.all
      render json: { cars: @cars }
    end

    def create
      @car = Car.new(car_param)
      if @car.save
        respond_to do |format|
          format.json { render json: 'car created sucessfully'.to_json, status: :ok }
        end
      else
        respond_to do |format|
          format.json { render json: 'Something went wrong'.to_json, status: :ok }
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
