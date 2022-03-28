class Api::CarsController < ApplicationController

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

      private
      def car_params
        params.require(:user).permit(:brand, :model, :model_year, :description, :rent_fee, :photo_url, :reserved, :likes_counter, :reservation_counter)
      end
end
