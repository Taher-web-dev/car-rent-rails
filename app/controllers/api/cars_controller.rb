# frozen_string_literal: true

module Api
  class CarsController < ApplicationController
    def index
      @cars = Car.all
      render json: { cars: @cars }
    end

    def create
      @car = Car.new(car_params)
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

    def update
      @car = Car.find(update_param[:id])
      if @car.update(update_param)
        render json: @car
      else
        render json: @car.errors, status: :unprocessable_entity
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

    def update_param
      params.require(:car).permit(:brand, :model, :model_year, :description, :rent_fee, :photo_url, :reserved,
      :likes_counter, :reservation_counter)
    end

    def car_params
      params.require(:car).permit(:brand, :model, :model_year, :description, :rent_fee, :photo_url, :reserved,
                                   :likes_counter, :reservation_counter)
    end
  end
end