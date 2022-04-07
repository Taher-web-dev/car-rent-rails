# frozen_string_literal: true

module Api
  class CarsController < ApplicationController
    def_param_group :car do
      param :id, :number, desc: 'Cars id'
      param :car, Hash do
        param :brand, String, required: true, desc:'Cars brand'
        param :model, String, required: true, desc:'Cars model'
        param :model_year, String, required: true, desc:'Cars model year'
        param :photo_url, String, required: true, desc:'Cars photo'
        param :description, String, required: true, desc:'Cars description'
        param :reserved, String, required: false, desc:'Cars reservation statut'
        param :rent_fee, String, required: false, desc:'Cars rent hourly fee'
        param :likes_counter, String, required: false, desc:'Cars likes counter'
        param :reservation_counter, String, required: false, desc:'Cars history reservation counter'
      end
      property :model, String, desc:'Cars model'
      property :model_year, String, desc:'Cars model year'
      property :photo_url, String, desc:'Cars photo'
      property :description, String, desc:'Cars description'
      property :reserved, String, desc:'Cars reservation statut'
      property :rent_fee, String, desc:'Cars rent hourly fee'
      property :likes_counter, String, desc:'Cars likes counter'
      property :reservation_counter, String, desc:'Cars history reservation counter'
      property :created_at, String, desc: 'Date of the car creation'
      property :updated_at, String, desc: 'Last time the car was updated'

    end
    api :GET, '/cars/', 'Shows all cars'
    def index
      @cars = Car.all
      render json: { cars: @cars }
    end
    api :POST, '/cars/', 'Create a new car'  
    returns :car, code: 200, desc: 'Created car'  
    param_group :car
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
    api :DELETE, '/cars/:id', 'Delete a specific car'
    returns code: 200, desc: 'Car deleted successfully.'
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
